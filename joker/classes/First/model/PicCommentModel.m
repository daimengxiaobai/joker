//
//  PicCommentModel.m
//  joker
//
//  Created by scjy on 16/3/6.
//  Copyright © 2016年 肖楠. All rights reserved.
//

#import "PicCommentModel.h"

@implementation PicCommentModel
- (instancetype)initWithDictionary:(NSDictionary *)dicti {
    self = [super init];
    if (self) {
        self.comment_text = dicti[@"text"];
        self.comment_user_name = dicti[@"user_name"];
        self.comment_avatar_url = dicti[@"avatar_url"];
       self.comment_digg_count = dicti[@"digg_count"];
    }
    return self;
}
@end
