//
//  AddViewController.m
//  SimpleSampler
//
//  Created by kztskawamu on 2015/03/03.
//  Copyright (c) 2015年 kztskawamu. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"Google Mobile Ads SDK version: %@", [GADRequest sdkVersion]);
    self.bannerView.adUnitID = @"ca-app-pub-1376424253937363/2978674733";
    self.bannerView.rootViewController = self;
    GADBannerView *bannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeSmartBannerPortrait];
    [self.bannerView loadRequest:[GADRequest request]];
    
    savedFile = [NSUserDefaults standardUserDefaults];
    for (int i = 0; i < 9; i++) {
        fileNumberOfButton[i]=[savedFile integerForKey:[NSString stringWithFormat:@"FILE_NUMBER_OF_BUTTON%d",i]];
        
        if ([savedFile integerForKey:[NSString stringWithFormat:@"FILE_NUMBER_OF_BUTTON%d",i]] == i) {
            fileNumberOfButton[i] = i;
        }
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)cancel{
    [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
}


-(IBAction)addButtonAction0{
    [self addButtonAction:0];
}

-(IBAction)addButtonAction1{
    [self addButtonAction:1];
}

-(IBAction)addButtonAction2{
    [self addButtonAction:2];
}

-(IBAction)addButtonAction3{
    [self addButtonAction:3];
}

-(IBAction)addButtonAction4{
    [self addButtonAction:4];
}

-(IBAction)addButtonAction5{
    [self addButtonAction:5];
}

-(IBAction)addButtonAction6{
    [self addButtonAction:6];
}

-(IBAction)addButtonAction7{
    [self addButtonAction:7];
}

-(IBAction)addButtonAction8{
    [self addButtonAction:8];
}


-(void)addButtonAction:(int)buttonNumber{
    savedFile = [NSUserDefaults standardUserDefaults];
    [savedFile setInteger:_selectedFileNumber forKey:[NSString stringWithFormat:@"FILE_NUMBER_OF_BUTTON%d",buttonNumber]];
    [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
    
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
