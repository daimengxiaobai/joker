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
    self.createTime.text = [HWTools getDateFromString:detailModel.create_time];
   
    [self.diggCount setTitle:[NSString stringWithFormat:@"%@", detailModel.digg_count] forState:UIControlStateNormal];
    if ([detailModel.avatar_url isKindOfClass:[NSNull class]]) {
        
    }else{
    [self.userImage sd_setImageWithURL:[NSURL URLWithString:detailModel.avatar_url]];
    }
    CGFloat a;
    if ([detailModel.text isKindOfClass:[NSNull class]]) {
//        self.text.hidden = YES;
        a = 0;
    }else{
        a =  [[self class] CommentText:detailModel.text];
    }
    self.text.text = detailModel.text;
    self.text.numberOfLines = 0;
    self.text.frame = CGRectMake(10, 75, 357, a);
}
+ (CGFloat)CommentText:(NSString *)commentText{
    CGRect TextRect = [commentText boundingRectWithSize:CGSizeMake(357, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]} context:nil];
    CGFloat a = TextRect.size.height;
    return a;
    
}

+ (CGFloat)getRowHeight:(DetailModel *)detailModel{
    CGFloat a;
    if ([detailModel.text isKindOfClass:[NSNull class]]) {
        a = 0;
       
    }else{
        a = [self CommentText:detailModel.text];
//   return [self CommentText:detailModel.text] + 85;
//       return 130;
  }
    return a + 85;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
