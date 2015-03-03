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


@interface RecViewController : UIViewController <UITextFieldDelegate,AVAudioRecorderDelegate,AVAudioPlayerDelegate>{
    
    AVAudioRecorder *avRecorder;
    AVAudioPlayer *avPlayer[50];
    int dataNumber;
    IBOutlet UILabel *label;
    int buttonCondition;
    IBOutlet UIButton *btn;
    int playCount;
    IBOutlet UITextField *naming;
    NSString *name;
    
}
@property int selectedFileNumber;
- (IBAction)recStartAndStop:(id)sender;
-(IBAction)deleteRec:(id)sender;
-(IBAction)done:(id)sender;
-(BOOL)textFieldShouldReturn:(UITextField *)naming;

@end
