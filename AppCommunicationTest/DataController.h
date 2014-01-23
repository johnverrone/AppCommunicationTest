//
//  DataController.h
//  AppCommunicationTest
//
//  Created by John Verrone on 4/11/13.
//  Copyright (c) 2013 John Verrone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppUrl.h"

@interface DataController : NSObject

@property (nonatomic, copy) NSMutableArray *masterUrlList;

- (NSUInteger)countOfList;
- (AppUrl *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addUrl:(AppUrl *)url;

@end
