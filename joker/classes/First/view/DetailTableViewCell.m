//
//  DetailTableViewCell.m
//  joker
//
//  Created by scjy on 16/3/9.
//  Copyright © 2016年 肖楠. All rights reserved.
//

#import "DetailTableViewCell.h"
#import <UIImageView+WebCache.h>

@interface DetailTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *createTime;
@property (weak, nonatomic) IBOutlet UIButton *diggCount;
@property (weak, nonatomic) IBOutlet UILabel *text;

@end

@implementation DetailTableViewCell
- (void)setDetailModel:(DetailModel *)detailModel{
    self.userName.text = detailModel.user_name;
    self.createTime.text = detailModel.create_time;
    self.text.text = detailModel.text;
    [self.diggCount setTitle:detailModel.digg_count forState:UIControlStateNormal];
    [self.userImage sd_setImageWithURL:[NSURL URLWithString:detailModel.avatar_url]];
    
}
+ (CGFloat)CommentText:(NSString *)commentText{
    CGRect TextRect = [commentText boundingRectWithSize:CGSizeMake(357, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]} context:nil];
    CGFloat a = TextRect.size.height;
    return a;
    
}

+ (CGFloat)getRowHeight:(DetailModel *)detailModel{
    return [self CommentText:detailModel.text] + 100;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
