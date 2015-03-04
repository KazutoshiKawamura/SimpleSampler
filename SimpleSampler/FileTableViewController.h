//
//  FileTableViewController.h
//  SimpleSampler
//
//  Created by kztskawamu on 2015/03/03.
//  Copyright (c) 2015年 kztskawamu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayViewController.h"
#import "RecViewController.h"
#import "EditViewController.h"
#import "AddViewController.h"

@interface FileTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    IBOutlet UILabel *titleLabel;
    NSUserDefaults *savedFile;
    NSString *name[20];
    NSString *testName;
}

@property int selectedFileNumber;
@property NSMutableArray *rows;
@property IBOutlet UITableView *tableView;
@property int fileNumber;
@property int situation;    //0 = add, 1 = rec, 2 = edit

-(IBAction)cancelButton:(id)sender;

@end
