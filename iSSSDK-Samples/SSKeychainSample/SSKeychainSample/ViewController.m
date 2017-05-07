//
//  ViewController.m
//  SSKeychainSample
//
//  Created by Ziwaixian on 5/6/17.
//  Copyright © 2017 Ziwaixian. All rights reserved.
//

@import iSSSDK;

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //
    SSKeychainStatus status= [SSKeychain addItemWithAccount:@"Ziwaixian" dataString:@"token" service:@"generic"];
    if(status==SSKeychainSecDuplicateItem){
        NSLog(@"already existing");
    }
    NSLog(@"Ziwaixian's token:%@",[SSKeychain copyMatchingItemWithAccount:@"Ziwaixian" service:@"generic"]);
    
    [SSKeychain updateItemWithAccount:@"Ziwaixian" dataString:@"tokenUpdated" service:@"generic"];
    NSLog(@"Ziwaixian's token:%@",[SSKeychain copyMatchingItemWithAccount:@"Ziwaixian" service:@"generic"]);
    //

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
