//
//  PlayView.h
//  Apr19
//
//  Created by Georges Labreche on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>

// Implement the UIGestureRecognizerDelegate protocol so that we can process multiple gestures simultaneously.
@interface PlayView : UIView <UIGestureRecognizerDelegate>{
    // Track previous pinch to figure out if we are getting wider or narrower.
    CGFloat previousPinchScale;	
    
    NSMutableSet *headViews;
    
    AVAudioPlayer *headSpinPlayer;
    AVAudioPlayer *headShrinkPlayer;
    AVAudioPlayer *headExpandPlayer;
}

@end
