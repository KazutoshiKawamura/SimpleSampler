//
//  RecViewController.h
//  SimpleSampler
//
//  Created by kztskawamu on 2015/03/03.
//  Copyright (c) 2015年 kztskawamu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "EditViewController.h"
#import "AppDelegate.h"


@interface RecViewController : UIViewController <UITextFieldDelegate,AVAudioRecorderDelegate,AVAudioPlayerDelegate>{
    
    AVAudioRecorder *avRecorder;
    AVAudioPlayer *avPlayer[50];
    int playCount;
    IBOutlet UILabel *label;
    int buttonCondition;
    IBOutlet UIButton *btn;
    NSTimer *timer;
    NSTimer *timer2;
    float timerCount;
    NSString *time;
    IBOutlet UILabel *timeLabel;
    float recTime;
    NSUserDefaults *savedFile;
    bool renewalCheck;
    AppDelegate *aD;
    
}
@property int selectedFileNumber;
- (IBAction)recStartAndStop:(id)sender;
-(IBAction)retryRec:(id)sender;
-(IBAction)done:(id)sender;
-(IBAction)cancel;
-(BOOL)textFieldShouldReturn:(UITextField *)naming;
-(void)timerStart;

@end
