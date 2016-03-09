//
//  DetailTableViewCell.h
//  joker
//
//  Created by scjy on 16/3/9.
//  Copyright © 2016年 肖楠. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailModel.h"

@interface DetailTableViewCell : UITableViewCell
@property(nonatomic, retain) DetailModel *detailModel;


+ (CGFloat)getRowHeight:(DetailModel *)detailModel;
@end
