//
//  MainView.h
//  Apr19
//
//  Created by Georges Labreche on 4/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainView : UIView{
    //holds the two subviews we transtion between
	NSArray *views;
    
	//index in views of the currently displayed little view: 0 or 1
	NSUInteger index;
}

@end
