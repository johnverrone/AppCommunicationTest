//
//  ViewController.m
//  AppCommunicationTest
//
//  Created by John Verrone on 1/31/13.
//  Copyright (c) 2013 John Verrone. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSString *url;

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.dataController = [[DataController alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(becomeActive:)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
}

- (void)becomeActive:(NSNotification *)notification {
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController countOfList];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppUrl *urlAtSelection = [self.dataController objectInListAtIndex:indexPath.row];
    url = urlAtSelection.url;
    NSNumber *iTunesID = urlAtSelection.appStoreId;
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *str = cell.textLabel.text;
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:url]]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@%@%@", @"Launching ", str, @" app"]
                                                        message:@"Press OK to proceed"
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"OK",nil];
        [alert show];
    } else {
    
    SKStoreProductViewController *store = [[SKStoreProductViewController alloc] init];
    store.delegate =  self;
    
    NSDictionary *parameters =
    @{SKStoreProductParameterITunesItemIdentifier:iTunesID};
    
    [store loadProductWithParameters:parameters
                                   completionBlock:^(BOOL result, NSError *error) {
                                       if (error) {
                                           UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@", @"Cannot connect to iTunes Store"]
                                                                                           message:@"No internet connection."
                                                                                          delegate:nil
                                                                                 cancelButtonTitle:@"Dismiss"
                                                                                 otherButtonTitles:nil];
                                           [alert show];
                                           NSLog(@"Error %@ with User Info %@.", error, [error userInfo]);
                                       } else {
                                           // Present Store Product View Controller
                                           [self presentViewController:store animated:YES completion:nil];
                                       }
                                   }];;

    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    // the user clicked one of the OK/Cancel buttons
    if (buttonIndex == 1)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    } else {
        NSLog(@"cancel");
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"UrlCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    AppUrl *urlAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    [[cell textLabel] setText:urlAtIndex.name];
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlAtIndex.url]]) {
        [[cell detailTextLabel] setText:@"Installed"];
    } else {
        [[cell detailTextLabel] setText:@"Not Installed"];
    }
    
    if ([urlAtIndex.url isEqualToString:@""]) {
        [[cell detailTextLabel] setText:@"Missing URL Scheme"];
    }
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

-(UIColor*)colorForIndex:(NSInteger) index {
    NSUInteger itemCount = [self.dataController countOfList];
    float val = ((float)index / (float)itemCount) * 0.4;
    return [UIColor colorWithRed:0.0 green:.5+val blue:0.0 alpha:1.0];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //cell.backgroundColor = [self colorForIndex:indexPath.row];
}

- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
