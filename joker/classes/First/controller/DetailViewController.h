//
//  DetailViewController.h
//  joker
//
//  Created by scjy on 16/3/9.
//  Copyright © 2016年 肖楠. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PictureModel.h"
#import "PictureTableViewCell.h"
#import "DetailModel.h"

@interface DetailViewController : UIViewController
@property(nonatomic, retain) PictureModel *picModel;
@property(nonatomic, retain) DetailModel *detailModel;
@property(nonatomic, retain) PictureTableViewCell *picCell;
@end
