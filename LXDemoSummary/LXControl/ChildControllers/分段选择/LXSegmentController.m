//
//  LXSegmentController.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/8/24.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXSegmentController.h"
#import "QBQuSegmentView.h"
#import "LXSegmentOneController.h"
#import "LXSegmentTwoController.h"
#import "LXSegmentThreeController.h"
@interface LXSegmentController ()<UIScrollViewDelegate,QBQuSegmentViewDelegate>
@property(nonatomic,strong)QBQuSegmentView *segmentView;
@property (nonatomic, strong)UIScrollView *mainScrollView;
@property(nonatomic,strong)LXBasicController *currentVc;

@end

@implementation LXSegmentController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"分段控制";
    [self.view addSubview:self.segmentView];
    
    [self.view addSubview:self.mainScrollView];
    
     [self setupChildViewController];
}

-(QBQuSegmentView *)segmentView{
    if (!_segmentView) {
        _segmentView =[[QBQuSegmentView alloc]initWithFrame:CGRectMake(0, NAVH, Device_Width, 45) titlesA:@[@"生活",@"健康",@"咨询"]];
    }
    [_segmentView setLineColor:LXMainColor];

    return _segmentView;
}
-(void)QBQuSegmentView:(QBQuSegmentView *)segmentView didSelectBtnAtIndex:(NSInteger)index{
    // 1 计算滚动的位置
    
    CGFloat offsetX = index * self.view.frame.size.width;
    // 2.给对应位置添加对应子控制器
    [self.mainScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    [self showVc:index];
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    // 计算滚动到哪一页
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    // 1.添加子控制器view
    [self showVc:index];
    
    // 2.把对应的标题选中
    [self.segmentView titleBtnSelectedWithScrollView:scrollView];
}

// 显示控制器的view
- (void)showVc:(NSInteger)index {
    
    
    
    CGFloat offsetX = index * self.view.frame.size.width;
    
    LXBasicController *vc = self.childViewControllers[index];
    self.currentVc = vc;
   
    // 判断控制器的view有没有加载过,如果已经加载过,就不需要加载
    if (vc.isViewLoaded) return;
    [self.mainScrollView addSubview:vc.view];
    vc.view.frame = CGRectMake(offsetX, 0, self.view.frame.size.width, self.view.frame.size.height);
}

-(void)setupChildViewController{
    
    LXSegmentOneController *newVc =[[LXSegmentOneController alloc]init];
    [self addChildViewController:newVc];
    [self.mainScrollView addSubview:newVc.view];
    
    LXSegmentTwoController *equityVc =[[LXSegmentTwoController alloc]init];
    [self addChildViewController:equityVc];
    LXSegmentThreeController *digitalVc =[[LXSegmentThreeController alloc]init];
    [self addChildViewController:digitalVc];
    self.currentVc = newVc;
}
-(UIScrollView *)mainScrollView{
    if (!_mainScrollView) {
        _mainScrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0, NAVH+45, Device_Width, Device_Height - NAVH-45)];
        _mainScrollView.contentSize = CGSizeMake(3 *Device_Width, 0);
        _mainScrollView.pagingEnabled = YES;
        _mainScrollView.bounces = NO;
        _mainScrollView.delegate = self;
        _mainScrollView.showsHorizontalScrollIndicator = NO;
        _mainScrollView.showsVerticalScrollIndicator = NO;
    }
    return _mainScrollView;
}

@end
