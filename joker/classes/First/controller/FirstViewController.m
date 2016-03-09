//
//  FirstViewController.m
//  joker
//
//  Created by scjy on 16/3/3.
//  Copyright © 2016年 肖楠. All rights reserved.
//

#import "FirstViewController.h"
#import "PullingRefreshTableView.h"
#import <AFNetworking/AFHTTPSessionManager.h>
#import "VOSegmentedControl.h"
#import "ProgressHUD.h"
#import "PictureTableViewCell.h"
#import "PictureModel.h"
#import "DetailViewController.h"


@interface FirstViewController ()<UITableViewDataSource, UITableViewDelegate, PullingRefreshTableViewDelegate>
{
    NSInteger _index;
    NSInteger _pageCount;
}
@property(nonatomic, retain)PullingRefreshTableView *tableView;
@property(nonatomic, retain)VOSegmentedControl *segmentControl;
@property(nonatomic, assign) BOOL refreshing;
@property(nonatomic, retain)NSMutableArray *pictureArray;
@property(nonatomic, retain)NSMutableArray *recommendArray;
@property(nonatomic, retain)NSMutableArray *videoArray;
@property(nonatomic, retain)NSMutableArray *jokeArray;
@property(nonatomic, retain)NSMutableArray *bestArray;
@property(nonatomic, retain)NSMutableArray *sameCityArray;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBarController.tabBar.hidden = NO;
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.segmentControl];
    _pageCount = 1;
    [self.tableView registerNib:[UINib nibWithNibName:@"PictureTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    

   [self chooseRequest];
}
#pragma mark -----------------UITableViewDatasouce

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.pictureArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PictureTableViewCell *pictureCell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    pictureCell.pictureModel = self.pictureArray[indexPath.row];

    return pictureCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    detailVC.picModel = self.pictureArray[indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
   PictureModel *pictureModel = self.pictureArray[indexPath.row];
     return [PictureTableViewCell getRowHeight:pictureModel];
}
#pragma mark -----------------PullingRefreshTableViewDelegate

//tableView下拉刷新开始的时候使用
- (void)pullingTableViewDidStartRefreshing:(PullingRefreshTableView *)tableView{
    _pageCount = 1;
    self.refreshing = YES;
    [self performSelector:@selector(chooseRequest) withObject:nil afterDelay:1.f];
}

//tableView上拉加载开始的时候使用
- (void)pullingTableViewDidStartLoading:(PullingRefreshTableView *)tableView{
    _pageCount += 1;
    self.refreshing = NO;
    [self performSelector:@selector(chooseRequest) withObject:nil afterDelay:1.f];
}
//手指开始拖动方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.tableView tableViewDidScroll:scrollView];
}
//手指结束拖动方法
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self.tableView tableViewDidEndDragging:scrollView];
}
- (void)segmentCtrlValuechange{
     _index = self.segmentControl.selectedSegmentIndex + 1;
    [self chooseRequest];
   
    
}
- (void)chooseRequest{
    switch (_index) {
            
        case 1:
            
            [self requestRecommend1];
            
            break;
            
        case 2:
            
            [self requestViedo2];
            
            break;
            
        case 3:
            
            [self requestPicture3];
            
            break;
            
        case 4:
            
            [self requestJoke4];
            
            break;
            
        case 5:
            
            [self requestBest5];
            
            break;
            
        case 6:
            
            [self requestSameCity6];
            
            break;    
            
        default:
            
            break;
            
    }

}
- (void)requestRecommend1{
    XNLog(@"1");
}
- (void)requestViedo2{
    XNLog(@"2");
}
- (void)requestPicture3{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
    [manager GET:kPicture parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //XNLog(@"%@", responseObject);
        NSDictionary *dic = responseObject;
        NSArray *array = dic[@"data"][@"data"];
        if (self.refreshing) {
            if (self.pictureArray.count > 0) {
                [self.pictureArray removeAllObjects];
            }
        }

        for (NSDictionary *dict in array) {
            PictureModel *pictureModel = [[PictureModel alloc] initWithDictionary:dict];
           
            [self.pictureArray addObject:pictureModel];
       }
        
        
       //下边两句是把下拉刷新的头视图(下拉刷新)收起来
        
        [self.tableView tableViewDidFinishedLoading];
        self.tableView.reachedTheEnd = NO;
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [ProgressHUD show:[NSString stringWithFormat:@"%@", error]];
    }];

}
- (void)requestJoke4{
    
}
- (void)requestBest5{
    
}
- (void)requestSameCity6{
    
}
//刷新完成时间
- (NSDate *)pullingTableViewRefreshingFinishedDate{
    return [HWTools getSystemNowDate];
}


- (PullingRefreshTableView *)tableView{
    if (!_tableView) {
        self.tableView = [[PullingRefreshTableView alloc] initWithFrame:CGRectMake(0, 40 + 64, kScreenWidth, kScreenHeight - 144) pullingDelegate:self];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
    }
    return _tableView;
}
- (VOSegmentedControl *)segmentControl{
    if (_segmentControl == nil) {
        self.segmentControl = [[VOSegmentedControl alloc]initWithSegments:@[@{VOSegmentText:@"推荐"}, @{VOSegmentText:@"视频"}, @{VOSegmentText:@"图片"}, @{VOSegmentText:@"段子"}, @{VOSegmentText:@"精华"}, @{VOSegmentText:@"同城"}]];
    self.segmentControl.contentStyle = VOContentStyleTextAlone;
    self.segmentControl.indicatorStyle = VOSegCtrlIndicatorStyleBottomLine;
    self.segmentControl.backgroundColor = [UIColor whiteColor];
    self.segmentControl.selectedSegmentIndex = 2;
    _index = self.segmentControl.selectedSegmentIndex + 1;
    self.segmentControl.selectedTextColor = [UIColor redColor];
    self.segmentControl.allowNoSelection = YES;
    self.segmentControl.frame = CGRectMake(0, 64, kScreenWidth, 40);
    //滑条厚度
    self.segmentControl.indicatorThickness = 6;
    
    [self.segmentControl addTarget:self action:@selector(segmentCtrlValuechange) forControlEvents:UIControlEventValueChanged];
        
    }
   return _segmentControl;
}
- (NSMutableArray *)recommendArray{
    if (!_recommendArray) {
        self.recommendArray = [NSMutableArray new];
    }
    return _recommendArray;
}
- (NSMutableArray *)videoArray{
    if (!_videoArray) {
        self.videoArray = [NSMutableArray new];
    }
    return _videoArray;
}
- (NSMutableArray *)pictureArray{
    if (_pictureArray == nil) {
        self.pictureArray = [NSMutableArray new];
    }
    return _pictureArray;
}
- (NSMutableArray *)jokeArray{
    if (!_jokeArray) {
        self.jokeArray = [NSMutableArray new];
    }
    return _jokeArray;
}
- (NSMutableArray *)sameCityArray{
    if (!_sameCityArray) {
        self.sameCityArray = [NSMutableArray new];
    }
    return _sameCityArray;
}
- (NSMutableArray *)bestArray{
    if (!_bestArray) {
        self.bestArray = [NSMutableArray new];
    }
    return _bestArray;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
