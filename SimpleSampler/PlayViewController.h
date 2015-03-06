//
//  PlayViewController.h
//  SimpleSampler
//
//  Created by kztskawamu on 2015/03/03.
//  Copyright (c) 2015年 kztskawamu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "FileTableViewController.h"

@interface PlayViewController : UIViewController <AVAudioRecorderDelegate,AVAudioPlayerDelegate>{
    AVAudioPlayer *avPlayer[9][50];
    AVAudioPlayer *resetOnPlayer[9][50];
    //    NSString *labelName[9];
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
    bool playReset[9];
    float startTime[9];
    float endTime[9];
    int playCount[9];
    int stopCount[9];
    int stopCount2[9];
    int resetCount[9];
    NSUserDefaults *savedFile;
    NSTimer *timer[9];
    
}
@property int selectedFileNumber;
//@property int situation;

-(IBAction)rec;
-(IBAction)add;
-(IBAction)edit;
-(IBAction)playButtonAction0;
-(IBAction)playButtonAction1;
-(IBAction)playButtonAction2;
-(IBAction)playButtonAction3;
-(IBAction)playButtonAction4;
-(IBAction)playButtonAction5;
-(IBAction)playButtonAction6;
-(IBAction)playButtonAction7;
-(IBAction)playButtonAction8;
-(void)playButtonAction:(int)buttonNumber;
-(void)playEnd0:(NSTimer *)timer;
-(void)playEnd1:(NSTimer *)timer;
-(void)playEnd2:(NSTimer *)timer;
-(void)playEnd3:(NSTimer *)timer;
-(void)playEnd4:(NSTimer *)timer;
-(void)playEnd5:(NSTimer *)timer;
-(void)playEnd6:(NSTimer *)timer;
-(void)playEnd7:(NSTimer *)timer;
-(void)playEnd8:(NSTimer *)timer;
-(void)playEndResetOn0:(NSTimer *)timer;
-(void)playEndResetOn1:(NSTimer *)timer;
-(void)playEndResetOn2:(NSTimer *)timer;
-(void)playEndResetOn3:(NSTimer *)timer;
-(void)playEndResetOn4:(NSTimer *)timer;
-(void)playEndResetOn5:(NSTimer *)timer;
-(void)playEndResetOn6:(NSTimer *)timer;
-(void)playEndResetOn7:(NSTimer *)timer;
-(void)playEndResetOn8:(NSTimer *)timer;


@end
