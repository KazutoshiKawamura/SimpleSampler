//
//  PlayViewController.m
//  SimpleSampler
//
//  Created by kztskawamu on 2015/03/03.
//  Copyright (c) 2015年 kztskawamu. All rights reserved.
//

#import "PlayViewController.h"

@interface PlayViewController ()

@end

@implementation PlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    savedName = [NSUserDefaults standardUserDefaults];
    savedFile = [NSUserDefaults standardUserDefaults];
//    NSString *name1 = [savedName stringForKey:@"NAME"];
//    label0.text=name1;
//    dataNumber = [savedName integerForKey:@"DATA_NUMBER"];
//    dataNumberOfButton1 = 0;
    playCount = 0;
    stopCount = 0;
    stopCount2 = 0;
    resetCount = 0;
    
    for (int i = 0; i < 9; i++) {
        fileNumberOfButton[i] = [savedFile integerForKey:[NSString stringWithFormat:@"FILE_NUMBER_OF_BUTTON%d",i]];
        playReset[i] = [savedFile boolForKey:[NSString stringWithFormat:@"PLAY_RESET%d",fileNumberOfButton[i]]];
        startTime[i] = [savedFile floatForKey:[NSString stringWithFormat:@"START_TIME%d",fileNumberOfButton[i]]];
        endTime[i] = [savedFile floatForKey:[NSString stringWithFormat:@"END_TIME%d",fileNumberOfButton[i]]];
        
    }
    
    label0.text = [savedFile stringForKey:[NSString stringWithFormat:@"NAME%d",fileNumberOfButton[0]]];
    label1.text = [savedFile stringForKey:[NSString stringWithFormat:@"NAME%d",fileNumberOfButton[1]]];
    label2.text = [savedFile stringForKey:[NSString stringWithFormat:@"NAME%d",fileNumberOfButton[2]]];
    label3.text = [savedFile stringForKey:[NSString stringWithFormat:@"NAME%d",fileNumberOfButton[3]]];
    label4.text = [savedFile stringForKey:[NSString stringWithFormat:@"NAME%d",fileNumberOfButton[4]]];
    label5.text = [savedFile stringForKey:[NSString stringWithFormat:@"NAME%d",fileNumberOfButton[5]]];
    label6.text = [savedFile stringForKey:[NSString stringWithFormat:@"NAME%d",fileNumberOfButton[6]]];
    label7.text = [savedFile stringForKey:[NSString stringWithFormat:@"NAME%d",fileNumberOfButton[7]]];
    label8.text = [savedFile stringForKey:[NSString stringWithFormat:@"NAME%d",fileNumberOfButton[8]]];
    

    //    _situation = 0;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

-(IBAction)rec{
    [self reset];
    FileTableViewController *tableVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"FileTableViewController"];
    tableVC.situation = 1;
    [self presentViewController:tableVC animated:YES completion:nil];//YESならModal,Noなら何もなし
    //    FileTableViewController.situation = 1;
    //    [self performSegueWithIdentifier:@"toFileTableViewController" sender:self];
}

-(IBAction)add{
    [self reset];
    FileTableViewController *tableVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"FileTableViewController"];
    tableVC.situation = 0;
    [self presentViewController:tableVC animated:YES completion:nil];//YESならModal,Noなら何もなし
    //    [self performSegueWithIdentifier:@"toFileTableViewController" sender:self];
}

-(IBAction)edit{
    [self reset];
    FileTableViewController *tableVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"FileTableViewController"];
    tableVC.situation = 2;
    [self presentViewController:tableVC animated:YES completion:nil];//YESならModal,Noなら何もなし
}



-(IBAction)playButtonAction0{
    [self playButtonAction:0];
    
    if (playReset[0] == false) {
        timer = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[0]]-startTime[fileNumberOfButton[0]]
                                                 target:self
                                               selector:@selector(playEnd0:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }else{
        timer = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[0]]-startTime[fileNumberOfButton[0]]
                                                 target:self
                                               selector:@selector(playEndResetOn0:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }
    
}

-(IBAction)playButtonAction1{
    [self playButtonAction:1];
    if (playReset[1] == false) {
        timer = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[1]]-startTime[fileNumberOfButton[1]]
                                                 target:self
                                               selector:@selector(playEnd1:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }else{
        timer = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[1]]-startTime[fileNumberOfButton[1]]
                                                 target:self
                                               selector:@selector(playEndResetOn1:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }
}

-(IBAction)playButtonAction2{
    [self playButtonAction:2];
    if (playReset[2] == false) {
        timer = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[2]]-startTime[fileNumberOfButton[2]]
                                                 target:self
                                               selector:@selector(playEnd2:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }else{
        timer = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[2]]-startTime[fileNumberOfButton[2]]
                                                 target:self
                                               selector:@selector(playEndResetOn2:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }
    
}

-(IBAction)playButtonAction3{
    [self playButtonAction:3];
    if (playReset[3] == false) {
        timer = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[3]]-startTime[fileNumberOfButton[3]]
                                                 target:self
                                               selector:@selector(playEnd3:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }else{
        timer = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[3]]-startTime[fileNumberOfButton[3]]
                                                 target:self
                                               selector:@selector(playEndResetOn3:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }
    
}

-(IBAction)playButtonAction4{
    [self playButtonAction:4];
    if (playReset[4] == false) {
        timer = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[4]]-startTime[fileNumberOfButton[4]]
                                                 target:self
                                               selector:@selector(playEnd4:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }else{
        timer = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[4]]-startTime[fileNumberOfButton[4]]
                                                 target:self
                                               selector:@selector(playEndResetOn4:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }
    
}

-(IBAction)playButtonAction5{
    [self playButtonAction:5];
    if (playReset[5] == false) {
        timer = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[5]]-startTime[fileNumberOfButton[5]]
                                                 target:self
                                               selector:@selector(playEnd5:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }else{
        timer = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[5]]-startTime[fileNumberOfButton[5]]
                                                 target:self
                                               selector:@selector(playEndResetOn5:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }
    
}

-(IBAction)playButtonAction6{
    [self playButtonAction:6];
    if (playReset[6] == false) {
        timer = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[6]]-startTime[fileNumberOfButton[6]]
                                                 target:self
                                               selector:@selector(playEnd6:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }else{
        timer = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[6]]-startTime[fileNumberOfButton[6]]
                                                 target:self
                                               selector:@selector(playEndResetOn6:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }
    
}

-(IBAction)playButtonAction7{
    [self playButtonAction:7];
    if (playReset[7] == false) {
        timer = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[7]]-startTime[fileNumberOfButton[7]]
                                                 target:self
                                               selector:@selector(playEnd7:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }else{
        timer = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[7]]-startTime[fileNumberOfButton[7]]
                                                 target:self
                                               selector:@selector(playEndResetOn7:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }
    
}

-(IBAction)playButtonAction8{
    [self playButtonAction:8];
    if (playReset[8] == false) {
        timer = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[8]]-startTime[fileNumberOfButton[8]]
                                                 target:self
                                               selector:@selector(playEnd8:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }else{
        timer = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[8]]-startTime[fileNumberOfButton[8]]
                                                 target:self
                                               selector:@selector(playEndResetOn8:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }
    
}

-(void)playButtonAction:(int)buttonNumber{
    
    if (playReset[buttonNumber] == true) {
        [resetOnPlayer[buttonNumber][resetCount-1] stop];
    }
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryAmbient error:nil];
    
    
    // 録音ファイルパス
    NSArray *filePaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask,YES);
    NSString *documentDir = [filePaths objectAtIndex:0];
    NSString *path = [documentDir stringByAppendingPathComponent:[NSString stringWithFormat:@"rec%d.caf",fileNumberOfButton[buttonNumber]]];
    NSURL *recordingURL = [NSURL fileURLWithPath:path];
    
    if (playReset[buttonNumber] == false) {
        avPlayer[buttonNumber][playCount] = [[AVAudioPlayer alloc]initWithContentsOfURL:recordingURL error:nil];
        avPlayer[buttonNumber][playCount].delegate = self;
        avPlayer[buttonNumber][playCount].volume=1.0;
        avPlayer[buttonNumber][playCount].currentTime = startTime[fileNumberOfButton[buttonNumber]];
        [avPlayer[buttonNumber][playCount] play];
        playCount++;
        if (playCount >= 50) {
            playCount = 0;
        }
//        timer = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[buttonNumber]]-startTime[fileNumberOfButton[buttonNumber]]
//                                                 target:self
//                                               selector:@selector(playEnd:)
//                                               userInfo:nil
//                                                repeats:NO
//                 ];
    }else{
        resetOnPlayer[buttonNumber][resetCount] = [[AVAudioPlayer alloc]initWithContentsOfURL:recordingURL error:nil];
        resetOnPlayer[buttonNumber][resetCount].delegate = self;
        resetOnPlayer[buttonNumber][resetCount].volume=1.0;
        resetOnPlayer[buttonNumber][resetCount].currentTime = startTime[fileNumberOfButton[buttonNumber]];
        [resetOnPlayer[buttonNumber][resetCount] play];
        resetCount++;
        if (resetCount >= 50) {
            resetCount = 0;
        }
//        timer = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[buttonNumber]]-startTime[fileNumberOfButton[buttonNumber]]
//                                                 target:self
//                                               selector:@selector(playEndResetOn:)
//                                               userInfo:nil
//                                                repeats:NO
//                 ];
    }

    
}

-(void)playEnd0:(NSTimer *)timer{
    [avPlayer[0][stopCount] stop];
    stopCount++;
    if (stopCount >= 50) {
        stopCount = 0;
    }
}

-(void)playEndResetOn0:(NSTimer *)timer{
    [resetOnPlayer[0][stopCount2] stop];
    stopCount2++;
    if (stopCount2 >= 50) {
        stopCount2 = 0;
    }
}

-(void)playEnd1:(NSTimer *)timer{
    [avPlayer[1][stopCount] stop];
    stopCount++;
    if (stopCount >= 50) {
        stopCount = 0;
    }
}

-(void)playEndResetOn1:(NSTimer *)timer{
    [resetOnPlayer[1][stopCount2] stop];
    stopCount2++;
    if (stopCount2 >= 50) {
        stopCount2 = 0;
    }
}

-(void)playEnd2:(NSTimer *)timer{
    [avPlayer[2][stopCount] stop];
    stopCount++;
    if (stopCount >= 50) {
        stopCount = 0;
    }
}

-(void)playEndResetOn2:(NSTimer *)timer{
    [resetOnPlayer[2][stopCount2] stop];
    stopCount2++;
    if (stopCount2 >= 50) {
        stopCount2 = 0;
    }
}

-(void)playEnd3:(NSTimer *)timer{
    [avPlayer[3][stopCount] stop];
    stopCount++;
    if (stopCount >= 50) {
        stopCount = 0;
    }
}

-(void)playEndResetOn3:(NSTimer *)timer{
    [resetOnPlayer[3][stopCount2] stop];
    stopCount2++;
    if (stopCount2 >= 50) {
        stopCount2 = 0;
    }
}

-(void)playEnd4:(NSTimer *)timer{
    [avPlayer[4][stopCount] stop];
    stopCount++;
    if (stopCount >= 50) {
        stopCount = 0;
    }
}

-(void)playEndResetOn4:(NSTimer *)timer{
    [resetOnPlayer[4][stopCount2] stop];
    stopCount2++;
    if (stopCount2 >= 50) {
        stopCount2 = 0;
    }
}

-(void)playEnd5:(NSTimer *)timer{
    [avPlayer[5][stopCount] stop];
    stopCount++;
    if (stopCount >= 50) {
        stopCount = 0;
    }
}

-(void)playEndResetOn5:(NSTimer *)timer{
    [resetOnPlayer[5][stopCount2] stop];
    stopCount2++;
    if (stopCount2 >= 50) {
        stopCount2 = 0;
    }
}

-(void)playEnd6:(NSTimer *)timer{
    [avPlayer[6][stopCount] stop];
    stopCount++;
    if (stopCount >= 50) {
        stopCount = 0;
    }
}

-(void)playEndResetOn6:(NSTimer *)timer{
    [resetOnPlayer[6][stopCount2] stop];
    stopCount2++;
    if (stopCount2 >= 50) {
        stopCount2 = 0;
    }
}

-(void)playEnd7:(NSTimer *)timer{
    [avPlayer[7][stopCount] stop];
    stopCount++;
    if (stopCount >= 50) {
        stopCount = 0;
    }
}

-(void)playEndResetOn7:(NSTimer *)timer{
    [resetOnPlayer[7][stopCount2] stop];
    stopCount2++;
    if (stopCount2 >= 50) {
        stopCount2 = 0;
    }
}

-(void)playEnd8:(NSTimer *)timer{
    [avPlayer[8][stopCount] stop];
    stopCount++;
    if (stopCount >= 50) {
        stopCount = 0;
    }
}

-(void)playEndResetOn8:(NSTimer *)timer{
    [resetOnPlayer[8][stopCount2] stop];
    stopCount2++;
    if (stopCount2 >= 50) {
        stopCount2 = 0;
    }
}


-(void)reset{
    [timer invalidate];
    for (int i = 0; i < 50; i++) {
        for (int j = 0; j < 9; j++) {
            [avPlayer[j][i] stop];
            [resetOnPlayer [j][i] stop];
        }
    }
}




@end
