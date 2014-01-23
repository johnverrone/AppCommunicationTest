//
//  AppUrl.m
//  AppCommunicationTest
//
//  Created by John Verrone on 4/11/13.
//  Copyright (c) 2013 John Verrone. All rights reserved.
//

#import "AppUrl.h"

@implementation AppUrl

-(id)initWithName:(NSString *)name url:(NSString *)url {
    
    self = [super init];
    
    if (self) {
        _name = name;
        _url = url;
        _appStoreId = nil;
        return self;
    }
    return nil;
}

-(id)initWithName: (NSString *)name url:(NSString *)url appStoreId:(NSNumber *)appId {
    
    self = [super init];
    
    if (self) {
        _name = name;
        _url = url;
        _appStoreId = appId;
        return self;
    }
    return nil;
}

@end
