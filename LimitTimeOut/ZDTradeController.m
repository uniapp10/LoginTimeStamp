//
//  ZDTradeController.m
//  LimitTimeOut
//
//  Created by zhudong on 2017/7/31.
//  Copyright © 2017年 zhudong. All rights reserved.
//

#import "ZDTradeController.h"
#import "ZDProductController.h"
#import "ZDMoneyController.h"
#import "ZDTimeManager.h"

@interface ZDTradeController ()

@end

@implementation ZDTradeController

#define ScreenSize [UIScreen mainScreen].bounds.size
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ZDTimeManager resetTime];
    self.title = @"交易模块";
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat btnW = 100;
    CGFloat leftMargin = 30;
    CGFloat centerMargin  = ScreenSize.width - 2 * (btnW + leftMargin);
    btn.frame = CGRectMake(leftMargin, 100, btnW, 40);
    btn.backgroundColor = [UIColor greenColor];
    [btn setTitle:@"拥有产品" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn_close = [UIButton buttonWithType:UIButtonTypeCustom];
    btn_close.frame = CGRectMake(leftMargin + btnW + centerMargin, 100, btnW, 40);
    btn_close.backgroundColor = [UIColor redColor];
    [btn_close setTitle:@"资金分布" forState:UIControlStateNormal];
    [btn_close addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_close];
}


- (void)show {
    ZDProductController *productC = [[ZDProductController alloc] init];
    [self.navigationController pushViewController:productC animated:true];
}

- (void)close {
    ZDMoneyController *moneyC = [[ZDMoneyController alloc] init];
    [self.navigationController pushViewController:moneyC animated:true];
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
