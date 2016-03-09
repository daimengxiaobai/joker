//
//  DetailViewController.m
//  joker
//
//  Created by scjy on 16/3/9.
//  Copyright © 2016年 肖楠. All rights reserved.
//

#import "DetailViewController.h"
#import <AFNetworking/AFHTTPSessionManager.h>
#import "DetailModel.h"
#import "PullingRefreshTableView.h"
#import "ProgressHUD.h"
#import "DetailHeaderView.h"
#import "DetailTableViewCell.h"

@interface DetailViewController ()<UITableViewDataSource, UITableViewDelegate, PullingRefreshTableViewDelegate>

{
    NSInteger _pageCount;
}

@property (nonatomic, retain) PullingRefreshTableView *tableView;
@property (nonatomic, assign) BOOL refreshing;

@property (nonatomic, retain) NSMutableArray *allCommentArray;
@property (nonatomic, retain) NSMutableArray *topCommentArray;
@property (nonatomic, retain) NSMutableArray *recentCommentArray;
@end

@implementation DetailViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"Detail";
    [self.view addSubview:self.tableView];
    _pageCount = 1;
    [self request];
}
#pragma mark -----------------UITableViewDatasouce
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.allCommentArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        NSArray *array1 = self.allCommentArray[1];
        return array1.count;
    }else{
        NSArray *array0 = self.allCommentArray[0];
        return array0.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     DetailTableViewCell *detailCell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSArray *array = self.allCommentArray[indexPath.section];
    detailCell.detailModel = array[indexPath.row];
    return detailCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *array = self.allCommentArray[indexPath.section];
    DetailTableViewCell *detailCell = [[DetailTableViewCell alloc] init];
    detailCell.detailModel = array[indexPath.row];

   return  [DetailTableViewCell getRowHeight:detailCell.detailModel];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (void)request{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager GET:[NSString stringWithFormat:kcomment, self.picModel.group_id, self.picModel.group_id] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
       
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        XNLog(@"%@", responseObject);
        NSDictionary *dic = responseObject;
        NSDictionary *dataDict = dic[@"data"];
        NSArray *recentArray = dataDict[@"recent_comments"];
        NSArray *topArray = dataDict[@"top_comments"];
        //最新评论
        for (NSDictionary *dict in recentArray) {
            DetailModel *detailModel = [[DetailModel alloc] initWithDictionary:dict];
            [self.recentCommentArray addObject:detailModel];
        }
        [self.allCommentArray addObject:self.recentCommentArray];
        //热门评论
        for (NSDictionary *dict in topArray) {
            DetailModel *detailModel = [[DetailModel alloc] initWithDictionary:dict];
            [self.topCommentArray addObject:detailModel];
        }
        [self.allCommentArray addObject:self.topCommentArray];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        XNLog(@"%@", error);
    }];
}

- (PullingRefreshTableView *)tableView{
    if (!_tableView) {
        self.tableView = [[PullingRefreshTableView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 104) pullingDelegate:self];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
    }
    return _tableView;
}

- (NSMutableArray *)allCommentArray{
    if (!_allCommentArray) {
        self.allCommentArray = [NSMutableArray new];
    }
    return _allCommentArray;
}
- (NSMutableArray *)topCommentArray{
    if (!_topCommentArray) {
        self.topCommentArray = [NSMutableArray new];
    }
    return _topCommentArray;
}
- (NSMutableArray *)recentCommentArray{
    if (!_recentCommentArray) {
        self.recentCommentArray = [NSMutableArray new];
    }
    return _recentCommentArray;
}

@end
