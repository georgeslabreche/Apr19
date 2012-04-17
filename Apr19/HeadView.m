//
//  HeadView.m
//  Apr19
//
//  Created by Georges Labreche on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include <stdlib.h>
#import "HeadView.h"

@implementation HeadView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSingleTapGesture];
    }
    return self;
}

// init single tap gestures on head. Not working. Maybe conflicting with gesture recognition of main view?
- (void) initSingleTapGesture{
    NSLog(@"Initialise single tap gesture handler...");
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget: self action: @selector(handleSingleTap:)
                                        ];
    singleTap.numberOfTapsRequired = 1;
}

// Single tap handler
- (void) handleSingleTap:(UITapGestureRecognizer *) recognizer{
    NSLog(@"Evasive action!");
    
    // Another head is going to take this heads place, get out of the way!
    
    // Animation
    [UIView animateWithDuration: 0.5 
                          delay: 0.0 
                        options: UIViewAnimationOptionCurveEaseInOut
                     animations: ^{
                         // define animation
                         self.center =  CGPointMake(self.center.x + HEAD_IMAGE_AVERAGE_WIDTH, self.center.y + HEAD_IMAGE_AVERAGE_HEIGHT);
                     }
                     completion: NULL
     ]; 

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
