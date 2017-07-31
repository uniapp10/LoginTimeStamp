//
//  ZDLoginController.m
//  LimitTimeOut
//
//  Created by zhudong on 2017/7/31.
//  Copyright © 2017年 zhudong. All rights reserved.
//

#import "ZDLoginController.h"
#import "ZDTradeController.h"

@interface ZDLoginController ()
@property (weak, nonatomic) IBOutlet UITextField *accountTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;

@end

@implementation ZDLoginController

#define ScreenSize [UIScreen mainScreen].bounds.size
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)login {
    
    if (!([self.accountTF.text isEqualToString:@"admin"] && [self.pwdTF.text isEqualToString:@"123"])) {
        UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"用户名或密码错啦" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertV show];
        return;
    }
    if (!self.navigationController) {
        [self dismissViewControllerAnimated:true completion:nil];
    }
    
    ZDTradeController *tradeC = [[ZDTradeController alloc] init];
    ((UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController).viewControllers = @[tradeC];
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
