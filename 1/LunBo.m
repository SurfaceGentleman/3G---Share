//
//  LunBo.m
//  share模仿
//
//  Created by 开朗的男子 on 2018/7/30.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "LunBo.h"
#import "small_white.h"

#define kImageCount 4

@interface LunBo ()
<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) NSTimer *timer;
@end

@implementation LunBo

- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        
        //要显示的大小
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 230)];
        
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
    NSLog(@"%ld", (long)page.currentPage);
    
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

@end
