
//
//  LXControlRootController.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/8/24.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXControlRootController.h"

@interface LXControlRootController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSArray *controllerData;
@end

@implementation LXControlRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"控件";
    [self.view addSubview:self.tableview];
    

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.controllerData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.controllerData[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Class class = NSClassFromString([NSString stringWithFormat:@"%@Controller",self.controllerData[indexPath.row]]);
    [self.navigationController pushViewController:[class new] animated:YES];
}
//返回竖屏格式
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
-(UITableView *)tableview{
    if (!_tableview) {
        _tableview =[[UITableView alloc]initWithFrame:CGRectMake(0, NAVH,Device_Width, Device_Height - NAVH) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.showsHorizontalScrollIndicator = NO;
        _tableview.showsVerticalScrollIndicator = YES;
        [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableview.tableFooterView =[UIView new];
    }
    return _tableview;
}
-(NSArray *)controllerData{
    if (!_controllerData) {
        _controllerData =  @[@"LXSegment",@"LXCustomSearch",@"LXChooseLocation",@"LXCustomPS",@"LXAddressSelect",@"LXTimeSelect",@"LXDropView",@"LXAlertView",@"LXOrderStatus",@"LBPlayView",@"LXHotword"];
    }
    return _controllerData;
}
@end
