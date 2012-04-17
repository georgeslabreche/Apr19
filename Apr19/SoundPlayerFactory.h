//
//  SoundPlayerFactory.h
//  Apr19
//
//  Created by Georges Labreche on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVAudioPlayer.h>

@interface SoundPlayerFactory : NSObject

- (AVAudioPlayer *) buildPlayerWithMp3Resource:(NSString*)mp3Filename inDirectory:(NSString*) directoryName;

@end
