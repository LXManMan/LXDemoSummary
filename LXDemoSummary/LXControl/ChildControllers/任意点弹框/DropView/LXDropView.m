//
//  LXDropView.m
//  NCDropView
//
//  Created by zhongzhi on 2017/7/14.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import "LXDropView.h"
#import "LXDropListCell.h"
#define ROWHEIGHT 44
@interface LXDropView()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,assign)CGPoint orignPoint;
@property(nonatomic,assign)CGFloat listWidth;
@property(nonatomic,copy)void (^selectResult)(NSInteger index);
@property(nonatomic,strong)NSArray *titleA;
@property(nonatomic,strong)UITableView *listView;
@end
@implementation LXDropView
-(instancetype)initWithTitleArray:(NSArray *)titleA orignPoint:(CGPoint)orginPoint listWidth:(CGFloat)listWidth selectResult:(void (^)(NSInteger))selectResult{
    
    self = [super init];
    
    if (self) {
        
        self.orignPoint = orginPoint;
        
        //超出屏幕宽度的判断
        if (listWidth +  self.orignPoint.x >= [UIScreen mainScreen].bounds.size.width) {
            listWidth = [UIScreen mainScreen].bounds.size.width;
        }
        self.listWidth = listWidth;
        self.selectResult = selectResult;
        self.titleA = titleA;
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor =[UIColor clearColor];
        [self setUp];
        [self.listView reloadData];
    }
    
    return self;
}
-(void)setUp{
    
    [self addSubview:self.listView];
    
}


-(void)show{
    
    UIWindow *keyWindow = [UIApplication sharedApplication].windows.lastObject;
    
    [keyWindow addSubview:self];
    
  
    [self creatAnimaiton];
}

-(void)creatAnimaiton{
    self.listView.alpha = 0.f;
    self.listView.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    [UIView animateWithDuration:0.2f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.listView.transform = CGAffineTransformMakeScale(1.05f, 1.05f);
        self.listView.alpha = 1.f;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.08f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.listView.transform = CGAffineTransformIdentity;
        } completion:nil];
    }];

}
-(void)dismiss{
    [UIView animateWithDuration:0.3f animations:^{
         self.listView.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
         self.listView.alpha = 0.f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleA.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LXDropListCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) {
        cell =[[LXDropListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.contentLabel.text = self.titleA[indexPath.row];
    return cell;
}
-(UITableView *)listView{
    if (!_listView) {
        _listView =[[UITableView alloc]initWithFrame:CGRectMake(self.orignPoint.x, self.orignPoint.y, self.listWidth, self.titleA.count * ROWHEIGHT) style:UITableViewStylePlain];
        _listView.delegate = self;
        _listView.dataSource = self;
        _listView.showsVerticalScrollIndicator = NO;
        _listView.showsHorizontalScrollIndicator = NO;
        _listView.rowHeight = ROWHEIGHT;
        [_listView registerNib:[UINib nibWithNibName:@"LXDropListCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        _listView.layer.cornerRadius =3;
        _listView.layer.masksToBounds = YES;
    }
    return _listView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    if (self.selectResult) {
        self.selectResult(indexPath.row);
        [self dismiss];
    }
}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    UITouch *touch =[touches anyObject];
//    
//    CGPoint point = [touch locationInView:self];
//    point = [self.listView.layer convertPoint:point fromLayer:self.layer];
//    if ([self.listView.layer containsPoint:point]  ) {
//        
//    }else{
////        [self dismiss];
//        [self removeFromSuperview];
//        
//    }
//    
//}
@end
