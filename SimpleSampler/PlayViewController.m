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
    resetCount = 0;
    resetCount2 = 0;
    
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
    FileTableViewController *tableVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"FileTableViewController"];
    tableVC.situation = 1;
    [self presentViewController:tableVC animated:YES completion:nil];//YESならModal,Noなら何もなし
    //    FileTableViewController.situation = 1;
    //    [self performSegueWithIdentifier:@"toFileTableViewController" sender:self];
}

-(IBAction)add{
    FileTableViewController *tableVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"FileTableViewController"];
    tableVC.situation = 0;
    [self presentViewController:tableVC animated:YES completion:nil];//YESならModal,Noなら何もなし
    //    [self performSegueWithIdentifier:@"toFileTableViewController" sender:self];
}

-(IBAction)edit{
    FileTableViewController *tableVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"FileTableViewController"];
    tableVC.situation = 2;
    [self presentViewController:tableVC animated:YES completion:nil];//YESならModal,Noなら何もなし
}



-(IBAction)playButtonAction0{
    [self playButtonAction:0];
    
}

-(IBAction)playButtonAction1{
    [self playButtonAction:1];
}

-(IBAction)playButtonAction2{
    [self playButtonAction:2];
    
}

-(IBAction)playButtonAction3{
    [self playButtonAction:3];
    
}

-(IBAction)playButtonAction4{
    [self playButtonAction:4];
    
}

-(IBAction)playButtonAction5{
    [self playButtonAction:5];
    
}

-(IBAction)playButtonAction6{
    [self playButtonAction:6];
    
}

-(IBAction)playButtonAction7{
    [self playButtonAction:7];
    
}

-(IBAction)playButtonAction8{
    [self playButtonAction:8];
    
}

-(void)playButtonAction:(int)buttonNumber{
    
    if (playReset[buttonNumber] == true) {
        resetCount = resetCount2;
        resetCount2 = playCount;
        [avPlayer[resetCount] stop];
//        if (resetCount == 0) {
//            [avPlayer[resetCount] stop];
//        }else{
//            [avPlayer[playCount-1] stop];
//        }
    }
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryAmbient error:nil];
    
    
    // 録音ファイルパス
    NSArray *filePaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask,YES);
    NSString *documentDir = [filePaths objectAtIndex:0];
    NSString *path = [documentDir stringByAppendingPathComponent:[NSString stringWithFormat:@"rec%d.caf",fileNumberOfButton[buttonNumber]]];
    NSURL *recordingURL = [NSURL fileURLWithPath:path];
    
    avPlayer[playCount] = [[AVAudioPlayer alloc]initWithContentsOfURL:recordingURL error:nil];
    avPlayer[playCount].delegate = self;
    avPlayer[playCount].volume=1.0;
    avPlayer[playCount].currentTime = startTime[fileNumberOfButton[buttonNumber]];
    [avPlayer[playCount] play];
    playCount++;
    if (playCount >= 50) {
        playCount = 0;
    }
    
    timer = [NSTimer scheduledTimerWithTimeInterval:endTime[fileNumberOfButton[buttonNumber]]-startTime[fileNumberOfButton[buttonNumber]]
                                             target:self
                                           selector:@selector(playEnd)
                                           userInfo:nil
                                            repeats:NO
             ];
    
}

-(void)playEnd{
    [avPlayer[stopCount] stop];
    stopCount++;
}




@end
