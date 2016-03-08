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


- (void)setPictureModel:(PictureModel *)pictureModel{
    [self.comment_count setTitle:[NSString stringWithFormat:@"%@",pictureModel.comment_count] forState:UIControlStateNormal];
    [self.category_name setTitle:[NSString stringWithFormat:@"%@",pictureModel.category_name] forState:UIControlStateNormal];
    [self.digg_count setTitle:[NSString stringWithFormat:@"%@",pictureModel.digg_count] forState:UIControlStateNormal];
    [self.bury_count setTitle:[NSString stringWithFormat:@"%@",pictureModel.bury_count] forState:UIControlStateNormal];
    self.group_text.text = pictureModel.group_text;
    self.group_text.numberOfLines = 0;
        [self.share_count setTitle:[NSString stringWithFormat:@"%@",pictureModel.share_count] forState:UIControlStateNormal];
    [self.avatar_url sd_setImageWithURL:[NSURL URLWithString:pictureModel.avatar_url]];
    self.group_name.text = pictureModel.group_name;
   // NSInteger categoryId = [pictureModel.category_id integerValue];
    /*
     [爆笑GIF 10]  [脑残对话 15][奇葩新闻 77][奇葩卖家的二三事 81][搞笑囧图 2][][][][]
    [来自世界的恶意 80]
     */
//    self.largeView = [[UIImageView alloc] init];
//    self.smileView = [[UIImageView alloc] init];
//    self.mainView.frame = CGRectMake(15, 116, [pictureModel.r_width floatValue] / 2 + 20, [pictureModel.r_height floatValue] / 2);
//    self.largeView.frame = CGRectMake(0, 0, [pictureModel.r_width floatValue] / 2 + 20, [pictureModel.r_height floatValue] / 2);
//    
//    [self.largeView sd_setImageWithURL:[NSURL URLWithString:pictureModel.url]];
//    
//    [self.mainView addSubview:self.largeView];
    self.picView.frame = CGRectMake(15, 116, [pictureModel.r_width floatValue] / 2 + 20, [pictureModel.r_height floatValue] / 2);
    [self.picView sd_setImageWithURL:[NSURL URLWithString:pictureModel.url]];
    self.picView.backgroundColor = [UIColor magentaColor];
    self.view1.frame = CGRectMake(10, self.picView.bottom, 357, 80);
    self.view2.frame = CGRectMake(10, self.picView.bottom + 80, 357, 80);
    self.view.frame = CGRectMake(10, self.picView.bottom + 160, 375, 30);
/*
    if (pictureModel.number == 1) {
    self.mainView.frame = CGRectMake(15, 116, [pictureModel.r_width floatValue] / 2 + 20, [pictureModel.r_height floatValue] / 2);
    self.largeView.frame = CGRectMake(0, 0, [pictureModel.r_width floatValue] / 2 + 20, [pictureModel.r_height floatValue] / 2);
    
    [self.largeView sd_setImageWithURL:[NSURL URLWithString:pictureModel.url]];
    
    [self.mainView addSubview:self.largeView];
    }else{
        for (int i = 0; i < pictureModel.number; i++) {
            int j = i % 3;
            int k = i / 3;
            self.smileView.frame = CGRectMake(kScreenWidth / 3 * j, kScreenWidth / 3 * k, kScreenWidth / 3 - 3, kScreenWidth / 3 - 3 );
           [self.smileView sd_setImageWithURL:[NSURL URLWithString:pictureModel.url]];
            [self.mainView addSubview:self.smileView];
        }

    }
*/
    NSInteger count ;
    count = pictureModel.commontsArray.count;
    if (count == 0) {
        self.view1.hidden = YES;
        self.view2.hidden = YES;
    }else if (count == 1){
        self.view2.hidden = YES;
        self.view1.hidden = NO;
        self.comment_user_name = pictureModel.commontsArray[0][@"user_name"];
        [self.comment_avatar_url sd_setImageWithURL:[NSURL URLWithString:pictureModel.commontsArray[0][@"avatar_url"]]];
        [self.comment_digg_count setTitle:[NSString stringWithFormat:@"%@",pictureModel.commontsArray[0][@"digg_count"]] forState:UIControlStateNormal];
        self.comment_text.text = pictureModel.commontsArray[0][@"text"];
        self.comment_text.numberOfLines = 0;
        
    }else if (count == 2){
        self.view1.hidden = NO;
        self.view2.hidden = NO;
        //view1
        self.comment_user_name.text = pictureModel.commontsArray[0][@"user_name"];
        [self.comment_avatar_url sd_setImageWithURL:[NSURL URLWithString:pictureModel.commontsArray[0][@"avatar_url"]]];
        [self.comment_digg_count setTitle:[NSString stringWithFormat:@"%@",pictureModel.commontsArray[0][@"digg_count"]] forState:UIControlStateNormal];
        self.comment_text.text = pictureModel.commontsArray[0][@"text"];
        self.comment_text.numberOfLines = 0;
        
        //view2
        self.comment_user_name2.text = pictureModel.commontsArray[1][@"user_name"];
        [self.comment_avatar_url2 sd_setImageWithURL:[NSURL URLWithString:pictureModel.commontsArray[1][@"avatar_url"]]];
        [self.comment_digg_count2 setTitle:[NSString stringWithFormat:@"%@",pictureModel.commontsArray[1][@"digg_count"]] forState:UIControlStateNormal];
        self.comment_text2.text = pictureModel.commontsArray[1][@"text"];
        self.comment_text2.numberOfLines = 0;
    }
}
+ (CGFloat)getRowHeight:(PictureModel *)picture{
    return  340 + [picture.r_height floatValue] / 2;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
