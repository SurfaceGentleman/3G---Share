//
//  VCSecond.m
//  share模仿
//
//  Created by 开朗的男子 on 2018/7/27.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "VCSecond.h"
#import "upload_image.h"
#import "SearchResult.h"

@interface VCSecond ()

@end

@implementation VCSecond

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UISearchBar * search = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 75, 410, 40)];
    search.showsBookmarkButton = YES;
    [search setSearchBarStyle:UISearchBarStyleMinimal];
    search.placeholder = @"搜索 用户名 作品分类 文章";
    search.delegate = self;
    //search.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:search];
    //添加按钮
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(10, 185, 90, 32);
    [btn1 setTitle:@"平面设计" forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    btn1.backgroundColor = [UIColor whiteColor];
    btn1.tintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [btn1 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    btn1.layer.cornerRadius = 4;
    [self.view addSubview:btn1];
    
    UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame = CGRectMake(110, 185, 90, 32);
    [btn2 setTitle:@"网页设计" forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    btn2.backgroundColor = [UIColor whiteColor];
    btn2.tintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [btn2 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    btn2.layer.cornerRadius = 4;
    [self.view addSubview:btn2];
    
    UIButton * btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn3.frame = CGRectMake(210, 185, 90, 32);
    [btn3 setTitle:@"UI/icon" forState:UIControlStateNormal];
    btn3.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    btn3.backgroundColor = [UIColor whiteColor];
    btn3.tintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [btn3 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    btn3.layer.cornerRadius = 4;
    [self.view addSubview:btn3];
    
    UIButton * btn4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn4.frame = CGRectMake(310, 185, 90, 32);
    [btn4 setTitle:@"插画/手绘" forState:UIControlStateNormal];
    btn4.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    btn4.backgroundColor = [UIColor whiteColor];
    btn4.tintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [btn4 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    btn4.layer.cornerRadius = 4;
    [self.view addSubview:btn4];
    
    UIButton * btn5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn5.frame = CGRectMake(10, 230, 90, 32);
    [btn5 setTitle:@"虚拟与设计" forState:UIControlStateNormal];
    btn5.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn5 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    btn5.backgroundColor = [UIColor whiteColor];
    btn5.tintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [btn5 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    btn5.layer.cornerRadius = 4;
    [self.view addSubview:btn5];
    
    UIButton * btn6 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn6.frame = CGRectMake(110, 230, 90, 32);
    [btn6 setTitle:@"影视" forState:UIControlStateNormal];
    btn6.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn6 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    btn6.backgroundColor = [UIColor whiteColor];
    btn6.tintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [btn6 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    btn6.layer.cornerRadius = 4;
    [self.view addSubview:btn6];
    
    UIButton * btn7 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn7.frame = CGRectMake(210, 230, 90, 32);
    [btn7 setTitle:@"摄影" forState:UIControlStateNormal];
    btn7.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn7 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    btn7.backgroundColor = [UIColor whiteColor];
    btn7.tintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [btn7 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    btn7.layer.cornerRadius = 4;
    [self.view addSubview:btn7];
    
    UIButton * btn8 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn8.frame = CGRectMake(310, 230, 90, 32);
    [btn8 setTitle:@"其他" forState:UIControlStateNormal];
    btn8.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn8 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    btn8.backgroundColor = [UIColor whiteColor];
    btn8.tintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [btn8 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    btn8.layer.cornerRadius = 4;
    [self.view addSubview:btn8];
    
    UIButton * btn9 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn9.frame = CGRectMake(10, 330, 90, 32);
    [btn9 setTitle:@"人气最高" forState:UIControlStateNormal];
    btn9.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn9 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn9 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    btn9.backgroundColor = [UIColor whiteColor];
    btn9.tintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [btn9 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    btn9.layer.cornerRadius = 4;
    [self.view addSubview:btn9];
    
    UIButton * btn10 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn10.frame = CGRectMake(110, 330, 90, 32);
    [btn10 setTitle:@"收藏最多" forState:UIControlStateNormal];
    btn10.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn10 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn10 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    btn10.backgroundColor = [UIColor whiteColor];
    btn10.tintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [btn10 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    btn10.layer.cornerRadius = 4;
    [self.view addSubview:btn10];
    
    UIButton * btn11 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn11.frame = CGRectMake(210, 330, 90, 32);
    [btn11 setTitle:@"评论最多" forState:UIControlStateNormal];
    btn11.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn11 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn11 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    btn11.backgroundColor = [UIColor whiteColor];
    btn11.tintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [btn11 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    btn11.layer.cornerRadius = 4;
    [self.view addSubview:btn11];
    
    UIButton * btn12 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn12.frame = CGRectMake(310, 330, 90, 32);
    [btn12 setTitle:@"编辑精选" forState:UIControlStateNormal];
    btn12.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn12 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn12 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    btn12.backgroundColor = [UIColor whiteColor];
    btn12.tintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [btn12 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    btn12.layer.cornerRadius = 4;
    [self.view addSubview:btn12];
    
    UIButton * btn13 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn13.frame = CGRectMake(10, 430, 90, 32);
    [btn13 setTitle:@"30分钟前" forState:UIControlStateNormal];
    btn13.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn13 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn13 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    btn13.backgroundColor = [UIColor whiteColor];
    btn13.tintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [btn13 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    btn13.layer.cornerRadius = 4;
    [self.view addSubview:btn13];
    
    UIButton * btn14 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn14.frame = CGRectMake(110, 430, 90, 32);
    [btn14 setTitle:@"1小时前" forState:UIControlStateNormal];
    btn14.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn14 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn14 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    btn14.backgroundColor = [UIColor whiteColor];
    btn14.tintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [btn14 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    btn14.layer.cornerRadius = 4;
    [self.view addSubview:btn14];
    
    UIButton * btn15 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn15.frame = CGRectMake(210, 430, 90, 32);
    [btn15 setTitle:@"1月前" forState:UIControlStateNormal];
    btn15.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn15 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn15 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    btn15.backgroundColor = [UIColor whiteColor];
    btn15.tintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [btn15 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    btn15.layer.cornerRadius = 4;
    [self.view addSubview:btn15];
    
    UIButton * btn16 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn16.frame = CGRectMake(310, 430, 90, 32);
    [btn16 setTitle:@"1年前" forState:UIControlStateNormal];
    btn16.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn16 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn16 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    btn16.backgroundColor = [UIColor whiteColor];
    btn16.tintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [btn16 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    btn16.layer.cornerRadius = 4;
    [self.view addSubview:btn16];
    
    //蓝色线的添加
    UIImageView * imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 170, 400, 2)];
    imageView1.image = [UIImage imageNamed:@"home_line"];
    [self.view addSubview:imageView1];
    
    UIImageView * imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 315, 400, 2)];
    imageView2.image = [UIImage imageNamed:@"home_line"];
    [self.view addSubview:imageView2];
    
    UIImageView * imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 417, 400, 2)];
    imageView3.image = [UIImage imageNamed:@"home_line"];
    [self.view addSubview:imageView3];
    
    UIImageView * imageView4 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 147, 75, 23)];
    imageView4.image = [UIImage imageNamed:@"fen_lei"];
    [self.view addSubview:imageView4];
    
    UIImageView * imageView5 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 292, 75, 23)];
    imageView5.image = [UIImage imageNamed:@"tui_jian"];
    [self.view addSubview:imageView5];
    
    UIImageView * imageView6 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 395, 75, 23)];
    imageView6.image = [UIImage imageNamed:@"shi_jian"];
    [self.view addSubview:imageView6];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(0, 0, 20, 20);
    [btn setImage:[UIImage imageNamed:@"s13"] forState:UIControlStateNormal];
    btn.tintColor = [UIColor whiteColor];
    [btn addTarget:self action:@selector(click)forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem  *barBut = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    self.navigationItem.rightBarButtonItem = barBut;
}

- (void)press:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if (btn.selected == YES) {
        btn.backgroundColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    }
    else {
        btn.backgroundColor = [UIColor whiteColor];
    }
}

- (void)click
{
    upload_image * aa = [upload_image new];
    [super.navigationController pushViewController:aa animated:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    SearchResult * a = [SearchResult new];
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(click:)];
    a.navigationItem.leftBarButtonItem = item;
    a.navigationItem.backBarButtonItem = item;
    a.navigationItem.backBarButtonItem.tintColor = [UIColor whiteColor];
    a.title = @"搜索结果";
    a.view.backgroundColor = [UIColor whiteColor];
    if([searchBar.text isEqualToString:@"大白"] == YES){
        [self.navigationController pushViewController:a animated:YES];
    }
}

- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{
    SearchResult * a = [SearchResult new];
    a.title = @"搜索结果";
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(click:)];
    a.navigationItem.leftBarButtonItem = item;
    a.navigationItem.backBarButtonItem = item;
    a.navigationItem.backBarButtonItem.tintColor = [UIColor whiteColor];
    a.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:a animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)click:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
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
