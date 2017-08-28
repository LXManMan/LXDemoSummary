//
//  LXCustomSearchController.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/8/24.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXCustomSearchController.h"
#import "LXCardSearchView.h"

@interface LXCustomSearchController ()
@property(nonatomic,strong)LXCardSearchView *cardSeachView;
@property(nonatomic,strong)UIView *navView;

@end

@implementation LXCustomSearchController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.navigationItem.title = @"自定义搜索";

    self.view.backgroundColor =[UIColor whiteColor];
    
    [self.view addSubview:self.navView];
    
    self.cardSeachView =[[LXCardSearchView alloc]init];
    [self.navView addSubview:self.cardSeachView];
    self.cardSeachView.backgroundColor =[UIColor whiteColor];
    
    self.cardSeachView.sd_layout
    .leftEqualToView(self.navView)
    .rightEqualToView(self.navView)
    .bottomSpaceToView(self.navView, 10)
    .heightIs(31);
    
    
    self.cardSeachView.searchCompleteBlock = ^(NSString *text) {
        NSLog(@"%@",text);
    };
    
    LXWS(weakSelf);
    self.cardSeachView.selectBlock = ^(LxButton *button) {
        UIViewController *vc =[[UIViewController alloc]init];
        vc.view.backgroundColor = LXRandomColor;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    
    
    self.cardSeachView.returnBlock = ^{
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [self.cardSeachView resetStatus];
}
-(UIView *)navView{
    if (!_navView) {
        _navView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, Device_Width, 64)];
        _navView.backgroundColor =[UIColor whiteColor];
    }
    return _navView;
}
@end
