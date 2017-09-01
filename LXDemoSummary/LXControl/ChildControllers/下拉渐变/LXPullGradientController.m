//
//  LXPullGradientController.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/8/31.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXPullGradientController.h"

@interface LXPullGradientController ()
@property(nonatomic,strong)UIImageView *header;
@end

@implementation LXPullGradientController
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [LXGradientNavManager resStoreToDefaultNavigationBar];
}

-(void)viewDidAppear:(BOOL)animated{
    [self scrollViewDidScroll:self.tableView];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"下拉渐变";
    self.tableView.showsVerticalScrollIndicator = NO;
    self.automaticallyAdjustsScrollViewInsets  = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.tableView.tableHeaderView = self.header;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.tableFooterView =[UIView new];
    [self configNavbar];
}
-(UIImageView *)header{
    
    if (!_header) {
        _header =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Device_Width, 200)];
        _header.image =[UIImage imageNamed:@"flower"];
    }
    return _header;
}
-(void)configNavbar{
    
    [LXGradientNavManager managerWithController:self];
    [LXGradientNavManager setOrignColor:[UIColor clearColor]];
    [LXGradientNavManager setDefaultColor:LXMainColor];
    [LXGradientNavManager setZeroAlphaOffset:0 ];
    [LXGradientNavManager setFullAlphaOffset:self.tableView.tableHeaderView.height];
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [LXGradientNavManager dealGradientWithScrollView:scrollView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = @"下拉渐变navbar";
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
