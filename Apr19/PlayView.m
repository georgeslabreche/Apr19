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

NSInteger HEAD_IMAGE_AVERAGE_WIDTH = 60;
NSInteger HEAD_IMAGE_AVERAGE_HEIGHT = 100;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor greenColor];

        NSArray *imagePaths = [[NSBundle mainBundle] pathsForResourcesOfType:@"png" inDirectory:@"heads"];

        for (NSInteger i = 0; i < [imagePaths count]; i++){
            NSString *imagePath = [imagePaths objectAtIndex: i];
            //NSLog (@"Loading image: %@", imagePath);
            
            UIImage *headImage = [UIImage imageWithContentsOfFile: imagePath];
            if (headImage == nil) {
                NSLog(@"could not find the image");
            }

            
            // no need for seed with arc4random()!
            CGFloat randomX =  arc4random() % ((NSInteger)self.bounds.size.width - HEAD_IMAGE_AVERAGE_WIDTH);
            CGFloat randomY =  arc4random() % ((NSInteger)self.bounds.size.height - HEAD_IMAGE_AVERAGE_HEIGHT);
   
            NSLog(@"head coordinate (%g,%g)", randomX, randomY);
            CGRect headViewRect = CGRectMake(randomX, randomY, headImage.size.width, headImage.size.height);
            HeadView *headView = [[HeadView alloc]initWithFrame:headViewRect];
                
            if(headImage != nil){
                headView.image = headImage;
            }
                
            [self addSubview:headView];

        }
        
   
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
