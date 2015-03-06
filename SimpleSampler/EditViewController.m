//
//  EditViewController.m
//  SimpleSampler
//
//  Created by kztskawamu on 2015/03/03.
//  Copyright (c) 2015年 kztskawamu. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    savedFile = [NSUserDefaults standardUserDefaults];
    naming.keyboardType = UIKeyboardTypeDefault;
    naming.returnKeyType = UIReturnKeyDone;
    naming.delegate=self;
    naming.text = [savedFile stringForKey:[NSString stringWithFormat:@"NAME%d",_selectedFileNumber]];
    fileNumberLabel.text = [NSString stringWithFormat:@"File No.%d",_selectedFileNumber+1];
    [playResetSwitch addTarget:self
                  action:@selector(switchValueChanged:)
        forControlEvents:UIControlEventValueChanged];
    if ([savedFile boolForKey:[NSString stringWithFormat:@"PLAY_RESET%d",_selectedFileNumber]] == false) {
        playResetSwitch.on = false;
    }else{
        playResetSwitch.on = true;
    }
    startTime = [savedFile floatForKey:[NSString stringWithFormat:@"START_TIME%d",_selectedFileNumber]];
    fileTime = [savedFile floatForKey:[NSString stringWithFormat:@"FILE_TIME%d",_selectedFileNumber]];
    endTime = [savedFile floatForKey:[NSString stringWithFormat:@"END_TIME%d",_selectedFileNumber]];
    _startSlider.minimumValue = 0.0f;
    _startSlider.maximumValue = fileTime;
    _startSlider.value = startTime;
    _endSlider.minimumValue = 0.0f;
    _endSlider.maximumValue = fileTime;
    _endSlider.value = endTime;
    [_startSlider addTarget:self
                     action:@selector(didStartValueChanged:)
           forControlEvents:UIControlEventValueChanged];
    [_endSlider addTarget:self
                     action:@selector(didEndValueChanged:)
           forControlEvents:UIControlEventValueChanged];
    start.keyboardType = UIKeyboardTypeDecimalPad;
    start.delegate = self;
    start.text = [NSString stringWithFormat:@"%05.2f",startTime];
    end.keyboardType = UIKeyboardTypeDecimalPad;
    end.delegate = self;
    end.text = [NSString stringWithFormat:@"%05.2f",endTime];
    playCount = 0;
    stopCount = 0;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    [self.view endEditing:YES];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [start resignFirstResponder];
    [end resignFirstResponder];
    [naming resignFirstResponder];
    _startSlider.value = start.text.floatValue;
    _endSlider.value = end.text.floatValue;
}

-(IBAction)initialize{
    [self reset];
    InitializeViewController *initializeVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"InitializeViewController"];
    [self presentViewController:initializeVC animated:YES completion:nil];//YESならModal,Noなら何もなし
}

-(IBAction)SelectFile{
    [self reset];
    FileTableViewController *tableVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"FileTableViewController"];
    tableVC.situation = 2;
    tableVC.selectedFileNumber = _selectedFileNumber;
    [self presentViewController:tableVC animated:YES completion:nil];//YESならModal,Noなら何もなし
}

-(IBAction)save{
    [self reset];
    [savedFile setObject:naming.text forKey:[NSString stringWithFormat:@"NAME%d",_selectedFileNumber]];
    PlayViewController *playVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"PlayViewController"];
    if (playResetSwitch.on == false) {
        [savedFile setBool:false forKey:[NSString stringWithFormat:@"PLAY_RESET%d",_selectedFileNumber]];
    }else{
        [savedFile setBool:true forKey:[NSString stringWithFormat:@"PLAY_RESET%d",_selectedFileNumber]];
    }
    [savedFile setFloat:startTime forKey:[NSString stringWithFormat:@"START_TIME%d",_selectedFileNumber]];
    [savedFile setFloat:endTime forKey:[NSString stringWithFormat:@"END_TIME%d",_selectedFileNumber]];
    [self presentViewController:playVC animated:YES completion:nil];//YESならModal,Noなら何もなし
}

-(IBAction)cancel{
    [self reset];
    PlayViewController *playVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"PlayViewController"];
    [self presentViewController:playVC animated:YES completion:nil];//YESならModal,Noなら何もなし
}

-(IBAction)testPlay{
    if (playResetSwitch.on == true) {
        if (playCount == 0) {
            [avPlayer[49] stop];
        }else{
            [avPlayer[playCount-1] stop];
        }
    }
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
    avPlayer[playCount].currentTime = startTime;
    [avPlayer[playCount] play];
    playCount++;
    if (playCount >= 50) {
        playCount = 0;
    }
    timer = [NSTimer scheduledTimerWithTimeInterval:endTime-startTime
                                              target:self
                                            selector:@selector(playEnd)
                                            userInfo:nil
                                             repeats:NO
              ];

}

- (void)switchValueChanged:(id)sender
{
    playResetSwitch = sender;
    if (playResetSwitch.on) {
        
    } else {
        
    }
}

-(void)didStartValueChanged:( UISlider *)slider{
    startTime = slider.value;
    start.text = [NSString stringWithFormat:@"%05.2f",startTime];
}

-(void)didEndValueChanged:( UISlider *)slider{
    endTime = slider.value;
    end.text = [NSString stringWithFormat:@"%05.2f",endTime];
}

-(void)playEnd{
    [avPlayer[stopCount] stop];
    stopCount++;
}

-(void)reset{
    [timer invalidate];
    for (int i = 0; i < 50; i++) {
        [avPlayer[i] stop];
    }
}





/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
//------------------------------------------

@end

