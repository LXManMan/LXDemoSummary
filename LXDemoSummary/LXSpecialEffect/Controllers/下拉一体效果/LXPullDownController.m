//
//  LXPullDownController.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/8/28.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXPullDownController.h"
#import "Header.h"
#import "PullDownZoom.h"

@interface LXPullDownController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)Header *header;
@property(nonatomic,strong)PullDownZoom *zoom;

@end

@implementation LXPullDownController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *image =[self imageWithColor:[UIColor hexStringToColor:@"ff8833"]];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.view addSubview:self.tableview];
    
    [self.tableview addSubview:self.header];
    
    
    self.zoom =  [[PullDownZoom alloc]initWithTableview:self.tableview headerH:300 header:self.header];

}
-(UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage *imgae = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imgae;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    [self.zoom scrollZoom];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[tableView  dequeueReusableCellWithIdentifier:@""];
    
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    }
    cell.textLabel.text =  @"下拉封装";
    return cell;
}

-(UITableView *)tableview{
    if (!_tableview) {
        _tableview =[[UITableView alloc]initWithFrame:CGRectMake(0, 64, Device_Width, Device_Height - 64) style:UITableViewStylePlain];
        _tableview.showsVerticalScrollIndicator = NO;
        _tableview.showsHorizontalScrollIndicator=  NO;
        _tableview.dataSource = self;
        _tableview.delegate = self;
        [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableview;
}
-(Header *)header{
    if (!_header) {
        _header =[[NSBundle mainBundle]loadNibNamed:@"Header" owner:self options:nil].firstObject;
        _header.frame= CGRectMake(0, -300, Device_Width, 300);
    }
    return _header;
}


@end
