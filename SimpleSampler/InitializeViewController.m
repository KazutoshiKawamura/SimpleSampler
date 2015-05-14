//
//  InitializeViewController.m
//  SimpleSampler
//
//  Created by kztskawamu on 2015/03/03.
//  Copyright (c) 2015年 kztskawamu. All rights reserved.
//

#import "InitializeViewController.h"

@interface InitializeViewController ()

@end

@implementation InitializeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    label.text = [NSString stringWithFormat:@"File No.%d",_selectedFileNumber+1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)yesDeleteAll{
    NSUserDefaults *savedFile = [NSUserDefaults standardUserDefaults];
    for (int i = 0; i < 20; i++) {
        [savedFile setObject:@"(No Sound)" forKey:[NSString stringWithFormat:@"NAME%d",i]];
        [savedFile setBool:false forKey:[NSString stringWithFormat:@"PLAY_RESET%d",i]];
        [savedFile setFloat:0.0f forKey:[NSString stringWithFormat:@"START_TIME%d",i]];
        [savedFile setFloat:0.0f forKey:[NSString stringWithFormat:@"END_TIME%d",i]];
        [savedFile setFloat:0.0f forKey:[NSString stringWithFormat:@"FILE_TIME%d",i]];
        
        
        [self recFileDlelete:i];
        
    }
    for (int i = 0; i < 9; i++) {
        [savedFile setInteger:i forKey:[NSString stringWithFormat:@"FILE_NUMBER_OF_BUTTON%d",i]];
    }
    
    PlayViewController *playVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"PlayViewController"];
    [self presentViewController:playVC animated:YES completion:nil];
    
}

-(IBAction)yesDelete{
    NSUserDefaults *savedFile = [NSUserDefaults standardUserDefaults];
    [savedFile setObject:@"(No Sound)" forKey:[NSString stringWithFormat:@"NAME%d",_selectedFileNumber]];
    [savedFile setBool:false forKey:[NSString stringWithFormat:@"PLAY_RESET%d",_selectedFileNumber]];
    [savedFile setFloat:0.0f forKey:[NSString stringWithFormat:@"START_TIME%d",_selectedFileNumber]];
    [savedFile setFloat:0.0f forKey:[NSString stringWithFormat:@"END_TIME%d",_selectedFileNumber]];
    [savedFile setFloat:0.0f forKey:[NSString stringWithFormat:@"FILE_TIME%d",_selectedFileNumber]];
    
    [self recFileDlelete:_selectedFileNumber];
    
    PlayViewController *playVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"PlayViewController"];
    [self presentViewController:playVC animated:YES completion:nil];
}


-(void)recFileDlelete:(int)i {
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
    
    NSLog(documentDir);
    
    NSString *path = [documentDir stringByAppendingPathComponent:[NSString stringWithFormat:@"rec%d.caf",i]];
    
    NSURL *recordingURL = [NSURL fileURLWithPath:path];
    
    avRecorder = [[AVAudioRecorder alloc] initWithURL:recordingURL settings:nil error:&error];
    avRecorder.delegate=self;
    [avRecorder record];
    [avRecorder stop];
    [avRecorder deleteRecording];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
