//
//  MainView.m
//  Apr19
//
//  Created by Computerlab on 4/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainView.h"
#import "PlayView.h"
#import "CanvasView.h"


@implementation MainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        views = [NSArray arrayWithObjects:
                 [[PlayView alloc] initWithFrame: self.bounds],
                 [[CanvasView alloc] initWithFrame: self.bounds],
                 nil
                 ];
        
		index = 0;
		[self addSubview: [views objectAtIndex: index]];

        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self action: @selector(swipe:)
                                             ];
        singleTap.numberOfTapsRequired = 2;
        [self addGestureRecognizer: singleTap];
        
        
        // Notification
        device = [UIDevice currentDevice];
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        
        //Send the handleDeviceRotate message to the views
        //when we get a OrientationDidChange notification from the device.
        [center addObserver: [views objectAtIndex: 0]
                   selector: @selector(handleDeviceRotate)
                       name: UIDeviceOrientationDidChangeNotification
                     object: device
         ];
        
        [center addObserver: [views objectAtIndex: 1]
                   selector: @selector(handleDeviceRotate)
                       name: UIDeviceOrientationDidChangeNotification
                     object: device
         ];
        [device beginGeneratingDeviceOrientationNotifications];
        
    }
    return self;
}


- (void) swipe: (UISwipeGestureRecognizer *) recognizer {
    NSLog(@"Switch view.");
    // Toggle the index
    NSUInteger newIndex = 1 - index;
 
    [UIView transitionFromView: [views objectAtIndex: index]
                        toView: [views objectAtIndex: newIndex]
                      duration: 1.0
                       options: UIViewAnimationOptionTransitionCurlUp
                    completion: NULL
     ];
 
    index = newIndex;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
