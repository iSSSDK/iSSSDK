//
//  SSURL.h
//  iSSSDK
//
//  Created by Ziwaixian on 5/10/17.
//  Copyright © 2017 Ziwaixian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSURL : NSURL

+(nullable instancetype)URLWithScheme:(nonnull NSString *)scheme
                                 user:(nullable NSString *)user
                             password:(nullable NSString*)password
                                 host:(nonnull NSString *)host
                                 port:(NSInteger)port
                                 path:(nullable NSString *)path
                                query:(nullable NSString*)query
                             fragment:(nullable NSString*)fragment;

@end
