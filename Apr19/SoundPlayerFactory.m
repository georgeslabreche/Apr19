//
//  SoundPlayerFactory.m
//  Apr19
//
//  Created by Georges Labreche on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SoundPlayerFactory.h"

@implementation SoundPlayerFactory

// Build an Audio Player with the given mp2 filename
- (AVAudioPlayer *) buildPlayerWithMp3Resource:(NSString*)mp3Filename inDirectory:(NSString*) directoryName{
    
    AVAudioPlayer *player;
    
    NSBundle *bundle = [NSBundle mainBundle];
    if (bundle == nil) {
        NSLog(@"could not get the main bundle.");
        return nil;
    }
    
    //The path is the filename.
    
    NSString *path = [bundle pathForResource: mp3Filename ofType: @"mp3" inDirectory:directoryName];
    if (path == nil) {
        NSLog(@"could not get the mp3 sound path.");
        return nil;
    }
    
    NSLog(@"path == \"%@\"", path);
    
    NSURL *url = [NSURL fileURLWithPath: path isDirectory: NO];
    NSLog(@"url == \"%@\"", url);
    
    NSError *error = nil;
    player = [[AVAudioPlayer alloc]
              initWithContentsOfURL: url error: &error];
    if (player == nil) {
        NSLog(@"error == %@", error);
        return nil;
    }
    
    // player properties
    player.volume = 2.0;
    player.numberOfLoops = 0;
    
    if (![player prepareToPlay]) {
        NSLog(@"could not prepare to play.");
        return nil;
    } 
    
    return player;
}


@end
