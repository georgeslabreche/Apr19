//
//  AppDelegate.h
//  Apr19
//
//  Created by Georges Labreche on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainView;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    MainView *mainView;
}

@property (strong, nonatomic) UIWindow *window;

@end
