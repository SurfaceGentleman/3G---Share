//
//  upload_image.m
//  share模仿
//
//  Created by 开朗的男子 on 2018/8/1.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "upload_image.h"
#import "collection_picture.h"

@interface upload_image ()
<UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate>

@end

@implementation upload_image

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _ch = @[@"原创作品", @"设计资料", @"设计师观点", @"设计教程"];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.94 alpha:1.00];
    UIView * grayView = [[UIView alloc] initWithFrame:CGRectMake(10, 75, 230, 130)];
    grayView.backgroundColor = [UIColor colorWithRed:0.83 green:0.83 blue:0.84 alpha:1.00];

    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 75, 230, 130)];
    imageView.image = [UIImage imageNamed:@"IMG_4449.JPG"];

    
    UIButton * choose = [[UIButton alloc] initWithFrame:CGRectMake(grayView.frame.size.width / 2 - 38, grayView.frame.size.height / 2 - 8, 100, 50)];
    [choose setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [choose setTitle:@"选择图片" forState:UIControlStateNormal];
    [choose addTarget:self action:@selector(Collection) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:grayView];
    [self.view addSubview:imageView];
    [grayView addSubview:choose];
    
    UIView * line = [[UIView alloc] initWithFrame:CGRectMake(0, 220, self.view.frame.size.width, 1)];
    line.backgroundColor = [UIColor colorWithRed:0.59 green:0.59 blue:0.60 alpha:1.00];
    [self.view addSubview:line];
    
    //添加button
    //添加按钮
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(10, 235, 90, 32);
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
    btn2.frame = CGRectMake(110, 235, 90, 32);
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
    btn3.frame = CGRectMake(210, 235, 90, 32);
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
    btn4.frame = CGRectMake(310, 235, 90, 32);
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
    btn5.frame = CGRectMake(10, 280, 90, 32);
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
    btn6.frame = CGRectMake(110, 280, 90, 32);
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
    btn7.frame = CGRectMake(210, 280, 90, 32);
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
    btn8.frame = CGRectMake(310, 280, 90, 32);
    [btn8 setTitle:@"其他" forState:UIControlStateNormal];
    btn8.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn8 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    btn8.backgroundColor = [UIColor whiteColor];
    btn8.tintColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [btn8 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    btn8.layer.cornerRadius = 4;
    [self.view addSubview:btn8];
    
    UITextView * name = [[UITextView alloc] initWithFrame:CGRectMake(0, 345, self.view.frame.size.width, 30)];
    name.tag = 301;
    name.backgroundColor = [UIColor whiteColor];
    name.font = [UIFont systemFontOfSize:18];
    name.textAlignment = NSTextAlignmentLeft;
    name.delegate = self;
    _label1 = [[UILabel alloc] initWithFrame:CGRectMake(15, 9, 80, 20)];
    _label1.text = @"作品名称";
    _label1.textColor = [UIColor colorWithRed:0.83 green:0.83 blue:0.84 alpha:1.00];
    [name addSubview:_label1];
    [self.view addSubview:name];
    
    UITextView * detail = [[UITextView alloc] initWithFrame:CGRectMake(0, 400, self.view.frame.size.width, 110)];
    detail.backgroundColor = [UIColor whiteColor];
    detail.font = [UIFont systemFontOfSize:17];
    detail.textAlignment = NSTextAlignmentLeft;
    detail.delegate = self;
    _label2 = [[UILabel alloc] initWithFrame:CGRectMake(15, 8, 300, 20)];
    _label2.text = @"请添假作品说明/文章内容......";
    _label2.textColor = [UIColor colorWithRed:0.83 green:0.83 blue:0.84 alpha:1.00];
    [detail addSubview:_label2];
    [self.view addSubview:detail];
    
    UIView * viewButton = [[UIView alloc] initWithFrame:CGRectMake(10, 520, self.view.frame.size.width - 20, 55)];
    viewButton.backgroundColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
    [self.view addSubview:viewButton];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(self.view.frame.size.width / 2 - 30 , 535, 60, 20);
    
    [button setTitle:@"发布" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(showAlert:) forControlEvents:UIControlEventTouchUpInside];
    //button.backgroundColor = [UIColor blackColor];
    [self.view addSubview:button];
    
    UIPickerView * pick = [[UIPickerView alloc] initWithFrame:CGRectMake(255, 120, 150, 45)];
    pick.delegate = self;
    pick.dataSource = self;
    pick.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:pick];
    
    
    UIButton * left = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    left.frame = CGRectMake(0, 0, 30, 30);
    left.tintColor = [UIColor whiteColor];
    [left setImage:[UIImage imageNamed:@"back_img"] forState:UIControlStateNormal];
    [left addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * bar = [[UIBarButtonItem alloc] initWithCustomView:left];
    self.navigationItem.leftBarButtonItem = bar;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 4;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _ch[row];
}

- (void)press:(UIButton *)btn
{
    btn.selected = !btn.selected;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)click
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)Collection
{
    collection_picture * a = [collection_picture new];
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(click)];
    a.navigationItem.leftBarButtonItem = item;
    a.navigationItem.backBarButtonItem = item;
    a.navigationItem.backBarButtonItem.tintColor = [UIColor whiteColor];
    a.view.backgroundColor = [UIColor whiteColor];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:a animated:YES];
        self.hidesBottomBarWhenPushed = NO;
}

- (IBAction)showAlert:(UIButton *)sender {
    //显示提示框
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"上传照片" message:@"上传已成功!" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * defaultAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction: defaultAction];
    [self presentViewController: alert animated: YES completion:nil];
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if(textView.tag == 301) {
        _label1.hidden = YES;
    }
    else{
        _label2.hidden = YES;
    }
}

- (void)textViewDidChange:(UITextView *)textView
{
    if (textView.tag == 301) {
        if (textView.text.length == 0) {
            _label1.hidden = NO;
        }
        else {
            _label1.hidden = YES;
        }
    }
    else {
        if (textView.text.length == 0) {
            _label2.hidden = NO;
        }
        else {
            _label2.hidden = YES;
        }
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
