
//
//  LXControlRootController.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/8/24.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXControlRootController.h"
#import "MyListCell.h"

@interface LXControlRootController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSArray *controllerData;
@property(nonatomic,strong)NSArray *detailTitleA;
@end

@implementation LXControlRootController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSLog(@"%s",__func__);

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"控件";
    [self.view addSubview:self.tableview];
    
//    self.tableview.estimatedRowHeight = 44;
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
   
    cell.titleLabel.text = self.detailTitleA[indexPath.row];
    
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
        _controllerData =  @[@"LXSegment",@"LXCustomSearch",@"LXChooseLocation",@"LXCustomPS",@"LXAddressSelect",@"LXTimeSelect",@"LXDropView",@"LXAlertView",@"LXOrderStatus",@"LBPlayView",@"LXHotword",@"LXPullDown",@"LXGradientNavbar",@"LXPullGradient",@"LXCustom",@"LXWebImageGif"];
    }
    return _controllerData;
}
-(NSArray *)detailTitleA{
    if (!_detailTitleA) {
        _detailTitleA = @[@"分段控制器",@"自定义搜索",@"仿京东地址选择",@"自定义密码键盘",@"地址选择器",@"时间选择器",@"任意点点击弹框",@"自定义弹框",@"收货进度条",@"自定义AVPlayer播放器",@"热词以及历史记录封装",@"下拉一体封装",@"一个渐变色的Navbar",@"下拉渐变Navbar",@"仿简书个人中心",@"YYWebImage进度加载Gif动画效果"];
    }
    return _detailTitleA;
}
@end
