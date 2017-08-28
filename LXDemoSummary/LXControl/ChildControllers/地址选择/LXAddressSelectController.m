//
//  LXAddressSelectController.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/8/24.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXAddressSelectController.h"
#import "GFAddressPicker.h"

@interface LXAddressSelectController ()<GFAddressPickerDelegate>
@property (nonatomic, strong) GFAddressPicker *placepickerView;
@property(nonatomic,strong)LxButton *button;

@end

@implementation LXAddressSelectController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"地址选择器";

    
    LxButton *button =[LxButton LXButtonWithTitle:@"点我" titleFont:LXFont(15) Image:nil backgroundImage:nil backgroundColor:[UIColor lightGrayColor] titleColor:[UIColor blueColor] frame:CGRectMake(50, 100, Device_Width -100, 40)];
    [self.view addSubview:button];
    
    self.button  = button;
    LXWS(weakSelf);
    [button addClickBlock:^(UIButton *button) {
       
        weakSelf.placepickerView.hidden = NO;
    }];

    
    [self.view addSubview:self.placepickerView];

}
- (void)GFAddressPickerCancleAction
{
    [self.placepickerView setHidden:YES];
}
- (void)GFAddressPickerWithProvince:(NSString *)province
                               city:(NSString *)city area:(NSString *)area
{
    [self.placepickerView setHidden:YES];
    
    [self.button setTitle:[NSString stringWithFormat:@"%@  %@  %@",province,city,area] forState:UIControlStateNormal];
    //    self.editTextField.text = [NSString stringWithFormat:@"%@  %@  %@",province,city,area];
    
    //    NSLog(@"%@  %@  %@",province,city,area);
}

-(GFAddressPicker *)placepickerView
{
    if (!_placepickerView) {
        _placepickerView =[[GFAddressPicker alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        [_placepickerView updateAddressAtProvince:@"北京市" city:@"北京市" town:@"东城区"];
        _placepickerView.delegate = self;
        _placepickerView.font = LXFont(15);
        [_placepickerView setHidden:YES];
        
    }
    return _placepickerView;
}

@end
