//
//  SSAVPlayerController.h
//  iSSSDK
//
//  Created by Ziwaixian on 6/17/17.
//  Copyright © 2017 Ziwaixian. All rights reserved.
//

#import "SSAVPlayerView.h"

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol SSAVPlayerControllerDelegate
-(void)SSAVPlayerControllerErrorOccurred:(nonnull NSError *)error;
@end

@interface SSAVPlayerController : NSObject

@property (nonatomic, weak, nullable)id <SSAVPlayerControllerDelegate>delegate;

-(void)playWithView:(nonnull SSAVPlayerView*)playerView URL:(nonnull NSURL*)URL repeated:(BOOL)repeated muted:(BOOL)muted fillMode:(nullable NSString *)fillMode;
-(void)fillVideoWithMode:(nonnull NSString *)fillMode;
-(void)play;
-(void)pause;
-(void)updateLayerFrame;

@end
