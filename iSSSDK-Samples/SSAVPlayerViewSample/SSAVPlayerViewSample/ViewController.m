//
//  ViewController.m
//  SSAVPlayerViewSample
//
//  Created by Ziwaixian on 6/21/17.
//  Copyright © 2017 Ziwaixian. All rights reserved.
//

@import iSSSDK;

#import "ViewController.h"

@interface ViewController ()<SSAVPlayerControllerDelegate>

@property (nonatomic)SSAVPlayerController* palyerController;

@end

@implementation ViewController

-(void)SSAVPlayerControllerErrorOccurred:(nonnull NSError *)error
{
    NSLog(@"!SSAVPlayerControllerErrorOccurred:%@",error.localizedDescription);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [SSAVPlayerView class];
    self.palyerController=[SSAVPlayerController new];
}

- (void)viewWillAppear:(BOOL)animated {
    NSString *videoPath =[[NSBundle mainBundle] pathForResource:@"m" ofType:@"m4v"];
    if(videoPath){
        NSURL *videoURL = [NSURL fileURLWithPath:videoPath];
        if (videoURL){
            
            [self.palyerController playWithView:(SSAVPlayerView*)self.view URL:videoURL repeated:YES muted:NO fillMode:nil];
        }
    }
    
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.palyerController pause];
    
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
