//
//  EditViewController.h
//  SimpleSampler
//
//  Created by kztskawamu on 2015/03/03.
//  Copyright (c) 2015年 kztskawamu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "FileTableViewController.h"
#import "PlayViewController.h"

@interface EditViewController : UIViewController{
    IBOutlet UILabel *fileNumberLabel;
    IBOutlet UITextField *naming;
    IBOutlet UISwitch *playResetSwitch;
    NSUserDefaults *savedFile;
    bool playReset;
    float startTime;
    float endTime;
    float fileTime;
    IBOutlet UITextField *start;
    IBOutlet UITextField *end;
    AVAudioPlayer *avPlayer[50];
    int playCount;
    int stopCount;
    NSTimer *timer;
}


@property (weak, nonatomic) IBOutlet UISlider *startSlider;
@property (weak, nonatomic) IBOutlet UISlider *endSlider;
@property int selectedFileNumber;
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
-(IBAction)SelectFile;
-(IBAction)save;
-(IBAction)cancel;
-(IBAction)testPlay;


@end
