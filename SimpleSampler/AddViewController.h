//
//  AddViewController.h
//  SimpleSampler
//
//  Created by kztskawamu on 2015/03/03.
//  Copyright (c) 2015年 kztskawamu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayViewController.h"

@interface AddViewController : UIViewController{
    IBOutlet UILabel *label0;
    IBOutlet UILabel *label1;
    IBOutlet UILabel *label2;
    IBOutlet UILabel *label3;
    IBOutlet UILabel *label4;
    IBOutlet UILabel *label5;
    IBOutlet UILabel *label6;
    IBOutlet UILabel *label7;
    IBOutlet UILabel *label8;
    int fileNumberOfButton[9];
    NSUserDefaults *savedFile;
}

@property int selectedFileNumber;
-(IBAction)cancel;
-(IBAction)addButtonAction0;
-(IBAction)addButtonAction1;
-(IBAction)addButtonAction2;
-(IBAction)addButtonAction3;
-(IBAction)addButtonAction4;
-(IBAction)addButtonAction5;
-(IBAction)addButtonAction6;
-(IBAction)addButtonAction7;
-(IBAction)addButtonAction8;
-(void)addButtonAction:(int)buttonNumber;

@end
