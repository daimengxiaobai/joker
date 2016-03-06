//
//  HWTools.m
//  HappyWeekday
//
//  Created by scjy on 16/1/10.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "HWTools.h"

@implementation HWTools
#pragma mark -------- 时间转化方法
+ (NSString *)getDateFromString:(NSString *)timestamp{
    NSTimeInterval times = [timestamp doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:times];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy.MM.dd"];
    NSString *time = [dateFormatter stringFromDate:date];
    return time;
}
+(NSDate *)getSystemNowDate{
    //    WXQLog(@"%s - [%d]",__FUNCTION__,__LINE__);
    //创建一个NSDataFormatter显示刷新时间
    NSDateFormatter *df = [[NSDateFormatter alloc] init ];
    df.dateFormat = @"yyyy-MM-dd HH:mm";
    NSString *dateStr = [df stringFromDate:[NSDate date]];
    NSDate *date = [df dateFromString:dateStr];
    return date;
}

#pragma mark ----------根据文字最大显示宽高和文字内容返回文字高度
+ (CGFloat)getTextHeightWithText:(NSString *)text bigestSize:(CGSize)bigSize textFont:(CGFloat)font{
    CGRect textRect = [text boundingRectWithSize:bigSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil];
    return textRect.size.height;
}



@end
