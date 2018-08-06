//
//  VCFirst.m
//  share模仿
//
//  Created by 开朗的男子 on 2018/7/27.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "VCFirst.h"
#import "small_white.h"
#import "LunBo.h"

#define kImageCount 4

@interface VCFirst ()
<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation VCFirst

- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        
        //要显示的大小
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 53, self.view.frame.size.width, 220)];
        
        //背景色
        _scrollView.backgroundColor = [UIColor whiteColor];
        
        [self.view addSubview:_scrollView];
        
        // 取消弹簧效果
        _scrollView.bounces = NO;
        
        // 取消水平滚动条
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        
        // 要分页
        _scrollView.pagingEnabled = YES;
        
        // 滚动的总大小contentSize
        _scrollView.contentSize = CGSizeMake(kImageCount * _scrollView.bounds.size.width, 0);
        
        // 设置代理
        _scrollView.delegate = self;
        
    }
    return _scrollView;
}

- (UIPageControl *)pageControl
{
    if (_pageControl == nil) {
        
        // 分页控件，本质上和scrollView没有任何关系，是两个独立的控件
        _pageControl = [[UIPageControl alloc] init];
        
        // 总页数
        _pageControl.numberOfPages = kImageCount;
        
        // 控件尺寸
        CGSize size = [_pageControl sizeForNumberOfPages:kImageCount];
        
        _pageControl.bounds = CGRectMake(0, 10, size.width, size.height);
        
        _pageControl.center = CGPointMake(self.view.center.x, 215);
        
        // 设置颜色
        // 1>. 默认颜色
        _pageControl.pageIndicatorTintColor = [UIColor redColor];
        // 2>. 当前页颜色
        _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
        
        [self.view addSubview:_pageControl];
        
        // 添加监听方法
        [_pageControl addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _pageControl;
}

// 分页控件的监听方法
- (void)pageChanged:(UIPageControl *)page
{
    //输出当前页号
    //NSLog(@"%ld", (long)page.currentPage);
    
    // 根据页数，调整滚动视图中的图片位置 contentOffset
    // 当前页的x值
    CGFloat x = page.currentPage * self.scrollView.bounds.size.width;
    
    // 当前页的偏移(坐标)
    [self.scrollView setContentOffset:CGPointMake(x, 0) animated:YES];
}

// 视图加载完成调用，通常用来设置数据
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 把五张图片添加到scrollView
    for (int i = 0; i < kImageCount; i++) {
        
        //1. 提取图片的名字
        NSString *imageName = [NSString stringWithFormat:@"main_img%d", i + 1];
        
        //2. 创建图片对象
        UIImage *image = [UIImage imageNamed:imageName];
        
        //3. 创建imageView对象
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.scrollView.bounds];
        
        //4. 图片对象给imageView对象的图片
        imageView.image = image;
        
        //5. 给scrollView加上imageView
        [self.scrollView addSubview:imageView];
    }
    
    // 计算imageView的位置
    [self.scrollView.subviews enumerateObjectsUsingBlock:^(UIImageView *imageView, NSUInteger idx, BOOL *stop) {
        
        // 调整x => origin => frame
        CGRect frame = imageView.frame;
        frame.origin.x = idx * frame.size.width;
        
        imageView.frame = frame;
    }];
    
    // 分页初始页数为0
    self.pageControl.currentPage = 0;
    
    // 启动时钟
    [self startTimer];
    
    [self creatData];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [self.view addSubview:_scrollView];
}

- (void)startTimer
{
    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    
    // 添加到运行循环
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)updateTimer
{
    // 页号发生变化
    // (当前的页数 + 1) % 总页数
    int page = (self.pageControl.currentPage + 1) % kImageCount;
    
    self.pageControl.currentPage = page;
    
    //NSLog(@"%ld", (long)self.pageControl.currentPage);
    
    // 调用监听方法，让滚动视图滚动
    [self pageChanged:self.pageControl];
}

#pragma mark - ScrollView的代理方法

// 滚动视图停下来，修改页面控件的小点（页数）
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 停下来的当前页数
    //NSLog(@"%@", NSStringFromCGPoint(scrollView.contentOffset));
    
    // 计算页数
    int page = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    self.pageControl.currentPage = page;
}

/**
 修改时钟所在的运行循环的模式后，抓不住图片
 
 解决方法：抓住图片时，停止时钟，松手后，开启时钟
 */

//抓住图片时触发
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //NSLog(@"%s", __func__);
    // 停止时钟，停止之后就不能再使用，如果要启用时钟，需要重新实例化
    [self.timer invalidate];
}

//松手时触发
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ID"];
        //添加Label
        UILabel * name = [[UILabel alloc] initWithFrame:CGRectMake(210, 35, 200, 25)];
        name.text = _names[indexPath.section];
        name.font = [UIFont systemFontOfSize:15];
        UILabel * detail = [[UILabel alloc] initWithFrame:CGRectMake(210, 55, 200, 25)];
        detail.text = _detail[indexPath.section];
        detail.font = [UIFont systemFontOfSize:11];
        UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(210, 15, 200, 25)];
        title.font = [UIFont systemFontOfSize:20];
        title.text = _t[indexPath.section];
        UILabel * time = [[UILabel alloc] initWithFrame:CGRectMake(210, 75, 200, 25)];
        time.text = _times[indexPath.section];
        time.font = [UIFont systemFontOfSize:11];
        [cell.contentView addSubview:name];
        [cell.contentView addSubview:detail];
        [cell.contentView addSubview:time];
        [cell.contentView addSubview:title];
        //添加image
        UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_imag[indexPath.section]]];
        imageView.frame = CGRectMake(10, 0, 180, 140);
        [cell.contentView addSubview:imageView];
        //添加按钮
        UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn1.frame = CGRectMake(210, 105, 50, 20);
        [btn1 setTitle:@"102" forState:UIControlStateNormal];
        [btn1 setTitleColor:[UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00] forState:UIControlStateNormal];
        [btn1 setImage:[UIImage imageNamed:@"5-2"] forState:UIControlStateNormal];
        [cell.contentView addSubview:btn1];
        UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn2.frame = CGRectMake(270, 105, 50, 20);
        [btn2 setTitle:@"26" forState:UIControlStateNormal];
        [btn2 setTitleColor:[UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00] forState:UIControlStateNormal];
        [btn2 setImage:[UIImage imageNamed:@"button_guanzhu"] forState:UIControlStateNormal];
        [cell.contentView addSubview:btn2];
        UIButton * btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn3.frame = CGRectMake(330, 105, 50, 20);
        [btn3 setTitle:@"102" forState:UIControlStateNormal];
        [btn3 setTitleColor:[UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00] forState:UIControlStateNormal];
        [btn3 setImage:[UIImage imageNamed:@"button_share"] forState:UIControlStateNormal];
        [cell.contentView addSubview:btn3];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)creatData
{
    _t = [NSArray arrayWithObjects:@"假日", @"国外画册欣赏", @"collection扁平设计", @"板式整理术:高效解决多风格要求", nil];
    _names = [NSArray arrayWithObjects:@"share小白", @"share小王", @"share小吕", @"share小王", nil];
    _detail = [NSArray arrayWithObjects:@"原创-插画-联系习作", @"平面设计-画册设计", @"平面设计-海报设计", @"平面设计-风格设计", nil];
    _times = [NSArray arrayWithObjects:@"15分钟前", @"16分钟前", @"17分钟前", @"17分钟前", nil];
    _imag = [NSArray arrayWithObjects:@"list_img1", @"list_img2", @"list_img3", @"list_img4", nil];
    
}



- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0){
        return 220;
    }
    return 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0) {
        self.hidesBottomBarWhenPushed = YES;
        small_white * share = [small_white new];
        UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(click:)];
        share.navigationItem.leftBarButtonItem = item;
        share.navigationItem.backBarButtonItem = item;
        share.navigationItem.backBarButtonItem.tintColor = [UIColor whiteColor];
        [self.navigationController pushViewController:share animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
}

- (void)click:(UINavigationController *) a
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
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
