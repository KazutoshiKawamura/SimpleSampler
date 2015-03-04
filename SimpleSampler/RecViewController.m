//
//  RecViewController.m
//  SimpleSampler
//
//  Created by kztskawamu on 2015/03/03.
//  Copyright (c) 2015年 kztskawamu. All rights reserved.
//

#import "RecViewController.h"

@interface RecViewController ()

@end

@implementation RecViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dataNumber = 0;
    buttonCondition = 0;
    playCount = 0;
    //    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    btn.frame = CGRectMake(0, 0, 150, 150);
    [btn setImage:[UIImage imageNamed:@"RecStartButton.png"] forState:UIControlStateNormal];
    //    [self.view addSubview:btn];
    //    [self.view addSubview:btn];
    
    label.text = [NSString stringWithFormat:@"File No.%d",_selectedFileNumber+1];
    savedFile = [NSUserDefaults standardUserDefaults];
    
}



- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    //    [player release];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    
    
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (IBAction)recStartAndStop:(id)sender {
    if (buttonCondition == 0) {
        
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        NSError *error = nil;
        // 使用している機種が録音に対応しているか
        if ([audioSession inputIsAvailable]) {
            [audioSession setCategory:AVAudioSessionCategoryRecord error:&error];
        }
        if(error){
            NSLog(@"audioSession: %@ %d %@", [error domain], [error code], [[error userInfo] description]);
        }
        // 録音機能をアクティブにする
        [audioSession setActive:YES error:&error];
        if(error){
            NSLog(@"audioSession: %@ %d %@", [error domain], [error code], [[error userInfo] description]);
        }
        
        // 録音ファイルパス
        NSArray *filePaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                 NSUserDomainMask,YES);
        NSString *documentDir = [filePaths objectAtIndex:0];
        
        NSString *path = [documentDir stringByAppendingPathComponent:[NSString stringWithFormat:@"rec%d.caf",_selectedFileNumber]];
        
        NSURL *recordingURL = [NSURL fileURLWithPath:path];
        
        /*
         
         NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys:
         [NSNumber numberWithFloat: 44100.0], AVSampleRateKey,
         [NSNumber numberWithInt: kAudioFormatLinearPCM], AVFormatIDKey,
         [NSNumber numberWithInt: 1], AVNumberOfChannelsKey,
         [NSNumber numberWithInt:16], AVLinearPCMBitDepthKey,
         [NSNumber numberWithBool:NO], AVLinearPCMIsBigEndianKey,
         [NSNumber numberWithBool:NO], AVLinearPCMIsFloatKey,
         nil];
         
         AvRecorder = [[AVAudioRecorder alloc] initWithURL:recordingURL settings:settings error:&error];
         */
        
        // 録音中に音量をとる場合はYES
        //    AvRecorder.meteringEnabled = YES;
        
        avRecorder = [[AVAudioRecorder alloc] initWithURL:recordingURL settings:nil error:&error];
        
        if(error){
            NSLog(@"error = %@",error);
            return;
        }
        avRecorder.delegate=self;
        //    ５秒録音して終了
            [avRecorder recordForDuration: 10.0];
        
        [avRecorder record];
        [self timerStart];
        
        buttonCondition = 1;
        //    UIImage: image = [UIImage imageNamed:@"RecStopButton.png"];
        //        [button setImage:image forState:UIControlStateNormal];
        
        [btn setImage:[UIImage imageNamed:@"RecStopButton.png"] forState:UIControlStateNormal];
        [self.view addSubview:btn];

        
        
    }else if (buttonCondition == 1){
        [avRecorder stop];
        [timer invalidate];
        recTime = timerCount;
        buttonCondition = 2;
        [btn setImage:[UIImage imageNamed:@"PlayButton.png"] forState:UIControlStateNormal];
        [self.view addSubview:btn];
//        naming.hidden=false;
    }else if (buttonCondition == 2){
        
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        [audioSession setCategory:AVAudioSessionCategoryAmbient error:nil];
        
        
        // 録音ファイルパス
        NSArray *filePaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                 NSUserDomainMask,YES);
        NSString *documentDir = [filePaths objectAtIndex:0];
        
        NSString *path = [documentDir stringByAppendingPathComponent:[NSString stringWithFormat:@"rec%d.caf",_selectedFileNumber]];
        
        NSURL *recordingURL = [NSURL fileURLWithPath:path];
        
        avPlayer[playCount] = [[AVAudioPlayer alloc]initWithContentsOfURL:recordingURL error:nil];
        avPlayer[playCount].delegate = self;
        avPlayer[playCount].volume=1.0;
        //        avPlayer[playCount].currentTime = 1.323;
        [avPlayer[playCount] play];
        playCount++;
        if (playCount >= 50) {
            playCount = 0;
        }
        timerCount = 0;
        [timer invalidate];
        [self timerStart];
        [timer2 invalidate];
        timer2 = [NSTimer scheduledTimerWithTimeInterval:recTime
                                                  target:self
                                                selector:@selector(timerStopWhenPlay)
                                                userInfo:nil
                                                 repeats:NO
                 ];
        
        
        
    }
    
}

// 録音が終わったら呼ばれるメソッド

- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag {
    /*
     NSURL *recordingURL = recorder.url;
     player = [[AVAudioPlayer alloc]initWithContentsOfURL:recordingURL error:nil];
     player.delegate = self;
     //    player.volume=1.0;
     [player play];
     */
}

//- (IBAction)resStop:(id)sender {
//
//    [avRecorder stop];
//
//}

//- (IBAction)play:(id)sender {
//
//    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
//    [audioSession setCategory:AVAudioSessionCategoryAmbient error:nil];
//
//
//    // 録音ファイルパス
//    NSArray *filePaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
//                                                             NSUserDomainMask,YES);
//    NSString *documentDir = [filePaths objectAtIndex:0];
//
//    NSString *prePath = [documentDir stringByAppendingPathComponent:@"rec"];
//    NSString *path = [prePath stringByAppendingFormat:@"%d.caf",dataNumber];
//
//    NSURL *recordingURL = [NSURL fileURLWithPath:path];
//
//    avPlayer[0] = [[AVAudioPlayer alloc]initWithContentsOfURL:recordingURL error:nil];
//    avPlayer[0].delegate = self;
//    avPlayer[0].volume=1.0;
//    [avPlayer[0] play];
//}

-(IBAction)retryRec:(id)sender{
    [self reset];
    buttonCondition = 0;
    [btn setImage:[UIImage imageNamed:@"RecStartButton.png"] forState:UIControlStateNormal];
    timerCount = 0.0f;
    timeLabel.text = @"00.00";
}

-(IBAction)done:(id)sender{
    if (buttonCondition == 2) {
        [self reset];
        [savedFile setFloat:0.0f forKey:[NSString stringWithFormat:@"START_TIME%d",_selectedFileNumber]];
        [savedFile setFloat:recTime forKey:[NSString stringWithFormat:@"FILE_TIME%d",_selectedFileNumber]];
        [savedFile setFloat:recTime forKey:[NSString stringWithFormat:@"END_TIME%d",_selectedFileNumber]];
        EditViewController *editVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"EditViewController"];
        editVC.selectedFileNumber = _selectedFileNumber;
        [self presentViewController:editVC animated:YES completion:nil];
    }
    
    //    naming.returnKeyType = UIReturnKeyDone;
}

-(IBAction)cancel{
    [self reset];
    PlayViewController *playVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"PlayViewController"];
    [self presentViewController:playVC animated:YES completion:nil];
    
}

-(void)timerStart{
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                             target:self
                                           selector:@selector(timer)
                                           userInfo:nil
                                            repeats:YES
             ];
}

-(void)timer{
    timerCount = timerCount + 0.01f;
    timeLabel.text = [NSString stringWithFormat:@"%05.2f",timerCount];
}

-(void)timerStopWhenPlay{
    [timer invalidate];
    timeLabel.text = [NSString stringWithFormat:@"%05.2f",recTime];
}

-(void)reset{
    [timer invalidate];
    [timer2 invalidate];
    [avRecorder stop];
    for (int i = 0; i < 50; i++) {
        [avPlayer[i] stop];
    }
}






@end
