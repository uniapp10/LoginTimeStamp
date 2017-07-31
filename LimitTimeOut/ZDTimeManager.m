//
//  ZDTimeManager.m
//  LimitTimeOut
//
//  Created by zhudong on 2017/7/31.
//  Copyright © 2017年 zhudong. All rights reserved.
//

#import "ZDTimeManager.h"

#define ZDTimeStamp @"ZDTimeStamp"
//定时,以分钟为单位
#define TimeInterval 0.1

@implementation ZDTimeManager

+ (void)resetTime{
    NSNumber *currentTime = [NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]];
    [[NSUserDefaults standardUserDefaults] setObject:currentTime forKey:ZDTimeStamp];
    [[NSUserDefaults standardUserDefaults] synchronize];
};

+ (BOOL)isOver{
    NSTimeInterval currentTime =  [[NSDate date] timeIntervalSince1970];
    NSNumber *oldTimeStamp = [[NSUserDefaults standardUserDefaults] objectForKey:ZDTimeStamp];
    //防止时间戳存储错误
    if (!oldTimeStamp) {
        [self resetTime];
    }
    NSTimeInterval oldTime = [oldTimeStamp doubleValue];
    if ((currentTime - oldTime) > TimeInterval * 60) {
        return true;
    }
    return false;
}
@end
