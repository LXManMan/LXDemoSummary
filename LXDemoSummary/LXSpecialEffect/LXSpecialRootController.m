
//
//  LXSpecialRootController.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/8/24.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXSpecialRootController.h"
#import "MyListCell.h"
@interface LXSpecialRootController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSMutableArray *datas;
@property(nonatomic,strong)NSArray *detailTitleA;

@end

@implementation LXSpecialRootController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"特效";

    [self.view addSubview:self.tableview];
    
    //    self.tableview.estimatedRowHeight = 44;
    self.tableview.rowHeight = 50;
    [self.tableview registerNib:[UINib nibWithNibName:@"MyListCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyListCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell =[[MyListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.descrLabel.text = self.datas[indexPath.row];
    
    cell.titleLabel.text = self.detailTitleA[indexPath.row];

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSString *string = [NSString stringWithFormat:@"%@ViewController",self.datas[indexPath.row]];
    
    LXBasicController*vc =[NSClassFromString(string) new];
    vc.title = self.datas[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}
-(NSMutableArray *)datas
{
    if (!_datas) {
        _datas =[NSMutableArray array];
        [_datas  addObject:@"Arc"];
        [_datas addObject:@"Arc2"];
        [_datas addObject:@"Round"];
        [_datas addObject:@"Hub"];
        [_datas addObject:@"Wave"];
        [_datas addObject:@"Shipe"];
        [_datas addObject:@"Radar"];
    }
    return _datas;
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
        _tableview.separatorStyle = 0;
        [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableview.tableFooterView =[UIView new];
    }
    return _tableview;
}

-(NSArray *)detailTitleA{
    if (!_detailTitleA) {
        _detailTitleA = @[@"扇形进度",@"圆形进度条",@"渐变色进度",@"自定义密码键盘",@"自定义HUD",@"波浪进度",@"小船",@"扩散动画"];
    }
    return _detailTitleA;
}

@end
