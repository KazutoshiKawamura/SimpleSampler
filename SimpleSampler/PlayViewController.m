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
    
    for (int i = 0; i < 9; i++) {
        playCount[i] = 0;
        stopCount[i] = 0;
        stopCount2[i] = 0;
        resetCount[i] = 0;
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
        timer[0] = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[0]]-startTime[fileNumberOfButton[0]]
                                                 target:self
                                               selector:@selector(playEnd0:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }else{
        timer[0] = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[0]]-startTime[fileNumberOfButton[0]]
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
        timer[1] = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[1]]-startTime[fileNumberOfButton[1]]
                                                 target:self
                                               selector:@selector(playEnd1:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }else{
        timer[1] = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[1]]-startTime[fileNumberOfButton[1]]
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
        timer[2] = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[2]]-startTime[fileNumberOfButton[2]]
                                                 target:self
                                               selector:@selector(playEnd2:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }else{
        timer[2] = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[2]]-startTime[fileNumberOfButton[2]]
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
        timer[3] = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[3]]-startTime[fileNumberOfButton[3]]
                                                 target:self
                                               selector:@selector(playEnd3:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }else{
        timer[3] = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[3]]-startTime[fileNumberOfButton[3]]
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
        timer[4] = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[4]]-startTime[fileNumberOfButton[4]]
                                                 target:self
                                               selector:@selector(playEnd4:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }else{
        timer[4] = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[4]]-startTime[fileNumberOfButton[4]]
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
        timer[5] = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[5]]-startTime[fileNumberOfButton[5]]
                                                 target:self
                                               selector:@selector(playEnd5:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }else{
        timer[5] = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[5]]-startTime[fileNumberOfButton[5]]
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
        timer[6] = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[6]]-startTime[fileNumberOfButton[6]]
                                                 target:self
                                               selector:@selector(playEnd6:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }else{
        timer[6] = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[6]]-startTime[fileNumberOfButton[6]]
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
        timer[7] = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[7]]-startTime[fileNumberOfButton[7]]
                                                 target:self
                                               selector:@selector(playEnd7:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }else{
        timer[7] = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[7]]-startTime[fileNumberOfButton[7]]
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
        timer[8] = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[8]]-startTime[fileNumberOfButton[8]]
                                                 target:self
                                               selector:@selector(playEnd8:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }else{
        timer[8] = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[8]]-startTime[fileNumberOfButton[8]]
                                                 target:self
                                               selector:@selector(playEndResetOn8:)
                                               userInfo:nil
                                                repeats:NO
                 ];
    }
    
}

-(void)playButtonAction:(int)buttonNumber{
    
    if (playReset[buttonNumber] == true) {
        [resetOnPlayer[buttonNumber][resetCount[buttonNumber]-1] stop];
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
        avPlayer[buttonNumber][playCount[buttonNumber]] = [[AVAudioPlayer alloc]initWithContentsOfURL:recordingURL error:nil];
        avPlayer[buttonNumber][playCount[buttonNumber]].delegate = self;
        avPlayer[buttonNumber][playCount[buttonNumber]].volume=1.0;
        avPlayer[buttonNumber][playCount[buttonNumber]].currentTime = startTime[fileNumberOfButton[buttonNumber]];
        [avPlayer[buttonNumber][playCount[buttonNumber]] play];
        playCount[buttonNumber]++;
        if (playCount[buttonNumber] >= 50) {
            playCount[buttonNumber] = 0;
        }
//        timer = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[buttonNumber]]-startTime[fileNumberOfButton[buttonNumber]]
//                                                 target:self
//                                               selector:@selector(playEnd:)
//                                               userInfo:nil
//                                                repeats:NO
//                 ];
    }else{
        resetOnPlayer[buttonNumber][resetCount[buttonNumber]] = [[AVAudioPlayer alloc]initWithContentsOfURL:recordingURL error:nil];
        resetOnPlayer[buttonNumber][resetCount[buttonNumber]].delegate = self;
        resetOnPlayer[buttonNumber][resetCount[buttonNumber]].volume=1.0;
        resetOnPlayer[buttonNumber][resetCount[buttonNumber]].currentTime = startTime[fileNumberOfButton[buttonNumber]];
        [resetOnPlayer[buttonNumber][resetCount[buttonNumber]] play];
        resetCount[buttonNumber]++;
        if (resetCount[buttonNumber] >= 50) {
            resetCount[buttonNumber] = 0;
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
    [avPlayer[0][stopCount[0]] stop];
    stopCount[0]++;
    if (stopCount[0] >= 50) {
        stopCount[0] = 0;
    }
}

-(void)playEndResetOn0:(NSTimer *)timer{
    [resetOnPlayer[0][stopCount2[0]] stop];
    stopCount2[0]++;
    if (stopCount2[0] >= 50) {
        stopCount2[0] = 0;
    }
}

-(void)playEnd1:(NSTimer *)timer{
    [avPlayer[1][stopCount[1]] stop];
    stopCount[1]++;
    if (stopCount[1] >= 50) {
        stopCount[1] = 0;
    }
}

-(void)playEndResetOn1:(NSTimer *)timer{
    [resetOnPlayer[1][stopCount2[0]] stop];
    stopCount2[1]++;
    if (stopCount2[1] >= 50) {
        stopCount2[1] = 0;
    }
}

-(void)playEnd2:(NSTimer *)timer{
    [avPlayer[2][stopCount[2]] stop];
    stopCount[2]++;
    if (stopCount[2] >= 50) {
        stopCount[2] = 0;
    }
}

-(void)playEndResetOn2:(NSTimer *)timer{
    [resetOnPlayer[2][stopCount2[2]] stop];
    stopCount2[2]++;
    if (stopCount2[2] >= 50) {
        stopCount2[2] = 0;
    }
}

-(void)playEnd3:(NSTimer *)timer{
    [avPlayer[3][stopCount[3]] stop];
    stopCount[3]++;
    if (stopCount[3] >= 50) {
        stopCount[3] = 0;
    }
}

-(void)playEndResetOn3:(NSTimer *)timer{
    [resetOnPlayer[3][stopCount2[3]] stop];
    stopCount2[3]++;
    if (stopCount2[3] >= 50) {
        stopCount2[3] = 0;
    }
}

-(void)playEnd4:(NSTimer *)timer{
    [avPlayer[4][stopCount[4]] stop];
    stopCount[4]++;
    if (stopCount[4] >= 50) {
        stopCount[4] = 0;
    }
}

-(void)playEndResetOn4:(NSTimer *)timer{
    [resetOnPlayer[4][stopCount2[4]] stop];
    stopCount2[4]++;
    if (stopCount2[4] >= 50) {
        stopCount2[4] = 0;
    }
}

-(void)playEnd5:(NSTimer *)timer{
    [avPlayer[5][stopCount[5]] stop];
    stopCount[5]++;
    if (stopCount[5] >= 50) {
        stopCount[5] = 0;
    }
}

-(void)playEndResetOn5:(NSTimer *)timer{
    [resetOnPlayer[5][stopCount2[5]] stop];
    stopCount2[5]++;
    if (stopCount2[5] >= 50) {
        stopCount2[5] = 0;
    }
}

-(void)playEnd6:(NSTimer *)timer{
    [avPlayer[6][stopCount[6]] stop];
    stopCount[6]++;
    if (stopCount[6] >= 50) {
        stopCount[6] = 0;
    }
}

-(void)playEndResetOn6:(NSTimer *)timer{
    [resetOnPlayer[6][stopCount2[6]] stop];
    stopCount2[6]++;
    if (stopCount2[6] >= 50) {
        stopCount2[6] = 0;
    }
}

-(void)playEnd7:(NSTimer *)timer{
    [avPlayer[7][stopCount[7]] stop];
    stopCount[7]++;
    if (stopCount[7] >= 50) {
        stopCount[7] = 0;
    }
}

-(void)playEndResetOn7:(NSTimer *)timer{
    [resetOnPlayer[7][stopCount2[7]] stop];
    stopCount2[7]++;
    if (stopCount2[7] >= 50) {
        stopCount2[7] = 0;
    }
}

-(void)playEnd8:(NSTimer *)timer{
    [avPlayer[8][stopCount[8]] stop];
    stopCount[8]++;
    if (stopCount[8] >= 50) {
        stopCount[8] = 0;
    }
}

-(void)playEndResetOn8:(NSTimer *)timer{
    [resetOnPlayer[8][stopCount2[8]] stop];
    stopCount2[8]++;
    if (stopCount2[8] >= 50) {
        stopCount2[8] = 0;
    }
}


-(void)reset{
    for (int j = 0; j < 9; j++) {
        for (int i = 0; i < 50; i++) {
            [avPlayer[j][i] stop];
            [resetOnPlayer [j][i] stop];
        }
        [timer[j] invalidate];
    }
}




@end
