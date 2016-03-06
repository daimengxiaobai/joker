//
//  PictureTableViewCell.h
//  joker
//
//  Created by scjy on 16/3/5.
//  Copyright © 2016年 肖楠. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PictureModel.h"
#import "PicCommentModel.h"

@interface PictureTableViewCell : UITableViewCell
@property(nonatomic, retain) PictureModel *pictureModel;
@property(nonatomic, retain) PicCommentModel *picCommentModel1;
@property(nonatomic, retain) PicCommentModel *picCommentModel2;
@end
