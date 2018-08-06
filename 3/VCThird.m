//
//  VCThird.m
//  share模仿
//
//  Created by 开朗的男子 on 2018/7/27.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "VCThird.h"

@interface VCThird ()

@end

@implementation VCThird

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _scrollView.bounces = NO;
    _scrollView.alwaysBounceHorizontal = NO;
    _scrollView.alwaysBounceVertical = NO;
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 105, self.view.frame.size.width, self.view.frame.size.height)];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3, self.view.frame.size.height);
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.scrollEnabled = YES;
    //[_scrollView setAlwaysBounceHorizontal:NO];
    _scrollView.bounces = NO;
    _scrollView.bouncesZoom = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [_scrollView setContentOffset:CGPointMake(self.view.frame.size.width * 2, 0) animated:YES];
    [self.view addSubview:_scrollView];
    _tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    _tableView1.delegate = self;
    _tableView1.dataSource = self;
    _tableView1.tag = 101;    //  1
    [self.scrollView addSubview:_tableView1];
    _tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 10, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    _tableView2.delegate = self;
    _tableView2.dataSource = self;
    _tableView2.tag = 102;
    [self.scrollView addSubview:_tableView2];
    _tableView3 = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 2, 10, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    _tableView3.delegate = self;
    _tableView3.dataSource = self;
    _tableView3.tag = 103;
    [self.scrollView addSubview:_tableView3];
    
    //UIView的添加
    UIView * b_g = [UIView new];
    b_g.backgroundColor = [UIColor colorWithRed:0.35 green:0.36 blue:0.36 alpha:1.00];
    b_g.frame = CGRectMake(0, 60, self.view.frame.size.width, 50);
    [self.view addSubview:b_g];
    
    //分栏线的添加
    UIView * line1 = [UIView new];
    line1.backgroundColor = [UIColor whiteColor];
    line1.frame = CGRectMake(140, 12, 2, 30);
    [b_g addSubview:line1];
    UIView * line2 = [UIView new];
    line2.backgroundColor = [UIColor whiteColor];
    line2.frame = CGRectMake(275, 12, 2, 30);
    [b_g addSubview:line2];
    
    //button的添加
    _btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_btn1 setTitleColor:[UIColor colorWithRed:0.59 green:0.59 blue:0.60 alpha:1.00] forState: UIControlStateSelected];
    [_btn1 setTitle:@"精选文章" forState:UIControlStateNormal];
    _btn1.titleLabel.font = [UIFont systemFontOfSize:18];
    _btn1.frame = CGRectMake(-25, 17, 200, 20);
    [_btn1 setTintColor:[UIColor colorWithRed:0.35 green:0.36 blue:0.36 alpha:1.00]];
    [_btn1 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    _btn1.tag = 201;
    [b_g addSubview:_btn1];
    _btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_btn2 setTitleColor:[UIColor colorWithRed:0.59 green:0.59 blue:0.60 alpha:1.00] forState: UIControlStateSelected];
    [_btn2 setTitle:@"热门推荐" forState:UIControlStateNormal];
    _btn2.titleLabel.font = [UIFont systemFontOfSize:18];
    _btn2.frame = CGRectMake(105, 17, 200, 20);
    [_btn2 setTintColor:[UIColor colorWithRed:0.35 green:0.36 blue:0.36 alpha:1.00]];
    [_btn2 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    _btn2.tag = 202;
    [b_g addSubview:_btn2];
    _btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_btn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_btn3 setTitleColor:[UIColor colorWithRed:0.59 green:0.59 blue:0.60 alpha:1.00] forState: UIControlStateSelected];
    [_btn3 setTitle:@"全部文章" forState:UIControlStateNormal];
    _btn3.titleLabel.font = [UIFont systemFontOfSize:18];
    _btn3.frame = CGRectMake(245, 17, 200, 20);
    [_btn3 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [_btn3 setTintColor:[UIColor colorWithRed:0.35 green:0.36 blue:0.36 alpha:1.00]];
    _btn3.selected = YES;
    _btn3.tag = 203;
    [b_g addSubview:_btn3];
    
    [self creatData];
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return 8;
}


- (void)creatData
{
    _t = [NSArray arrayWithObjects:@"关于设计反馈的5件事", @"脸书VS人人", @"字体故事", @"板式整理术:高效解决多风格要求", nil];
    _names = [NSArray arrayWithObjects:@"share小白", @"share小王", @"share小吕", @"share小王", nil];
    _detail = [NSArray arrayWithObjects:@"设计文章-原创-理论", @"设计文章-原创-Web/Flash", @"设计文章-经验-设计观点", @"设计文章-经验-案例分析", nil];
    _times = [NSArray arrayWithObjects:@"16分钟前", @"17分钟前", @"45分钟前", @"4小时前", nil];
    _imag = [NSArray arrayWithObjects:@"note_img1", @"note_img2", @"note_img3", @"note_img4", nil];
    
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

- (void)press:(UIButton *)btn
{
    if (btn.tag == 201) {
        [_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    else if (btn.tag == 202) {
        [_scrollView setContentOffset:CGPointMake(self.view.frame.size.width, 0) animated:YES];
    }
    else{
        [_scrollView setContentOffset:CGPointMake(self.view.frame.size.width * 2, 0) animated:YES];
    }
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
        UIButton* btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn3.frame = CGRectMake(330, 105, 50, 20);
        [btn3 setTitle:@"102" forState:UIControlStateNormal];
        [btn3 setTitleColor:[UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00] forState:UIControlStateNormal];
        [btn3 setImage:[UIImage imageNamed:@"button_share"] forState:UIControlStateNormal];
        [cell.contentView addSubview:btn3];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x == 0) {
        _btn1.selected = YES;
        _btn2.selected = NO;
        _btn3.selected = NO;
    }
    else if (scrollView.contentOffset.x == self.view.frame.size.width) {
        _btn2.selected = YES;
        _btn1.selected = NO;
        _btn3.selected = NO;
    }
    else {
        _btn3.selected = YES;
        _btn1.selected = NO;
        _btn2.selected = NO;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    //[_tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

@end

