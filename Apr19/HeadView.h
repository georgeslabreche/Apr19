//
//  HeadView.h
//  Apr19
//
//  Created by Georges Labreche on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>
#import "Head.h"


@interface HeadView: UIImageView {
}

@property NSInteger headId;
@property AVAudioPlayer* headMoveAudioPlayer;

// custom constructor
-(id)initWithFrame:(CGRect)frame andHeadId:(NSInteger) headIdentifier;


@end
