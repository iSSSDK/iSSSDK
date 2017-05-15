//
//  ViewController.m
//  SSURLDataTaskSample
//
//  Created by Ziwaixian on 5/14/17.
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
    
    [self testGet];
    //[self testPost];
    //[self testPostJSON];

}

-(void)testGet
{
    //get
    //https://en.wikipedia.org//wiki/Special:Search?search=isssdk&go=Go&searchToken=3ig5lotakise160f17pju2p1p
    SSURL* getURL=[SSURL URLWithScheme:@"https" user:nil password:nil host:@"en.wikipedia.org" port:-1 path:@"/wiki/Special:Search" query:@"search=isssdk&go=Go&searchToken=3ig5lotakise160f17pju2p1p" fragment:nil];
    NSLog(@"getURL:%@",getURL.absoluteString);
    
    [[SSURLDataTask sharedInstance] sendGetRequestWithURL:getURL timeOutInSeconds:10 replacingHeaderDictionary:nil appendingHeaderDictionary:nil completion:^(NSInteger statusCode, NSData * _Nullable data, NSStringEncoding responseTextEncoding, NSString * _Nullable MIMEType, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(error){
            NSLog(@"Something went wrong.");
        }
        
        NSLog(@"SSURLDataTask sendGetRequestWithURL statusCode:%zd",statusCode);
        NSLog(@"SSURLDataTask sendGetRequestWithURL call's data length:%zd",data.length);
        
        if((NSInteger)responseTextEncoding > -1){
            NSLog(@"SSURLDataTask sendGetRequestWithURL call's data result:%@",[[NSString alloc] initWithData:data encoding:responseTextEncoding]);
        }
    }];
    
}

-(void)testPost
{
    //post
    //https://en.wikipedia.org/w/index.php?title=Special:UserLogin&returnto=Main+Page
    SSURL* postURL=[SSURL URLWithScheme:@"https" user:nil password:nil host:@"en.wikipedia.org" port:-1 path:@"/w/index.php" query:@"title=Special:UserLogin&returnto=Main+Page" fragment:nil];
    NSLog(@"postURL:%@",postURL.absoluteString);
    
    [[SSURLDataTask sharedInstance] sendPostRequestWithURL:postURL timeOutInSeconds:10 replacingHeaderDictionary:nil appendingHeaderDictionary:nil entityBody:@"wpName=wpName&wpPassword=wpPassword" completion:^(NSInteger statusCode, NSData * _Nullable data, NSStringEncoding responseTextEncoding, NSString * _Nullable MIMEType, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(error){
            NSLog(@"Something went wrong.");
        }
        
        NSLog(@"SSURLDataTask sendPostRequestWithURL statusCode:%zd",statusCode);
        NSLog(@"SSURLDataTask sendPostRequestWithURL call's data length:%zd",data.length);
        
        if((NSInteger)responseTextEncoding > -1){
            NSLog(@"SSURLDataTask sendPostRequestWithURL call's data result:%@",[[NSString alloc] initWithData:data encoding:responseTextEncoding]);
        }
    }];
}

-(void)testPostJSON
{
    //post json
    //https://api.github.com/authorizations
    SSURL* postJSONURL=[SSURL URLWithScheme:@"https" user:nil password:nil host:@"api.github.com" port:-1 path:@"/authorizations" query:nil fragment:nil];
    
    NSLog(@"postJSONURL:%@",postJSONURL.absoluteString);
    
    NSString* basicAuthorization=[[NSString alloc] initWithData:[[@"username:password" dataUsingEncoding:NSUTF8StringEncoding] base64EncodedDataWithOptions:NSDataBase64EncodingEndLineWithLineFeed] encoding:NSUTF8StringEncoding];
    NSString* authorization=[@"Basic " stringByAppendingString:basicAuthorization];
    
    [[SSURLDataTask sharedInstance] postJSONRequestWithURL:postJSONURL timeOutInSeconds:10 replacingHeaderDictionary:@{@"Authorization":authorization} appendingHeaderDictionary:nil entityBody:@"{\"scopes\":[\"public_repo\"]}" completion:^(NSInteger statusCode, NSData * _Nullable data, NSStringEncoding responseTextEncoding, NSString * _Nullable MIMEType, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error){
            NSLog(@"Something went wrong.");
        }
        
        NSLog(@"SSURLDataTask postJSONRequestWithURL statusCode:%zd",statusCode);
        NSLog(@"SSURLDataTask postJSONRequestWithURL call's data length:%zd",data.length);
        
        if((NSInteger)responseTextEncoding > -1){
            NSLog(@"SSURLDataTask postJSONRequestWithURL call's data result:%@",[[NSString alloc] initWithData:data encoding:responseTextEncoding]);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
