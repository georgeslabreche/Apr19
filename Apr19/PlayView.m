//
//  PlayView.m
//  Apr19
//
//  Created by Georges Labreche on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include <stdlib.h>
#import "PlayView.h"
#import "HeadView.h"


@implementation PlayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // background colour of our main view
        self.backgroundColor = [UIColor greenColor];
        
        [self initFloatingHeads];
        [self initPinchGesture];
        [self initRotationGesture];
        
   
    }
    return self;
}

// init floating heads
- (void) initFloatingHeads{
    NSLog(@"Initialise floating heads...");
    
    // Init set that will contain the head views
    headViews = [[NSMutableSet alloc] init];	
    
    // Get the path of the head images.
    NSArray *headImagePaths = [[NSBundle mainBundle] pathsForResourcesOfType:@"png" inDirectory:@"heads"];
    
    // Create a HeadView for every head image.
    for (NSInteger i = 0; i < [headImagePaths count]; i++){
        NSString *headImagePath = [headImagePaths objectAtIndex: i];
        
        // Create image object
        UIImage *headImage = [UIImage imageWithContentsOfFile: headImagePath];
        if (headImage == nil) {
            NSLog(@"Could not find the image: %@", headImagePath);
        }else{
            NSLog (@"Loaded image: %@", headImagePath);
        }
        
        // Generate random coordinates for the head view to be rendered at.
        // no need for seed with arc4random()!
        CGFloat randomX =  arc4random() % ((NSInteger)self.bounds.size.width - HEAD_IMAGE_AVERAGE_WIDTH);
        CGFloat randomY =  arc4random() % ((NSInteger)self.bounds.size.height - HEAD_IMAGE_AVERAGE_HEIGHT);
        
        NSLog(@"head coordinate (%g,%g)", randomX, randomY);
        CGRect headViewRect = CGRectMake(randomX, randomY, headImage.size.width, headImage.size.height);
        HeadView *headView = [[HeadView alloc]initWithFrame:headViewRect];
        
        if(headImage != nil){
            headView.image = headImage;
        }
        
        // Keep reference of the head views so that we can operate on them
        [headViews addObject:headView];
        
        // Add created head view as a subview of our main view.
        [self addSubview:headView];
        
    } 
}

// init pinch gesture handler
- (void) initPinchGesture{
    NSLog(@"Initialise pinch gesture handler...");
    
    // Register pinch gesture recognizer
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc]
                                                 initWithTarget: self action: @selector(handlePinch:)
                                                 ];
    
    [self handlePinch: pinchRecognizer];
    [self addGestureRecognizer: pinchRecognizer];
}

// init rotation gesture handler
- (void) initRotationGesture{
    NSLog(@"Initialise rotation gesture handler...");
    
    // Register rotation gesture recognizer
    UIRotationGestureRecognizer *rotationRecognizer = [[UIRotationGestureRecognizer alloc]
                                                       initWithTarget:self action:@selector(handleRotation:)
                                                       ];
    [self handleRotation: rotationRecognizer];
    [self addGestureRecognizer:rotationRecognizer];
}

// on view touch
- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
    
    // Using [event allTouches] because for some reason touches.count isn't behaving as expected.
    NSSet *allTouches = [event allTouches];
  
	if (allTouches.count == 1) {
        
        // Get a random index for the head view set
        NSInteger randomHeadViewIndex = arc4random() % headViews.count;
        
        // Get a random head view with the random index
        NSArray *headViewArray = [headViews allObjects];
        HeadView *randomHeadView = [headViewArray objectAtIndex:randomHeadViewIndex];
        
        // Animation
        [UIView animateWithDuration: 1.0 
                            delay: 0.0 
                            options: UIViewAnimationOptionCurveEaseInOut
                            animations: ^{
                                 // define animation
                                 randomHeadView.center = [[touches anyObject] locationInView: self];
                            }
                            completion: NULL
        ]; 
		
	}
}

// Enable simultaneaous gesture handling... not working. Maybe only works with UIViewController and not UIView?
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

// handle pinch
- (void)handlePinch:(UIPinchGestureRecognizer *)recognizer{
        
    // Operate on all heads
    NSArray *headViewArray = [headViews allObjects];

    // Shrink or grow heads depending on the recognizer's scale.
    for(int i = 0; i < headViewArray.count; i++){
        HeadView *headView = [headViewArray objectAtIndex:i];

        [UIView animateWithDuration: 0.0 
                              delay: 0.0 
                            options: UIViewAnimationOptionCurveEaseInOut
                         animations: ^{
                             // define animation
                             headView.transform = CGAffineTransformMakeScale(recognizer.scale, recognizer.scale);
                         }
                         completion: NULL
         ];
    }
}

// handle rotation
- (void)handleRotation:(UIRotationGestureRecognizer *)recognizer{
    
    // Operate on all heads
    NSArray *headViewArray = [headViews allObjects];
    
    // Rotate head clockwise or counter-clockwise depending on the rotation's angle and direction.
    for(int i = 0; i < headViewArray.count; i++){
        HeadView *headView = [headViewArray objectAtIndex:i];
        [UIView animateWithDuration: 0.0 
                              delay: 0.0 
                            options: UIViewAnimationOptionCurveEaseInOut
                         animations: ^{
                             // define animation
                             headView.transform = CGAffineTransformMakeRotation(M_PI * recognizer.rotation);
                         }
                         completion: NULL
         ];
    }
    
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
/*
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
