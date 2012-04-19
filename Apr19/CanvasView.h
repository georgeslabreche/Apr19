//
//  CanvasView.h
//  Apr19
//
//  Created by Georges Labreche on 4/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CanvasView : UIView{
    CGPoint startPoint;
    
    UIImageView *drawImage;
}

- (void) startDrawingLineFromStartPoint: (CGPoint) point;
- (void) stopDrawingLineToEndPoint: (CGPoint) point;


@end