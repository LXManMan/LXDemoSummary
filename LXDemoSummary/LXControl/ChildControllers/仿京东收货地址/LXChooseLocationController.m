//
//  LXChooseLocationController.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/8/24.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXChooseLocationController.h"
#import "ChooseLocationView.h"
#import "CitiesDataTool.h"
@interface LXChooseLocationController ()<UIGestureRecognizerDelegate>
@property (nonatomic,strong) ChooseLocationView *chooseLocationView;

@property (nonatomic,strong) UIView  *cover;
@property(nonatomic,strong)LxButton *button;

@end

@implementation LXChooseLocationController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].delegate.window.backgroundColor =[UIColor blackColor];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
     [UIApplication sharedApplication].delegate.window.backgroundColor =[UIColor whiteColor];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"仿京东地址选择器";

    
    
    LxButton *button =[LxButton LXButtonWithTitle:@"点我" titleFont:LXFont(15) Image:nil backgroundImage:nil backgroundColor:[UIColor lightGrayColor] titleColor:[UIColor blueColor] frame:CGRectMake(50, 100, Device_Width -100, 40)];
    [self.view addSubview:button];
    
    self.button  = button;
    
    LXWS(weakSelf);
    
    [button addClickBlock:^(UIButton *button) {
        [weakSelf.view endEditing:YES];
        [UIView animateWithDuration:0.25 animations:^{
            weakSelf.navigationController.view.transform =CGAffineTransformMakeScale(0.90, 0.90);
        }];
        weakSelf.cover.hidden = !weakSelf.cover.hidden;
        self.chooseLocationView.hidden = weakSelf.cover.hidden;

    }];
    [self.view addSubview:self.cover];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (ChooseLocationView *)chooseLocationView{
    
    if (!_chooseLocationView) {
        _chooseLocationView = [[ChooseLocationView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 350, [UIScreen mainScreen].bounds.size.width, 350)];
        
    }
    return _chooseLocationView;
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    
    CGPoint point = [gestureRecognizer locationInView:gestureRecognizer.view];
    if (CGRectContainsPoint(_chooseLocationView.frame, point)){
        return NO;
    }
    return YES;
}
- (UIView *)cover{
    
    if (!_cover) {
        _cover = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _cover.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
        [_cover addSubview:self.chooseLocationView];
        __weak typeof (self) weakSelf = self;
        _chooseLocationView.chooseFinish = ^{
            [UIView animateWithDuration:0.25 animations:^{
                weakSelf.navigationController.view.transform = CGAffineTransformIdentity;
                weakSelf.cover.hidden = YES;
                
                
//                NCNewAddressCell *cell =[weakSelf.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
//                cell.regionLabel.text = weakSelf.chooseLocationView.address;
//                
//                weakSelf.regionStr = weakSelf.chooseLocationView.address;
                
                [weakSelf.button setTitle:weakSelf.chooseLocationView.address forState:UIControlStateNormal];
            }];
        };
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapCover:)];
        [_cover addGestureRecognizer:tap];
        tap.delegate = self;
        _cover.hidden = YES;
    }
    return _cover;
}

- (void)tapCover:(UITapGestureRecognizer *)tap{
    
    if (_chooseLocationView.chooseFinish) {
        _chooseLocationView.chooseFinish();
    }
}

@end
