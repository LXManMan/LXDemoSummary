//
//  LXLineLayoutController.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/9/4.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXLineLayoutController.h"
#import "LXLineLayout.h"
#import "LXPhotoCell.h"
@interface LXLineLayoutController ()<UICollectionViewDataSource, UICollectionViewDelegate>
/** collectionView */
@property (nonatomic, weak) UICollectionView *collectionView;
/** 数据 */
@property (nonatomic, strong) NSMutableArray *imageNames;

@end
static NSString * const LXPhotoId = @"photo";
@implementation LXLineLayoutController


- (NSMutableArray *)imageNames
{
    if (!_imageNames) {
        _imageNames = [NSMutableArray array];
        for (int i = 0; i<20; i++) {
            [_imageNames addObject:[NSString stringWithFormat:@"%zd", i + 1]];
        }
    }
    return _imageNames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
   self.navigationItem.title = @"水平布局----相册";
    
    
    //创建布局
    LXLineLayout *layout =[[LXLineLayout alloc]init];
    layout.itemSize = CGSizeMake(100, 100);
    
    UICollectionView *collectionView =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 150, CGRectGetWidth(self.view.frame), 200) collectionViewLayout:layout];
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    
    self.collectionView = collectionView;
    
    self.collectionView.backgroundColor =[UIColor redColor];
    // 注册
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([LXPhotoCell class]) bundle:nil] forCellWithReuseIdentifier:LXPhotoId];
    
    [self.collectionView reloadData];
    
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageNames.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LXPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LXPhotoId forIndexPath:indexPath];
    
    cell.imageName = self.imageNames[indexPath.item];
    
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.imageNames removeObjectAtIndex:indexPath.item];
    [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
}



@end
