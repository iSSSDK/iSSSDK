//
//  SSURLDataTask.h
//  iSSSDK
//
//  Created by Ziwaixian on 5/8/17.
//  Copyright © 2017 Ziwaixian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSURLDataTask : NSObject
+ (nullable instancetype)sharedInstance;

-(void)sendRequestWithURL:(nonnull NSURL*)URL
         timeOutInSeconds:(NSTimeInterval)timeOutInSeconds
replacingHeaderDictionary:(nullable NSDictionary*)replacingHeaderDictionary
appendingHeaderDictionary:(nullable NSDictionary*)appendingHeaderDictionary
            reqeustMothed:(nonnull NSString*)reqeustMothed
           entityBodyData:(nullable NSData*)entityBodyData
               completion:(nullable void(^)(NSData* _Nullable data, NSStringEncoding responseTextEncoding, NSString* _Nullable MIMEType, NSURLResponse* _Nullable response, NSError* _Nullable error))completionHandler;

-(void)sendPostRequestWithURL:(nonnull NSURL*)URL
             timeOutInSeconds:(NSTimeInterval)timeOutInSeconds
    replacingHeaderDictionary:(nullable NSDictionary*)replacingHeaderDictionary
    appendingHeaderDictionary:(nullable NSDictionary*)appendingHeaderDictionary
                   entityBody:(nullable NSString*)entityBody
                   completion:(nullable void(^)(NSInteger statusCode, NSData * _Nullable data,  NSStringEncoding responseTextEncoding, NSString* _Nullable MIMEType, NSURLResponse* _Nullable response, NSError* _Nullable error))completionHandler;

-(void)sendGetRequestWithURL:(nonnull NSURL*)URL
            timeOutInSeconds:(NSTimeInterval)timeOutInSeconds
   replacingHeaderDictionary:(nullable NSDictionary*)replacingHeaderDictionary
   appendingHeaderDictionary:(nullable NSDictionary*)appendingHeaderDictionary
                  completion:(nullable void(^)(NSInteger statusCode, NSData * _Nullable data, NSStringEncoding responseTextEncoding, NSString* _Nullable MIMEType, NSURLResponse* _Nullable response, NSError* _Nullable error))completionHandler;

-(void)postJSONRequestWithURL:(nonnull NSURL*)URL
             timeOutInSeconds:(NSTimeInterval)timeOutInSeconds
    replacingHeaderDictionary:(nullable NSDictionary*)replacingHeaderDictionary
    appendingHeaderDictionary:(nullable NSDictionary*)appendingHeaderDictionary
                   entityBody:(nullable NSString*)entityBody
                   completion:(nullable void(^)(NSInteger statusCode, NSData * _Nullable data, NSStringEncoding responseTextEncoding, NSString* _Nullable MIMEType, NSURLResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end
