
//
//  LXCardSearchView.m
//  LXCardSearch
//
//  Created by zhongzhi on 2017/8/16.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXCardSearchView.h"
#define Cornerdious 15.5
@interface LXCardSearchView ()<UITextFieldDelegate>
@property(nonatomic,strong)LxButton *rightBtn;
@property(nonatomic,strong)LxButton *leftBtn;
@property(nonatomic,strong)UIView *centerView;
@property(nonatomic,strong)FTTextField *textField;
@property(nonatomic,strong)UIView *leftView;

@property(nonatomic,strong)UIImageView *searchImageview;
@property(nonatomic,strong)UILabel *noticeLabel;
@end
@implementation LXCardSearchView

-(instancetype)init{
    self = [super init];
    if (self) {
       
        [self setup];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gosave:) name:UITextFieldTextDidEndEditingNotification object:nil];
        [self btnAction];
    }
    return self;
}
-(void)btnAction{
    
    LXWS(weakSelf);
    [self.leftBtn addClickBlock:^(UIButton *button) {
        
        if (weakSelf.returnBlock) {
            weakSelf.returnBlock();
        }
    }];
    
    [self.rightBtn addClickBlock:^(UIButton *button) {
        if (button.selected) {
             [weakSelf resetStatus];
        }else{
            if (weakSelf.selectBlock) {
                weakSelf.selectBlock(weakSelf.rightBtn);
            }
        }
    }];

    
}
-(void)gosave:(NSNotification *)noti{
    FTTextField * textField = noti.object;
    
    if (textField.text.length >0) {
        if (self.searchCompleteBlock) {
            self.searchCompleteBlock(textField.text);
        }
    }
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
-(void)setup{
    
    
    [self sd_addSubviews:@[self.leftBtn,self.centerView,self.rightBtn]];
    
    [self.centerView sd_addSubviews:@[self.leftView,self.textField]];
    
    
    [self.leftView sd_addSubviews:@[self.noticeLabel,self.searchImageview]];
    self.leftBtn.sd_layout
    .leftSpaceToView(self, 16)
    .centerYEqualToView(self)
    .widthIs(10)
    .heightIs(17);
    
    self.rightBtn.sd_layout
    .rightSpaceToView(self, 16)
    .centerYEqualToView(self);
    
    [self.rightBtn setupAutoSizeWithHorizontalPadding:10 buttonHeight:31];
    
    
    self.rightBtn.enlargeSize = CGSizeMake(16, 16);
    self.centerView.sd_layout
    .leftSpaceToView(self.leftBtn, 16)
    .rightSpaceToView(self.rightBtn, 16)
    .centerYEqualToView(self)
    .heightRatioToView(self, 1);
    
    self.centerView.sd_cornerRadius = [NSNumber numberWithFloat:Cornerdious];
    
    self.leftView.sd_layout
    .leftSpaceToView(self.centerView, Cornerdious)
    .heightRatioToView(self.centerView, 1)
    .topEqualToView(self.centerView)
    .widthIs(20);
    
    
    self.textField.sd_layout
    .leftSpaceToView(self.leftView, 0)
    .rightEqualToView(self.centerView)
    .topEqualToView(self.centerView)
    .heightRatioToView(self.centerView, 1);
    
    
    
    self.noticeLabel.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
    
    self.searchImageview.sd_layout
    .leftEqualToView(self.leftView)
    .centerYEqualToView(self.leftView)
    .widthIs(15)
    .heightIs(15);
    
    
    
    
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    self.rightBtn.selected = YES;
   
    self.noticeLabel.hidden = NO;
    self.searchImageview.hidden = YES;
    
    
    [UIView animateWithDuration:0.25 animations:^{
        self.leftView.sd_layout.widthIs(40);
        
        self.leftBtn.sd_layout.leftSpaceToView(self, 0).widthIs(0.01);
        [self.centerView updateLayout];
        [self updateLayout];
        
    }];

    return YES;
}
-(void)resetStatus{
    
    [UIView animateWithDuration:0.25 animations:^{
        self.leftView.sd_layout.widthIs(20);
        self.leftBtn.sd_layout.leftSpaceToView(self, 16).widthIs(10);
        [self.centerView updateLayout];
        [self updateLayout];
    }];
    
    [self.textField resignFirstResponder];
    self.noticeLabel.hidden = YES;
    self.searchImageview.hidden = NO;
    self.rightBtn.selected = NO;
}
-(LxButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn =[LxButton LXButtonNoFrameWithTitle:@"筛选" titleFont:LXFont(16) Image:nil backgroundImage:nil backgroundColor:[UIColor whiteColor] titleColor:[UIColor hexStringToColor:@"3c3c3c"]];
        [_rightBtn setTitle:@"取消" forState:UIControlStateSelected];
    }
    return _rightBtn;
}
-(LxButton *)leftBtn{
    if (!_leftBtn) {
        _leftBtn =[LxButton LXButtonNoFrameWithTitle:@"" titleFont:LXFont(16) Image:[UIImage imageNamed:@"fanhui"] backgroundImage:nil backgroundColor:nil titleColor:nil];
    }
    return _leftBtn;
}
-(UIView *)centerView{
    if (!_centerView) {
        _centerView =[[UIView alloc]init];
        _centerView.backgroundColor =[UIColor hexStringToColor:@"#f4f4f4"];
    }
    return _centerView;
}
-(FTTextField *)textField{
    if (!_textField) {
        _textField =[[FTTextField alloc]init];
        _textField.borderStyle = 0;
        _textField.placeholder = @"关键字";
        _textField.delegate = self;
        _textField.returnKeyType = UIReturnKeySearch;
        
    }
    return _textField;
}
-(UIView *)leftView{
    if (!_leftView) {
        _leftView =[[UIView alloc]init];
    }
    return _leftView;
}
-(UILabel *)noticeLabel{
    if (!_noticeLabel) {
        _noticeLabel =[UILabel LXLabelWithTextNoFrame:@"商品" textColor:[UIColor hexStringToColor:@"3c3c3c"] backgroundColor:[UIColor clearColor] font:LXFont(15) textAlignment:NSTextAlignmentCenter];
        _noticeLabel.hidden = YES;
    }
    return _noticeLabel;
}
-(UIImageView *)searchImageview{
    if (!_searchImageview) {
        _searchImageview =[[UIImageView alloc]init];
        _searchImageview.image =[UIImage imageNamed:@"icon_sou_suo"];
    }
    return _searchImageview;
}
@end
