//
//  FSRetryOptions.h
//  Filestack
//
//  Created by Kevin Minnick on 3/8/17.
//  Copyright © 2017 Filestack. All rights reserved.
//

@import Foundation;

@interface FSRetryOptions : NSObject

@property (nonatomic) NSInteger retries;
@property (nonatomic) NSDecimal factor;
@property (nonatomic) NSInteger minTimeout;
@property (nonatomic) NSInteger maxTimeout;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary NS_DESIGNATED_INITIALIZER;

@end
