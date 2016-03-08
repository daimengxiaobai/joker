//
//  PictureModel.h
//  joker
//
//  Created by scjy on 16/3/5.
//  Copyright © 2016年 肖楠. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PictureModel : NSObject
@property(nonatomic, retain) NSMutableArray *commontsArray;
 //group 的属性
    //category 分类（搞笑gif，搞笑囧图，来自世界的恶意等）
@property (nonatomic, assign) NSInteger number;
@property (nonatomic, copy) NSString *category_id;
@property (nonatomic, copy) NSString *category_name;
@property (nonatomic, copy) NSString *category_type;

@property (nonatomic, copy) NSString *comment_count;     //评论数

@property (nonatomic, copy) NSString *digg_count;        //点赞数
@property (nonatomic, copy) NSString *bury_count;        //踩
@property (nonatomic, copy) NSString *group_text;        //cell标题

@property (nonatomic, copy) NSString *share_count;        //分享

@property (nonatomic, copy) NSString *repin_count;        //转发
 //group属性下的user（发帖人）属性

@property (nonatomic, copy) NSString *avatar_url;        //头像网址
@property (nonatomic, copy) NSString *group_name;
 //group属性下的url_list（大图网址）属性
@property (nonatomic, copy) NSString *url;
 //group属性下的middle_image(图片尺寸)属性
@property (nonatomic, copy) NSString *r_height;
@property (nonatomic, copy) NSString *r_width;

//comments 评论里边的属性

@property (nonatomic, copy) NSString *comment_text;
@property (nonatomic, copy) NSString *comment_user_name;
@property (nonatomic, copy) NSString *comment_avatar_url;
@property (nonatomic, copy) NSString *comment_digg_count;



- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
