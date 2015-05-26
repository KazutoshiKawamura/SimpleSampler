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
#import "FileTableViewController.h"
#import "AppDelegate.h"
@import GoogleMobileAds;

@class RecViewController;

@protocol RecViewDelegate <NSObject>

- (void)recViewDidChanged:(RecViewController*)viewController;

@end


@interface RecViewController : UIViewController <UITextFieldDelegate,AVAudioRecorderDelegate,AVAudioPlayerDelegate>{
    
    AVAudioRecorder *avRecorder;
    AVAudioPlayer *avPlayer[50];
    int playCount;
    IBOutlet UILabel *label;
    int buttonCondition;
    IBOutlet UIButton *btn;
    IBOutlet UIButton *backButton;
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
@property(weak, nonatomic) id<RecViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;
@property int selectedFileNumber;
- (IBAction)recStartAndStop:(id)sender;
-(IBAction)retryRec:(id)sender;
-(IBAction)done:(id)sender;
-(IBAction)cancel;
-(void)timerStart;

@end
