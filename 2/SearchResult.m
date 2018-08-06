//
//  SearchResult.m
//  share模仿
//
//  Created by 开朗的男子 on 2018/8/3.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "SearchResult.h"

@interface SearchResult ()

@end

@implementation SearchResult

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatData];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
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
    _t = [NSArray arrayWithObjects:@"Icon of Baymax", @"每个人都需要大白", @"collection扁平设计", @"板式整理术:高效解决多风格要求", nil];
    _names = [NSArray arrayWithObjects:@"share小白", @"share小王", @"share小吕", @"share小王", nil];
    _detail = [NSArray arrayWithObjects:@"原创-UI-icon", @"原创作品-摄影", @"平面设计-海报设计", @"平面设计-风格设计", nil];
    _times = [NSArray arrayWithObjects:@"15分钟前", @"16分钟前", @"17分钟前", @"17分钟前", nil];
    _imag = [NSArray arrayWithObjects:@"search1", @"search2", @"list_img3", @"list_img4", nil];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
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
    return 5;
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
