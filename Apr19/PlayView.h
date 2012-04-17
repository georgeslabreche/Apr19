//
//  PlayView.h
//  Apr19
//
//  Created by Georges Labreche on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

// Implement the UIGestureRecognizerDelegate protocol so that we can process multiple gestures simultaneously.
@interface PlayView : UIView <UIGestureRecognizerDelegate>{
    NSMutableSet *headViews; 	
}


@end
