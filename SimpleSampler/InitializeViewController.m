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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)yes{
    NSUserDefaults *savedFile = [NSUserDefaults standardUserDefaults];
    for (int i = 0; i < 20; i++) {
        [savedFile setObject:@"(No Sound)" forKey:[NSString stringWithFormat:@"NAME%d",i]];
        [savedFile setBool:false forKey:[NSString stringWithFormat:@"PLAY_RESET%d",i]];
    }
    for (int i = 0; i < 9; i++) {
        [savedFile setInteger:i forKey:[NSString stringWithFormat:@"FILE_NUMBER_OF_BUTTON%d",i]];
    }
    
    PlayViewController *playVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"PlayViewController"];
    [self presentViewController:playVC animated:YES completion:nil];
    
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
