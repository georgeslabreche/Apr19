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
        // Initialization code
        // view will be red in case image wasn't loaded.
        self.backgroundColor = [UIColor redColor];
        
        
    }
    return self;
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
