//
//  PictureTableViewCell.h
//  joker
//
//  Created by scjy on 16/3/5.
//  Copyright © 2016年 肖楠. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PictureModel.h"


@interface PictureTableViewCell : UITableViewCell
@property(nonatomic, retain) PictureModel *pictureModel;
@property(nonatomic, assign) CGFloat rowHight;
+ (CGFloat)getRowHeight:(PictureModel *)picture;
@end
