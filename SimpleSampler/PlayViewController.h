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

@interface PlayViewController : UIViewController{
    AVAudioPlayer *avPlayer[50];
    AVAudioPlayer *resetOnPlayer[9];
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
    int playCount;
    int stopCount;
    int resetCount;
    int resetCount2;
    NSUserDefaults *savedName;
    NSUserDefaults *savedFile;
    NSTimer *timer;
    
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
-(void)playButtonAction:(int)buttonNumber player:(AVAudioPlayer *)player;

@end
