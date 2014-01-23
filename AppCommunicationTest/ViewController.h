//
//  ViewController.h
//  AppCommunicationTest
//
//  Created by John Verrone on 1/31/13.
//  Copyright (c) 2013 John Verrone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>
#import "DataController.h"
#import "AppUrl.h"

@interface ViewController : UITableViewController <SKStoreProductViewControllerDelegate, UIAlertViewDelegate>


@property (strong, nonatomic) DataController *dataController;


@end
