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
//    playResetSwitch.on = false;
    if ([savedFile boolForKey:[NSString stringWithFormat:@"PLAY_RESET%d",_selectedFileNumber]] == false) {
        playResetSwitch.on = false;
    }else{
        playResetSwitch.on = true;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    //    name = naming.text;
//    name=naming.text;
//    label.text=name;
    // キーボードを隠す
    //        [self.view endEditing:YES];
    [textField resignFirstResponder];
    [self.view endEditing:YES];
    
//    [savedFile setObject:naming.text forKey:[NSString stringWithFormat:@"NAME%d",_selectedFileNumber]];
//    
//    NSUserDefaults *savedName = [NSUserDefaults standardUserDefaults];
//    //    [ud setInteger:100 forKey:@"KEY_I"];  // int型の100をKEY_Iというキーで保存
//    [savedName setObject:name forKey:@"NAME"];
//    [savedName setInteger:dataNumber forKey:@"DATA_NUMBER"];
//    [savedName setBool:true forKey:@"ADD_MODE"];
    
//    fileNumberLabel.text = naming.text;
    
    
    
    
    return YES;
}
-(IBAction)SelectFile{
    FileTableViewController *tableVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"FileTableViewController"];
    tableVC.situation = 2;
    [self presentViewController:tableVC animated:YES completion:nil];//YESならModal,Noなら何もなし
}

-(IBAction)save{
    [savedFile setObject:naming.text forKey:[NSString stringWithFormat:@"NAME%d",_selectedFileNumber]];
    PlayViewController *playVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"PlayViewController"];
    if (playResetSwitch.on == false) {
        [savedFile setBool:false forKey:[NSString stringWithFormat:@"PLAY_RESET%d",_selectedFileNumber]];
    }else{
        [savedFile setBool:true forKey:[NSString stringWithFormat:@"PLAY_RESET%d",_selectedFileNumber]];
    }
    [self presentViewController:playVC animated:YES completion:nil];//YESならModal,Noなら何もなし
}

-(IBAction)cancel{
    PlayViewController *playVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"PlayViewController"];
    [self presentViewController:playVC animated:YES completion:nil];//YESならModal,Noなら何もなし
}

- (void)switchValueChanged:(id)sender
{
    playResetSwitch = sender;
    if (playResetSwitch.on) {
        
    } else {
        
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

