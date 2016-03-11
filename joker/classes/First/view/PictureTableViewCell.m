//
//  PictureTableViewCell.m
//  joker
//
//  Created by scjy on 16/3/5.
//  Copyright © 2016年 肖楠. All rights reserved.
//

#import "PictureTableViewCell.h"
#import <UIImageView+WebCache.h>

@interface PictureTableViewCell ()


////group 的属性
@property (weak, nonatomic) NSString *category_id;
@property (weak, nonatomic) IBOutlet UIButton *category_name;
@property (weak, nonatomic) IBOutlet UIButton *comment_count;

@property (weak, nonatomic) IBOutlet UIButton *digg_count;
@property (weak, nonatomic) IBOutlet UILabel *group_text;
@property (weak, nonatomic) IBOutlet UIButton *share_count;
@property (weak, nonatomic) IBOutlet UIImageView *avatar_url;
@property (weak, nonatomic) IBOutlet UILabel *group_name;
//大图网址

//@property (retain, nonatomic) UIImageView *largeView;
//@property (retain, nonatomic) UIImageView *smileView;
@property (weak, nonatomic) IBOutlet UIImageView *picView;



@property (weak, nonatomic) IBOutlet UIView *view;

//view1
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIImageView *comment_avatar_url;
@property (weak, nonatomic) IBOutlet UILabel *comment_user_name;

@property (weak, nonatomic) IBOutlet UILabel *comment_text;
@property (weak, nonatomic) IBOutlet UIButton *comment_digg_count;

//view2
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIImageView *comment_avatar_url2;
@property (weak, nonatomic) IBOutlet UILabel *comment_user_name2;
@property (weak, nonatomic) IBOutlet UILabel *comment_text2;
@property (weak, nonatomic) IBOutlet UIButton *comment_digg_count2;
@property (weak, nonatomic) IBOutlet UIButton *bury_count;

@end

@implementation PictureTableViewCell

- (void)clickButton:(UIButton *)btn{
    if (self.delegate && [self.delegate respondsToSelector:@selector(getButonTag:)]) {
        [self.delegate getButonTag:btn.tag];
    }
}
- (void)setPictureModel:(PictureModel *)pictureModel{
    [self.comment_count setTitle:[NSString stringWithFormat:@"%@",pictureModel.comment_count] forState:UIControlStateNormal];
    
    [self.category_name setTitle:[NSString stringWithFormat:@"%@",pictureModel.category_name] forState:UIControlStateNormal];
    [self.digg_count setTitle:[NSString stringWithFormat:@"%@",pictureModel.digg_count] forState:UIControlStateNormal];
    [self.bury_count setTitle:[NSString stringWithFormat:@"%@",pictureModel.bury_count] forState:UIControlStateNormal];
    
    [self.share_count setTitle:[NSString stringWithFormat:@"%@",pictureModel.share_count] forState:UIControlStateNormal];
    self.share_count.tag = 1;
    [self.share_count addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.avatar_url sd_setImageWithURL:[NSURL URLWithString:pictureModel.avatar_url]];
    self.group_name.text = pictureModel.group_name;
   // NSInteger categoryId = [pictureModel.category_id integerValue];
    /*
     [爆笑GIF 10]  [脑残对话 15][奇葩新闻 77][奇葩卖家的二三事 81][搞笑囧图 2][][][][]
    [来自世界的恶意 80]
     */


    
    NSInteger count ;
    count = pictureModel.commontsArray.count;
    
    CGFloat a ,b, c;
    
    if ([pictureModel.group_text isKindOfClass:[NSNull class]]) {
        a = 0;
    }else{
        a = [[self class] getGroupTextHeight:pictureModel.group_text];
    }
    CGRect frame = self.group_text.frame;
    frame.size.height = a;
    self.group_text.frame = frame;
    self.group_text.text = pictureModel.group_text;
    self.group_text.numberOfLines = 0;
    self.category_id = pictureModel.category_id;
    if ([pictureModel.category_id integerValue] == 10) {
        self.picView.frame = CGRectMake(10, 86 + a, 357, 200);
    }else{
    self.picView.frame = CGRectMake(15, 86 + a, [pictureModel.r_width floatValue] / 2 + 20, [pictureModel.r_height floatValue] / 2);
    }
    [self.picView sd_setImageWithURL:[NSURL URLWithString:pictureModel.url]];

   
    if (count == 0) {
        self.view1.hidden = YES;
        self.view2.hidden = YES;
         self.view.frame = CGRectMake(10, self.picView.bottom + 15, 375, 30);
    }else if (count == 1){
        if ([pictureModel.commontsArray[0][@"text"] isKindOfClass:[NSNull class]]) {
            b = 0;
        }else{
            b = [[self class] CommentText1:pictureModel.commontsArray[0][@"text"]];
        }
        NSDictionary *dic1 = pictureModel.commontsArray[0];
        self.view2.hidden = YES;
        self.view1.hidden = NO;
        self.view1.frame = CGRectMake(10, self.picView.bottom, 357, b + 50);
        self.view.frame = CGRectMake(10, self.picView.bottom + b + 50 + 15, 375, 30);
        self.comment_user_name.text = dic1[@"user_name"];
        [self.comment_avatar_url sd_setImageWithURL:[NSURL URLWithString:dic1[@"avatar_url"]]];
        [self.comment_digg_count setTitle:[NSString stringWithFormat:@"%@",dic1[@"digg_count"]] forState:UIControlStateNormal];
        CGRect frame1 = self.comment_text.frame;
        frame1.size.height = b;
        self.comment_text.frame = frame1;
        self.comment_text.text = dic1[@"text"];
        self.comment_text.numberOfLines = 0;
        
    }else if (count == 2){
        self.view1.hidden = NO;
        self.view2.hidden = NO;
        if ([pictureModel.commontsArray[0][@"text"] isKindOfClass:[NSNull class]]) {
            b = 0;
        }else{
            b = [[self class] CommentText1:pictureModel.commontsArray[0][@"text"]];
        }
        if ([pictureModel.commontsArray[1][@"text"] isKindOfClass:[NSNull class]]) {
            c = 0;
        }else{
            c = [[self class] CommentText2:pictureModel.commontsArray[1][@"text"]];
        }
        
        self.view1.frame = CGRectMake(10, self.picView.bottom, 357, b + 50);
        self.view2.frame = CGRectMake(10, self.picView.bottom + b + 50, 357, c + 50);
        self.view.frame = CGRectMake(10, self.picView.bottom + b + 50 + c + 50 + 15, 375, 30);
        
        NSDictionary *dic1 = pictureModel.commontsArray[0];
        NSDictionary *dic2  = pictureModel.commontsArray[1];
        //view1
        self.comment_user_name.text = dic1[@"user_name"];
        [self.comment_avatar_url sd_setImageWithURL:[NSURL URLWithString:dic1[@"avatar_url"]]];
        [self.comment_digg_count setTitle:[NSString stringWithFormat:@"%@",dic1[@"digg_count"]] forState:UIControlStateNormal];
        CGRect frame1 = self.comment_text.frame;
        frame1.size.height = b;
        self.comment_text.frame = frame1;
        self.comment_text.text = dic1[@"text"];
        self.comment_text.numberOfLines = 0;
        
        //view2
        self.comment_user_name2.text = dic2[@"user_name"];
        [self.comment_avatar_url2 sd_setImageWithURL:[NSURL URLWithString:dic2[@"avatar_url"]]];
        [self.comment_digg_count2 setTitle:[NSString stringWithFormat:@"%@",dic2[@"digg_count"]] forState:UIControlStateNormal];
        CGRect frame2 = self.comment_text2.frame;
        frame2.size.height = c;
        self.comment_text2.frame = frame2;
        self.comment_text2.text = dic2[@"text"];
        self.comment_text2.numberOfLines = 0;
    }
}
+ (CGFloat)getGroupTextHeight:(NSString *)groupText{
    CGRect groupTextRect = [groupText boundingRectWithSize:CGSizeMake(357, 200) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]} context:nil];
    CGFloat a = groupTextRect.size.height;
    return a;
}
+ (CGFloat)CommentText1:(NSString *)commentText1{
    CGRect TextRect = [commentText1 boundingRectWithSize:CGSizeMake(357, 200) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]} context:nil];
    CGFloat b = TextRect.size.height;
    return b;
    
}
+ (CGFloat)CommentText2:(NSString *)commentText2{
    CGRect TextRect = [commentText2 boundingRectWithSize:CGSizeMake(357, 200) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]} context:nil];
    CGFloat c = TextRect.size.height;
    return c;
    
}

+ (CGFloat)getRowHeight:(PictureModel *)pictureModel{
    

    CGFloat a , b, c;
   
    NSInteger i = pictureModel.commontsArray.count;
    CGFloat picViewHight ;
   
    if ([pictureModel.category_id integerValue] == 10) {
        picViewHight = 200;
    }else{
        picViewHight = [pictureModel.r_height floatValue] / 2;
    }
    if (i == 0) {
        if ([pictureModel.group_text isKindOfClass:[NSNull class]]) {
            a = 0;
        }else{
        a = [self getGroupTextHeight:pictureModel.group_text];
        }
        return 150 + 15 + a + picViewHight;
       
    }else if (i == 1){
        if ([pictureModel.group_text isKindOfClass:[NSNull class]]) {
            a = 0;
        }else{
            a = [self getGroupTextHeight:pictureModel.group_text];
        }
        if ([pictureModel.commontsArray[0][@"text"] isKindOfClass:[NSNull class]]) {
            b = 0;
        }else{
           b = [self CommentText1:pictureModel.commontsArray[0][@"text"]];
        }
    
      
    return  150 + 15 + a + 50 + b + picViewHight;
    }else{
        if ([pictureModel.group_text isKindOfClass:[NSNull class]]) {
            a = 0;
        }else{
            a = [self getGroupTextHeight:pictureModel.group_text];
        }
        if ([pictureModel.commontsArray[0][@"text"] isKindOfClass:[NSNull class]]) {
            b = 0;
        }else{
            b = [self CommentText1:pictureModel.commontsArray[0][@"text"]];
        }
        if ([pictureModel.commontsArray[1][@"text"] isKindOfClass:[NSNull class]]) {
           c = 0;
        }else{
           c = [self CommentText2:pictureModel.commontsArray[1][@"text"]];
        }
        return 150 + 15 + a + 50 + b + 50 + c + picViewHight;
       
    }
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
