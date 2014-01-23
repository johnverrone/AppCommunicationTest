//
//  AppUrl.h
//  AppCommunicationTest
//
//  Created by John Verrone on 4/11/13.
//  Copyright (c) 2013 John Verrone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppUrl : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSNumber *appStoreId;

-(id)initWithName:(NSString *)name url:(NSString *)url;
-(id)initWithName:(NSString *)name url:(NSString *)url appStoreId:(NSNumber *)appId;

@end
