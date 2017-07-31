//
//  ZDBaseViewController.m
//  LimitTimeOut
//
//  Created by zhudong on 2017/7/31.
//  Copyright © 2017年 zhudong. All rights reserved.
//

#import "ZDBaseViewController.h"
#import "ZDTimeManager.h"
#import "ZDLoginController.h"

@interface ZDBaseViewController ()

@end

@implementation ZDBaseViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self compareTime];
    [ZDTimeManager resetTime];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(becomeActive) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resignActive) name:UIApplicationWillResignActiveNotification object:nil];
}

- (void)compareTime{
    ![ZDTimeManager isOver] ?  : [self jumpToLogin];
}

- (void)jumpToLogin{
    ZDLoginController *loginC = [[ZDLoginController alloc] init];
    [self.navigationController presentViewController:loginC animated:true completion:nil];
}

- (void)becomeActive{
    [self compareTime];
}

-(void)resignActive{
    [ZDTimeManager resetTime];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
