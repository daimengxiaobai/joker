//
//  DetailModel.h
//  joker
//
//  Created by scjy on 16/3/9.
//  Copyright © 2016年 肖楠. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailModel : NSObject

@property (nonatomic, copy) NSString *avatar_url;
@property (nonatomic, copy) NSString *create_time;
@property (nonatomic, copy) NSNumber *digg_count;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *user_name;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
