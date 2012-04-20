//
//  CanvasView.m
//  Apr19
//
//  Created by Georges Labreche on 4/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CanvasView.h"

@implementation CanvasView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        
        drawImage = [[UIImageView alloc] initWithFrame:self.bounds];
        drawImage.backgroundColor = [UIColor greenColor];
        [self addSubview:drawImage];
        
    }
    return self;
}

// On touch down
- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
    if (touches.count > 0) {
        
        
        // We touch the screen for the first time.
        // Just use the first touch coordinates as the init coordinates.
        
        UITouch *touch = [touches anyObject];
        CGPoint touchedPoint = [touch locationInView: drawImage];
        [self startDrawingLineFromStartPoint:touchedPoint];
        
    }
}

- (void) startDrawingLineFromStartPoint: (CGPoint) point{
    NSLog(@"Touched start point1 (%g, %g)", point.x, point.y);
    startPoint = point;
}


- (void) stopDrawingLineToEndPoint: (CGPoint) point{
    NSLog(@"Released from stop point1 (%g, %g)", point.x, point.y);
    UIGraphicsBeginImageContext(self.frame.size);
    
    // Set the image of our UIDrawView to the image currently displayed
    // We do this to preserve our drawing and not restart every time.
    [drawImage.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    CGContextSetLineCap(c, kCGLineCapRound);
    CGContextSetLineWidth(c, 3.0);
    CGContextSetRGBStrokeColor(c, 1.0, 0.0, 0.0, 1.0); // red opaque
    CGContextBeginPath(c);
    
    // Draw the line
    CGContextMoveToPoint(c, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(c, point.x, point.y);
    
    
    CGContextStrokePath(c);
    
    drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
}

// On touch release.
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *) event{
    if (touches.count > 0) {
        
        UITouch *touch = [touches anyObject];
        CGPoint touchedPoint = [touch locationInView: drawImage];
        [self stopDrawingLineToEndPoint:touchedPoint];
    }
}


- (void)handleDeviceRotate{
    //UIDeviceOrientation
    NSUInteger rotationId = [UIDevice currentDevice].orientation;
    NSLog(@"Rotated device: %i", rotationId);
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