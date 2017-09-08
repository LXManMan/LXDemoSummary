//
//  CollectionJGGController.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/9/4.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "CollectionJGGController.h"

@interface CollectionJGGController ()

@end

@implementation CollectionJGGController

static NSString * const reuseIdentifier = @"Cell";

-(instancetype)init{
   
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        // 1.设置整个collectionView的内边距
        CGFloat paddingY = 10;
        CGFloat paddingX = 10;
        // 2.设置每个格子的尺寸
       CGFloat cellW = (Device_Width - 2 *paddingY -2 *paddingY )/3;
        layout.itemSize = CGSizeMake(cellW, cellW);
    
    
        layout.sectionInset = UIEdgeInsetsMake(paddingY, paddingY, paddingX, paddingY);
        // 3.设置每一行之间的间距
        layout.minimumLineSpacing = paddingX;
       layout.minimumInteritemSpacing = 0;
  
    return  [self initWithCollectionViewLayout:layout];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =[UIColor whiteColor];
   
    self.collectionView.backgroundColor =[UIColor hexStringToColor:@"F9F9F9"];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = LXRandomColor;
    
    return cell;
}



@end
