//
//  PicCommentModel.h
//  joker
//
//  Created by scjy on 16/3/6.
//  Copyright © 2016年 肖楠. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PicCommentModel : NSObject
//comments 评论里边的属性

@property (nonatomic, copy) NSString *comment_text;
@property (nonatomic, copy) NSString *comment_user_name;
@property (nonatomic, copy) NSString *comment_avatar_url;
@property (nonatomic, copy) NSString *comment_digg_count;


- (instancetype)initWithDictionary:(NSDictionary *)dicti ;

@end
