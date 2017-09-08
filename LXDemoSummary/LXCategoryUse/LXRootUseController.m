//
//  LXRootUseController.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/8/24.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXRootUseController.h"
#import "MyListCell.h"
@interface LXRootUseController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSArray *controllerData;
@property(nonatomic,strong)NSArray *detailTitleA;

@end

@implementation LXRootUseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"分类";
    [self.view addSubview:self.tableview];
    
    self.tableview.rowHeight = 50;
    [self.tableview registerNib:[UINib nibWithNibName:@"MyListCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.controllerData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyListCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell =[[MyListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.descrLabel.text = self.controllerData[indexPath.row];
    
    cell.titleLabel.text = self.detailTitleA[indexPath.row];    return cell;
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
        _tableview =[[UITableView alloc]initWithFrame:CGRectMake(0, NAVH,Device_Width, Device_Height - NAVH-TABBARH) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.showsHorizontalScrollIndicator = NO;
        _tableview.showsVerticalScrollIndicator = YES;
        _tableview.separatorStyle = 0;
        [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableview.tableFooterView =[UIView new];
    }
    return _tableview;
}
-(NSArray *)controllerData{
    if (!_controllerData) {
        _controllerData =  @[@"LabelTap",@"LXButtonTapInterval",@"LXButtonClickDelay"];
    }
    return _controllerData;
}
-(NSArray *)detailTitleA{
    if (!_detailTitleA) {
        _detailTitleA = @[@"文字局部点击",@"button 点击间隔",@"按钮点击延迟"];
    }
    return _detailTitleA;
}
@end
