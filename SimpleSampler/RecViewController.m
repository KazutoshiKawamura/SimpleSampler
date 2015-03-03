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
    naming.hidden=true;
    naming.keyboardType = UIKeyboardTypeDefault;
    naming.delegate=self;
    //    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    btn.frame = CGRectMake(0, 0, 150, 150);
    [btn setImage:[UIImage imageNamed:@"RecStartButton.png"] forState:UIControlStateNormal];
    //    [self.view addSubview:btn];
    //    [self.view addSubview:btn];
    
    label.text = [NSString stringWithFormat:@"File No.%d",_selectedFileNumber+1];
    
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
        //    [avRecorder recordForDuration: 5.0];
        
        [avRecorder record];
        
        buttonCondition = 1;
        //    UIImage: image = [UIImage imageNamed:@"RecStopButton.png"];
        //        [button setImage:image forState:UIControlStateNormal];
        
        [btn setImage:[UIImage imageNamed:@"RecStopButton.png"] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        
        
        
        
    }else if (buttonCondition == 1){
        [avRecorder stop];
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

-(IBAction)deleteRec:(id)sender{
    buttonCondition = 0;
    [btn setImage:[UIImage imageNamed:@"RecStartButton.png"] forState:UIControlStateNormal];
    naming.hidden=true;
    naming.text=[NSString stringWithFormat:@""];
}

-(IBAction)done:(id)sender{
    if (buttonCondition == 2) {
        EditViewController *editVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"EditViewController"];
        editVC.selectedFileNumber = _selectedFileNumber;
        [self presentViewController:editVC animated:YES completion:nil];
    }
    
    //    naming.returnKeyType = UIReturnKeyDone;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    //    name = naming.text;
    name=naming.text;
    label.text=name;
    // キーボードを隠す
    //        [self.view endEditing:YES];
    [textField resignFirstResponder];
    
    NSString *homeDir = NSHomeDirectory();
    NSString *filePath2 = [homeDir stringByAppendingPathComponent:[NSString stringWithFormat:@"name%d.txt",dataNumber]];
    // ファイルマネージャを作成
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // 注意．
    // ファイルに書き込もうとしたときに該当のファイルが存在しないとエラーになるため
    // ファイルが存在しない場合は空のファイルを作成する
    
    // ファイルが存在しないか?
    if (![fileManager fileExistsAtPath:filePath2]) { // yes
        // 空のファイルを作成する
        BOOL result = [fileManager createFileAtPath:filePath2
                                           contents:[NSData data] attributes:nil];
        if (!result) {
            NSLog(@"ファイルの作成に失敗");
            //            return;
        }
    }
    
    // ファイルハンドルを作成する
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:filePath2];
    if (!fileHandle) {
        NSLog(@"ファイルハンドルの作成に失敗");
        //        return;
    }
    
    // ファイルに書き込むデータ1を作成
    NSData *nameData1 = [NSData dataWithBytes:name.UTF8String
                                       length:name.length];
    // ファイルに書き込む
    [fileHandle writeData:nameData1];
    
    // 効率化のためにすぐにファイルに書き込まれずキャッシュされることがある．
    // 「synchronizeFile」メソッドを使用することで
    // キャッシュされた情報を即座に書き込むことが可能．
    [fileHandle synchronizeFile];
    
    // ファイルを閉じる
    [fileHandle closeFile];
    
    NSLog(@"ファイルの書き込みが完了しました．");
    
    NSUserDefaults *savedName = [NSUserDefaults standardUserDefaults];
    //    [ud setInteger:100 forKey:@"KEY_I"];  // int型の100をKEY_Iというキーで保存
    [savedName setObject:name forKey:@"NAME"];
    [savedName setInteger:dataNumber forKey:@"DATA_NUMBER"];
    [savedName setBool:true forKey:@"ADD_MODE"];
    
    
    
    
    
    return YES;
}






@end
