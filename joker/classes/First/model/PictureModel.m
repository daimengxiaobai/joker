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
        self.category_name = dict[@"category_name"];
        self.comment_count = dict[@"comment_count"];
        self.digg_count = dict[@"digg_count"];
        self.group_text = dict[@"group_text"];
        self.share_count = dict[@"share_count"];
        self.repin_count = dict[@"repin_count"];
        self.avatar_url = dict[@"user"][@"avatar_url"];
        self.group_name = dict[@"user"][@"name"];
        self.url = dict[@"middle_image"][@"url_list"][0][@"url"];
        self.r_width = dict[@"middle_image"][@"r_width"];
        self.r_height = dict[@"middle_image"][@"r_height"];
        }
    return self;
}
@end
