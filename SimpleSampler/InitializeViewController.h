//
//  InitializeViewController.h
//  SimpleSampler
//
//  Created by kztskawamu on 2015/03/03.
//  Copyright (c) 2015年 kztskawamu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "PlayViewController.h"
@import GoogleMobileAds;

@interface InitializeViewController : UIViewController<AVAudioRecorderDelegate>{
    AVAudioRecorder *avRecorder;
    IBOutlet UILabel *label;
}

@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;
@property int selectedFileNumber;

-(IBAction)yesDeleteAll;
-(IBAction)yesDelete;

@end
