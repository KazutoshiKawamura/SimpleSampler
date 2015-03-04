//
//  EditViewController.h
//  SimpleSampler
//
//  Created by kztskawamu on 2015/03/03.
//  Copyright (c) 2015年 kztskawamu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FileTableViewController.h"
#import "PlayViewController.h"

@interface EditViewController : UIViewController{
    IBOutlet UILabel *fileNumberLabel;
    IBOutlet UITextField *naming;
    IBOutlet UISwitch *playResetSwitch;
    NSUserDefaults *savedFile;
    bool playReset;
    IBOutlet UISlider *startSlider;
    IBOutlet UISlider *endSlider;
    float startTime;
    float endTime;
    float fileTime;
}


@property int selectedFileNumber;
@property float recTime;
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
-(IBAction)SelectFile;
-(IBAction)save;
-(IBAction)cancel;

@end
