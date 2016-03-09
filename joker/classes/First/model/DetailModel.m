//
//  DetailModel.m
//  joker
//
//  Created by scjy on 16/3/9.
//  Copyright © 2016年 肖楠. All rights reserved.
//

#import "DetailModel.h"

@implementation DetailModel
- (instancetype)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.avatar_url = dict[@"avatar_url"];
        self.digg_count = dict[@"digg_count"];
        self.user_name = dict[@"user_name"];
        self.text = dict[@"text"];
        self.create_time = dict[@"create_time"];
    }
    return self;
}
@end
