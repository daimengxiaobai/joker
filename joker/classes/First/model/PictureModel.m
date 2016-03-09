//
//  PictureModel.m
//  joker
//
//  Created by scjy on 16/3/5.
//  Copyright © 2016年 肖楠. All rights reserved.
//

#import "PictureModel.h"
//initWithDictionary:groupDic with:dicti with:commentConut
@implementation PictureModel
- (instancetype)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    
    if (self) {
        self.category_name = dict[@"group"][@"category_name"];
        self.comment_count = dict[@"group"][@"comment_count"];
        self.digg_count = dict[@"group"][@"digg_count"];
        self.group_text = dict[@"group"][@"text"];
        self.share_count = dict[@"group"][@"share_count"];
        self.bury_count = dict[@"group"][@"bury_count"];
        self.repin_count = dict[@"group"][@"repin_count"];
        self.avatar_url = dict[@"group"][@"user"][@"avatar_url"];
        self.group_name = dict[@"group"][@"user"][@"name"];
        self.url = dict[@"group"][@"large_image"][@"url_list"][0][@"url"];
        NSDictionary *dic =  dict[@"group"][@"large_image"][@"url_list"][0];
        NSArray *array = [dic allKeys];
        self.number = array.count;
        self.r_width = dict[@"group"][@"large_image"][@"r_width"];
        self.r_height = dict[@"group"][@"large_image"][@"r_height"];
        self.category_id = dict[@"group"][@"category_id"];
        self.commontsArray = [NSMutableArray new];
        self.commontsArray = dict[@"comments"];
       
    }
           return self;
}
@end
