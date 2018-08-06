//
//  small_white.m
//  share模仿
//
//  Created by 开朗的男子 on 2018/7/30.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "small_white.h"

@interface small_white ()

@end

@implementation small_white

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell1 = [tableView dequeueReusableCellWithIdentifier:@"ID1"];
    UITableViewCell * cell2 = [tableView dequeueReusableCellWithIdentifier:@"ID2"];
    if (indexPath.section == 0) {
        if(cell1 == nil){
            cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ID1"];
            UILabel * time = [[UILabel alloc] initWithFrame:CGRectMake(340, 15, 100, 20)];
            time.font = [UIFont systemFontOfSize:12];
            time.text = @"15分钟前";
            [cell1.contentView addSubview:time];
            //添加按钮
            UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            btn1.frame = CGRectMake(230, 50, 50, 20);
            [btn1 setTitle:@"102" forState:UIControlStateNormal];
            [btn1 setTitleColor:[UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00] forState:UIControlStateNormal];
            [btn1 setImage:[UIImage imageNamed:@"5-2"] forState:UIControlStateNormal];
            [cell1.contentView addSubview:btn1];
            UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            btn2.frame = CGRectMake(290, 50, 50, 20);
            [btn2 setTitle:@"26" forState:UIControlStateNormal];
            [btn2 setTitleColor:[UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00] forState:UIControlStateNormal];
            [btn2 setImage:[UIImage imageNamed:@"button_guanzhu"] forState:UIControlStateNormal];
            [cell1.contentView addSubview:btn2];
            UIButton * btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            btn3.frame = CGRectMake(350, 50, 50, 20);
            [btn3 setTitle:@"102" forState:UIControlStateNormal];
            [btn3 setTitleColor:[UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00] forState:UIControlStateNormal];
            [btn3 setImage:[UIImage imageNamed:@"button_share"] forState:UIControlStateNormal];
            [cell1.contentView addSubview:btn3];
        }
        cell1.textLabel.text = @"假日";
        cell1.textLabel.font = [UIFont systemFontOfSize:23];
        cell1.detailTextLabel.text = @"share小白";
        cell1.detailTextLabel.font = [UIFont systemFontOfSize:17];
        cell1.imageView.image = [UIImage imageNamed:@"works_head"];
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell1;
    }
    else {
        if(cell2 == nil){
            cell2 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID2"];
            //添加Label
            UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 300, 25)];
            label.text = @"多希望列车能把我带到有你的城市";
            label.font = [UIFont systemFontOfSize:14];
            [cell2.contentView addSubview:label];
            //添加图片
            UIImageView * image01 = [UIImageView new];
            image01.frame = CGRectMake(10, 45, 395, 230);
            image01.image = [UIImage imageNamed:@"works_img1"];
            [cell2.contentView addSubview:image01];
            UIImageView * image02 = [UIImageView new];
            image02.frame = CGRectMake(10, 280, 395, 230);
            image02.image = [UIImage imageNamed:@"works_img2"];
            [cell2.contentView addSubview:image02];
            UIImageView * image03 = [UIImageView new];
            image03.frame = CGRectMake(70, 515, 280, 400);
            image03.image = [UIImage imageNamed:@"works_img3"];
            [cell2.contentView addSubview:image03];
            UIImageView * image04 = [UIImageView new];
            image04.frame = CGRectMake(70, 920, 280, 400);
            image04.image = [UIImage imageNamed:@"works_img5"];
            [cell2.contentView addSubview:image04];
        }
        cell2.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell2;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 80;
    }
    return 1330;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
