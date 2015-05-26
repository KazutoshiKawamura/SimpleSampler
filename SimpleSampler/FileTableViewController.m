//
//  FileTableViewController.m
//  SimpleSampler
//
//  Created by kztskawamu on 2015/03/03.
//  Copyright (c) 2015年 kztskawamu. All rights reserved.
//

#import "FileTableViewController.h"

#define _STCellId @"Cell"

@interface FileTableViewController ()

@end

@implementation FileTableViewController

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    _rows = [NSMutableArray arrayWithCapacity:100];
    for (int i = 0; i < 100; i++) {
        NSString *title = [NSString stringWithFormat:@"Item %d", i];
        [_rows addObject:title];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSLog(@"Google Mobile Ads SDK version: %@", [GADRequest sdkVersion]);
    self.bannerView.adUnitID = @"ca-app-pub-1376424253937363/2978674733";
    self.bannerView.rootViewController = self;
    GADBannerView *bannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeSmartBannerPortrait];
    [self.bannerView loadRequest:[GADRequest request]];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:_STCellId];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    savedFile = [NSUserDefaults standardUserDefaults];
    
    
    for (int i = 0; i < 20; i++) {
        name[i] = [savedFile stringForKey:[NSString stringWithFormat:@"NAME%d",i]];
    }
//    testName = [savedFile stringForKey:[NSString stringWithFormat:@"NAME%d",0]];
    

    
    
    if (_situation == 0) {
        titleLabel.text = @"Select Add File";
    }else if (_situation == 1) {
        titleLabel.text = @"Select Rec File";
    }else if (_situation == 2) {
        titleLabel.text = @"Select Edit File";
    }
}

- (void)viewWillAppear:(BOOL)animated {
    if (_situation == 2) {
        titleLabel.text = @"Select Edit File";
    }
}

- (void)viewDidAppear:(BOOL)animated {
    if (_situation == 3) {
        EditViewController *editVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"EditViewController"];
        editVC.selectedFileNumber = _selectedFileNumber;
        editVC.delegate = (id<EditViewDelegate>)self;
        [self presentViewController:editVC animated:YES completion:nil];
    }
}

- (void)recViewDidChanged:(RecViewController*)viewController {
    _situation = 3;
}

- (void)editViewDidChanged:(EditViewController*)viewController {
    _situation = 2;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
//    cell.textLabel.text = [NSString stringWithFormat:@"%d.", indexPath.row + 1]; // 何番目のセルかを表示させました
//    cell.textLabel.text =
//    for (int i = 0; i < 20; i++) {
//        cell.textLabel.text = [savedFile stringForKey:[NSString stringWithFormat:@"NAME%d",i]];
//    }
    cell.textLabel.text = [NSString stringWithFormat:@"%d.%@", indexPath.row + 1,name[indexPath.row]];
//    [savedFile stringForKey:[NSString stringWithFormat:@"NAME%d",indexPath.row]];

    return cell;
}

-(IBAction)cancelButton:(id)sender{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
//    PlayViewController *playVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"PlayViewController"];
//    [self presentViewController:playVC animated:YES completion:nil];
//    if (_situation == 0) {
//        PlayViewController *playVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"PlayViewController"];
//        [self presentViewController:playVC animated:YES completion:nil];
//    }else if (_situation == 1) {
//        PlayViewController *playVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"PlayViewController"];
//        [self presentViewController:playVC animated:YES completion:nil];
//    }else if (_situation == 2) {
//        EditViewController *editVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"EditViewController"];
//        editVC.selectedFileNumber = _selectedFileNumber;
//        [self presentViewController:editVC animated:YES completion:nil];
//    }
}

#pragma mark - Table view Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _selectedFileNumber = indexPath.row;
    if (_situation == 0) {
        AddViewController *addVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"AddViewController"];
        addVC.selectedFileNumber = indexPath.row;
        [self presentViewController:addVC animated:YES completion:nil];
//        [self.navigationController pushViewController:addVC animated:YES];
    }else if (_situation == 1) {
        RecViewController *recVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"RecViewController"];
        recVC.selectedFileNumber = indexPath.row;
        recVC.delegate = (id<RecViewDelegate>)self;
[self presentViewController:recVC animated:YES completion:nil];
    }else if (_situation == 2) {
        EditViewController *editVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"EditViewController"];
        editVC.selectedFileNumber = indexPath.row;
        editVC.delegate = (id<EditViewDelegate>)self;
        [self presentViewController:editVC animated:YES completion:nil];
    }
}

/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
 
 // Configure the cell...
 
 return cell;
 }
 */

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
