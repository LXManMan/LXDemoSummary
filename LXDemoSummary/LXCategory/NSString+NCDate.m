//
//  NSString+NCDate.m
//  NatureCard
//
//  Created by zhongzhi on 2017/8/18.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import "NSString+NCDate.h"

@implementation NSString (NCDate)
+(NSString *)timeIntervalFromTimeStr:(NSString *)timeStr{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    // 设置日期格式(为了转换成功)
    fmt.dateFormat = @"yyyy-MM-dd";
    // NSString * -> NSDate *
    NSDate *date = [fmt dateFromString:timeStr];
    
    return [NSString stringWithFormat:@"%.f",date.timeIntervalSince1970 *1000];
}
+(NSString *)formateDate:(NSString *)string{
    NSTimeInterval second = string.longLongValue / 1000.0; //毫秒需要除
    
    // 时间戳 -> NSDate *
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:second];
    //    NSLog(@"%@", date);
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm";
    
    NSString *stringNew = [fmt stringFromDate:date];
    return stringNew;
}
+(NSString *)formateDateToDay:(NSString *)string{
    NSTimeInterval second = string.longLongValue / 1000.0; //毫秒需要除
    
    // 时间戳 -> NSDate *
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:second];
    //    NSLog(@"%@", date);
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *stringNew = [fmt stringFromDate:date];
    return stringNew;
}
+(NSInteger)getNowInterVal{
    NSDate  *date = [NSDate date];
    return date.timeIntervalSince1970 * 1000; //乘以1000为毫秒
}
+(NSString *)getNowTime{
    NSDate  *date = [NSDate date];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    // 设置日期格式(为了转换成功)
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *dateStr =[fmt stringFromDate:date];
    return dateStr;
}


+(NSString *)getWeekFirstDay{
    NSDate *nowDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitDay fromDate:nowDate];
    // 获取今天是周几
    NSInteger weekDay = [comp weekday];
    // 获取几天是几号
    NSInteger day = [comp day];
    //    NSLog(@"%d----%d",weekDay,day);
    
    // 计算当前日期和本周的星期一和星期天相差天数
    long firstDiff,lastDiff;
    //    weekDay = 1;
    if (weekDay == 1)
    {
        firstDiff = -6;
        lastDiff = 0;
    }
    else
    {
        firstDiff = [calendar firstWeekday] - weekDay + 1;
        lastDiff = 8 - weekDay;
    }
    //    NSLog(@"firstDiff: %ld   lastDiff: %ld",firstDiff,lastDiff);
    
    // 在当前日期(去掉时分秒)基础上加上差的天数
    NSDateComponents *firstDayComp =[calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitDay fromDate:nowDate];
    [firstDayComp setDay:day + firstDiff];
    NSDate *firstDayOfWeek = [calendar dateFromComponents:firstDayComp];
    
    NSDateComponents *lastDayComp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitDay fromDate:nowDate];
    [lastDayComp setDay:day + lastDiff];
    NSDate *lastDayOfWeek = [calendar dateFromComponents:comp];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *firstDay = [formatter stringFromDate:firstDayOfWeek];
    //    NSString *lastDay = [formatter stringFromDate:lastDayOfWeek];
    //    NSLog(@"%@=======%@",firstDay,lastDay);
    
    return firstDay;
}
+(NSString *)getMonthFirstDay{
    NSDate *now = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *comps = [cal components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitDay fromDate:now];
    comps.day = 1;
    NSDate *firstDay = [cal dateFromComponents:comps];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *first = [formatter stringFromDate:firstDay];
    
    
    //    NSString *dateStr = [NSString stringWithFormat:@"%@-%@",firstDay,lastDay];
    return first;
}

@end
