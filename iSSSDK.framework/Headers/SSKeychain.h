//
//  SSKeychain.h
//  iSSSDK
//
//  Created by Ziwaixian on 4/30/17.
//  Copyright © 2017 Ziwaixian. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SSKeychainStatus) {
    
    SSKeychainSecSuccess,
    
    SSKeychainSecDuplicateItem,
    
    SSKeychainSecItemNotFound,
    
    SSKeychainSecAuthFailed,
    
    SSKeychainSecUnknown
};


@interface SSKeychain : NSObject

+ (SSKeychainStatus)addItemWithAccount:(nonnull NSString*)account
                             dataString:(nonnull NSString*)dataString
                                service:(nonnull NSString*)service;
+ (SSKeychainStatus)updateItemWithAccount:(nonnull NSString*)account
                                dataString:(nonnull NSString*)dataString
                                   service:(nonnull NSString*)service;
+ (nullable NSString *)copyMatchingItemWithAccount:(nonnull NSString*)account
                              service:(nonnull NSString*)service;
+ (SSKeychainStatus)deleteItemWithAccount:(nonnull NSString*)account
                                   service:(nonnull NSString*)service;

@end
