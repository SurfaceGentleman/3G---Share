//
//  collection_picture.m
//  share模仿
//
//  Created by 开朗的男子 on 2018/8/3.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "collection_picture.h"

@interface collection_picture ()

@end

@implementation collection_picture

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithRed:0.83 green:0.83 blue:0.84 alpha:1.00];
    
    _image = @[@"IMG_4439.JPG", @"IMG_4449.JPG", @"IMG_4448.JPG", @"IMG_4435.JPG", @"IMG_4434.JPG", @"IMG_4432.JPG", @"IMG_4431.JPG", @"IMG_4429.JPG", @"IMG_4421.GIF", @"IMG_4413.JPG", @"IMG_4419.JPG", @"IMG_4381.JPG", @"IMG_4367.JPG", @"IMG_4456.JPG", @"IMG_4457.JPG", @"IMG_4318.JPG", @"IMG_4234.JPG"];
    UICollectionViewFlowLayout * layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake(130, 130);
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.allowsMultipleSelection = YES;
    [self.view addSubview:collectionView];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 17;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 130, 130)];
    imageView.image = [UIImage imageNamed:_image[indexPath.item]];
    cell.backgroundView = imageView;
    
    return cell;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)press:(UIButton *)btn
{
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    _se = [[UIImageView alloc] initWithFrame:CGRectMake(100, 10, 20, 20)];
    _se.image = [UIImage imageNamed:@"my_button_normal"];
    [cell.contentView addSubview:_se];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 130, 130)];
    imageView.image = [UIImage imageNamed:_image[indexPath.item]];
    [cell.contentView addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
