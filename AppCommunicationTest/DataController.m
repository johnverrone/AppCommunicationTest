//
//  DataController.m
//  AppCommunicationTest
//
//  Created by John Verrone on 4/11/13.
//  Copyright (c) 2013 John Verrone. All rights reserved.
//

#import "DataController.h"

@interface DataController ()
- (void)initializeDefaultDataList;
@end

@implementation DataController

- (id)init {
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    return nil;
}

- (void)initializeDefaultDataList {
    NSMutableArray *urlList = [[NSMutableArray alloc] init];
    self.masterUrlList = urlList;
    [self addUrl:[[AppUrl alloc] initWithName:@"Adult Swim" url:@"adultswim://" appStoreId:[NSNumber numberWithInt:417871100]]];
    [self addUrl:[[AppUrl alloc] initWithName:@"BTN2Go" url:@"" appStoreId:[NSNumber numberWithInt:474679690]]];
    [self addUrl:[[AppUrl alloc] initWithName:@"Cartoon Network" url:@"" appStoreId:[NSNumber numberWithInt:404593641]]];
    [self addUrl:[[AppUrl alloc] initWithName:@"CNN" url:@"cnn://" appStoreId:[NSNumber numberWithInt:407824176]]];
    [self addUrl:[[AppUrl alloc] initWithName:@"Encore" url:@"encoreplay://com.starz.encoreplay" appStoreId:[NSNumber numberWithInt:556968605]]];
    [self addUrl:[[AppUrl alloc] initWithName:@"EpixHD" url:@"" appStoreId:[NSNumber numberWithInt:430018488]]];
    [self addUrl:[[AppUrl alloc] initWithName:@"HBO Go" url:@"hbogo://com.hbo.hbogo" appStoreId:[NSNumber numberWithInt:429775439]]];
    [self addUrl:[[AppUrl alloc] initWithName:@"Longhorn Network" url:@"longhorn://com.espn.longhorn" appStoreId:[NSNumber numberWithInt:572092594]]];
    [self addUrl:[[AppUrl alloc] initWithName:@"March Madness" url:@"ncaamml://" appStoreId:[NSNumber numberWithInt:423246594]]];
    [self addUrl:[[AppUrl alloc] initWithName:@"Max Go" url:@"maxgo://com.hbo.maxgo" appStoreId:[NSNumber numberWithInt:453560335]]];
    [self addUrl:[[AppUrl alloc] initWithName:@"Movie Plex" url:@"movieplexplay://" appStoreId:[NSNumber numberWithInt:559419484]]];
    [self addUrl:[[AppUrl alloc] initWithName:@"NBA League Pass" url:@"courtside://" appStoreId:[NSNumber numberWithInt:364284970]]];
    [self addUrl:[[AppUrl alloc] initWithName:@"NFL Network" url:@"" appStoreId:[NSNumber numberWithInt:432015643]]];
    [self addUrl:[[AppUrl alloc] initWithName:@"NFL RedZone (Same app as NFL Network)" url:@"" appStoreId:[NSNumber numberWithInt:432015643]]];
    [self addUrl:[[AppUrl alloc] initWithName:@"PAC 12" url:@"" appStoreId:[NSNumber numberWithInt:550252401]]];
    [self addUrl:[[AppUrl alloc] initWithName:@"Starz" url:@"starzplay://com.starz.starzplay" appStoreId:[NSNumber numberWithInt:550221096]]];
    [self addUrl:[[AppUrl alloc] initWithName:@"TBS" url:@"" appStoreId:[NSNumber numberWithInt:462780547]]];
    [self addUrl:[[AppUrl alloc] initWithName:@"TNT" url:@"tbsapp://" appStoreId:[NSNumber numberWithInt:460494135]]];
    [self addUrl:[[AppUrl alloc] initWithName:@"TruTV" url:@"trutv2go://" appStoreId:[NSNumber numberWithInt:396972659]]];
    [self addUrl:[[AppUrl alloc] initWithName:@"TWCDeportes" url:@"" appStoreId:[NSNumber numberWithInt:563321030]]];
    [self addUrl:[[AppUrl alloc] initWithName:@"TWCSportsNet" url:@"" appStoreId:[NSNumber numberWithInt:563316826]]];
    [self addUrl:[[AppUrl alloc] initWithName:@"Watch Disney" url:@"disneychannel://com.disney.WATCHDisneyChannel" appStoreId:[NSNumber numberWithInt:529997671]]];
    [self addUrl:[[AppUrl alloc] initWithName:@"Watch Disney Jr." url:@"disneyjr://com.disney.WATCHDisneyJunior" appStoreId:[NSNumber numberWithInt:530001625]]];
    [self addUrl:[[AppUrl alloc] initWithName:@"Watch Disney XD" url:@"disneyxd://com.disney.WatchDisneyXD" appStoreId:[NSNumber numberWithInt:530003802]]];
    [self addUrl:[[AppUrl alloc] initWithName:@"WatchESPN" url:@"watchespn://com.espn.watchespn" appStoreId:[NSNumber numberWithInt:429009175]]];
}


- (void)setMasterUrlList:(NSMutableArray *)newList {
    if (_masterUrlList != newList) {
        _masterUrlList = [newList mutableCopy];
    }
}

- (NSUInteger)countOfList {
    return [self.masterUrlList count];
}

- (AppUrl *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterUrlList objectAtIndex:theIndex];
}

- (void)addUrl:(AppUrl *)newUrl {
    [self.masterUrlList addObject:newUrl];
}


@end
