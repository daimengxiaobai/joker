//
//  DetailHeaderView.m
//  joker
//
//  Created by scjy on 16/3/9.
//  Copyright © 2016年 肖楠. All rights reserved.
//

#import "DetailHeaderView.h"
#import <UIImageView+WebCache.h>

@interface DetailHeaderView ()
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *userName;

@property (weak, nonatomic) IBOutlet UIButton *catetype;
@property (weak, nonatomic) IBOutlet UILabel *groupText;
@property (weak, nonatomic) IBOutlet UIImageView *largeImage;
@property (weak, nonatomic) NSString *category_id;
@end

@implementation DetailHeaderView
- (void)setPicModel:(PictureModel *)picModel{
    [self.catetype setTitle:[NSString stringWithFormat:@"%@",picModel.category_name] forState:UIControlStateNormal];
    
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:picModel.avatar_url]];
    self.userName.text = picModel.group_name;
    self.groupText.text = picModel.group_text;
    self.category_id = picModel.category_id;
    
    self.largeImage.frame = CGRectMake(9, 139 , [picModel.r_width floatValue] / 2 + 20, [picModel.r_height floatValue] / 2);
    [self.largeImage sd_setImageWithURL:[NSURL URLWithString:picModel.url]];
}


@end
