//
//  LXPhotoCell.m
//  CollectionOne
//
//  Created by zhongzhi on 2017/9/4.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXPhotoCell.h"
@interface LXPhotoCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end
@implementation LXPhotoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.borderWidth = 10;
}
- (void)setImageName:(NSString *)imageName
{
    _imageName = [imageName copy];
    
    self.imageView.image = [UIImage imageNamed:imageName];
}
@end
