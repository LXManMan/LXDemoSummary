//
//  GFAddressPicker.m
//  地址选择器
//
//  Created by 1暖通商城 on 2017/5/10.
//  Copyright © 2017年 1暖通商城. All rights reserved.
//

#import "GFAddressPicker.h"

#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@interface GFAddressPicker ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (strong, nonatomic) NSDictionary *pickerDic;
@property (strong, nonatomic) NSArray *selectedArray;
@property (strong, nonatomic) NSArray *provinceArray;
@property (strong, nonatomic) NSArray *cityArray;
@property (strong, nonatomic) NSArray *townArray;
@property (strong, nonatomic) UIPickerView *pickView;

@property(nonatomic,strong)UIView *contentV;
@end
@implementation GFAddressPicker
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       self.backgroundColor = RGBA(0, 0, 0, 0.5);
        [self getAddressInformation];
        [self setBaseView];
    }
    return self;
}

- (void)getAddressInformation {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Address" ofType:@"plist"];
    self.pickerDic = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.provinceArray = [self.pickerDic allKeys];
    self.selectedArray = [self.pickerDic objectForKey:[[self.pickerDic allKeys] objectAtIndex:0]];
    if (self.selectedArray.count > 0) {
        self.cityArray = [[self.selectedArray objectAtIndex:0] allKeys];
    }
    if (self.cityArray.count > 0) {
        self.townArray = [[self.selectedArray objectAtIndex:0] objectForKey:[self.cityArray objectAtIndex:0]];
    }
}

- (void)setBaseView {
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    

    self.contentV = [[UIView alloc]initWithFrame:CGRectMake(0, height - 220, self.width, 220)];
    
    self.contentV.backgroundColor =[UIColor whiteColor];
    [self addSubview:self.contentV];
    UIButton *cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancleBtn setTitle:@"取消" forState:0];
    
    cancleBtn.titleLabel.font = [UIFont systemFontOfSize:15];

    [cancleBtn setTitleColor:LXMainColor forState:UIControlStateNormal];
    cancleBtn.frame = CGRectMake(12, 0, 40, 40);
    [cancleBtn addTarget:self action:@selector(dateCancleAction) forControlEvents:UIControlEventTouchUpInside];
    [ self.contentV addSubview:cancleBtn];
    
    UIButton *ensureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [ensureBtn setTitle:@"确定" forState:0];
        [ensureBtn setTitleColor:LXMainColor forState:UIControlStateNormal];
    ensureBtn.frame = CGRectMake(width - 52, 0, 40, 40);
    ensureBtn.titleLabel.font = [UIFont systemFontOfSize:15];

    [ensureBtn addTarget:self action:@selector(dateEnsureAction) forControlEvents:UIControlEventTouchUpInside];
    [ self.contentV addSubview:ensureBtn];
    
    //分割线
    UIView *splitView = [[UIView alloc] initWithFrame:CGRectMake(0, 39.5, width, 0.5)];
    splitView.backgroundColor = UIColorFromRGB(0xe6e6e6);
    [ self.contentV addSubview:splitView];
    
    
    self.pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40 , width,  180)];
    self.pickView.delegate   = self;
    self.pickView.dataSource = self;
    self.pickView.backgroundColor = [UIColor whiteColor];
    [ self.contentV addSubview:self.pickView];
    [self.pickView reloadAllComponents];
    [self updateAddress];
    
}


-(void)setHidden:(BOOL)hidden{
    
//    [super setHidden:hidden];
    
    if (hidden) {
        [UIView animateWithDuration:0.2f animations:^{
            self.alpha = 0;
            self.contentV.frame = CGRectMake(0, self.height, self.width, 220);
        } completion:^(BOOL finished) {
            
            
        }];

    }else{
        [UIView animateWithDuration:0.2f animations:^{
            self.alpha = 1;
            
        } completion:^(BOOL finished) {
            self.contentV.frame = CGRectMake(0, self.height -220, self.width, 220);
           
        }];

    }
   
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch =[touches anyObject];
    if (!self.hidden) {
        CGPoint point = [touch locationInView:self];
        point = [self.pickView.layer convertPoint:point fromLayer:self.layer];
        if ([self.pickView.layer containsPoint:point]  ) {
            
        }else{
            [self setHidden:YES];
            
        }
    }
}
- (void)updateAddressAtProvince:(NSString *)province city:(NSString *)city town:(NSString *)town {
    self.province = province;
    self.city = city;
    self.area = town;
    if (self.province) {
        for (NSInteger i = 0; i < self.provinceArray.count; i++) {
            NSString *city = self.provinceArray[i];
            NSInteger select = 0;
            if ([city isEqualToString:self.province]) {
                select = i;
                [self.pickView selectRow:i inComponent:0 animated:YES];
                break;
            }
        }
        self.cityArray = [self.pickerDic[self.province][0] allKeys];
        for (NSInteger i = 0; i < self.cityArray.count; i++) {
            NSString *city = self.cityArray[i];
            if ([city isEqualToString:self.city]) {
                [self.pickView selectRow:i inComponent:1 animated:YES];
                break;
            }
        }
        self.townArray = self.pickerDic[self.province][0][self.city];
        for (NSInteger i = 0; i < self.townArray.count; i++) {
            NSString *town = self.townArray[i];
            if ([town isEqualToString:self.area]) {
                [self.pickView selectRow:i inComponent:2 animated:YES];
                break;
            }
        }
    }
    [self.pickView reloadAllComponents];
    [self updateAddress];
}

- (void)dateCancleAction {
    if (self.delegate && [self.delegate respondsToSelector:@selector(GFAddressPickerCancleAction)]) {
        [self.delegate GFAddressPickerCancleAction];
    }
}

- (void)dateEnsureAction {
    if (self.delegate && [self.delegate respondsToSelector:@selector(GFAddressPickerWithProvince:city:area:)]) {
        [self.delegate GFAddressPickerWithProvince:self.province city:self.city area:self.area];
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        pickerLabel.textAlignment = NSTextAlignmentCenter;
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:self.font?:[UIFont boldSystemFontOfSize:15]];
    }
    pickerLabel.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.provinceArray.count;
    } else if (component == 1) {
        return self.cityArray.count;
    } else {
        return self.townArray.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [self.provinceArray objectAtIndex:row];
    } else if (component == 1) {
        return [self.cityArray objectAtIndex:row];
    } else {
        return [self.townArray objectAtIndex:row];
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return self.frame.size.width / 3;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        self.selectedArray = [self.pickerDic objectForKey:[self.provinceArray objectAtIndex:row]];
        if (self.selectedArray.count > 0) {
            self.cityArray = [[self.selectedArray objectAtIndex:0] allKeys];
        } else {
            self.cityArray = @[];
        }
        if (self.cityArray.count > 0) {
            self.townArray = [[self.selectedArray objectAtIndex:0] objectForKey:[self.cityArray objectAtIndex:0]];
        } else {
            self.townArray = @[];
        }
        [pickerView reloadComponent:1];
        [pickerView selectedRowInComponent:1];
        [pickerView reloadComponent:2];
        [pickerView selectedRowInComponent:2];
    }
    if (component == 1) {
        self.selectedArray = [self.pickerDic objectForKey:[self.provinceArray objectAtIndex:[self.pickView selectedRowInComponent:0]]];
        NSDictionary *dic = self.selectedArray.firstObject;
        NSString *stirng = self.cityArray[row];
        for (NSString *string in dic.allKeys) {
            if ([stirng isEqualToString:string]) {
                self.townArray = dic[string];
            }
        }
        [pickerView reloadComponent:2];
        [pickerView selectedRowInComponent:2];
    }
    if (component == 2) {
        [pickerView reloadComponent:2];
        [pickerView selectedRowInComponent:2];
    }
    [self updateAddress];
}

- (void)updateAddress {
    self.province = [self.provinceArray objectAtIndex:[self.pickView selectedRowInComponent:0]];
    self.city  = [self.cityArray objectAtIndex:[self.pickView selectedRowInComponent:1]];
    self.area  = [self.townArray objectAtIndex:[self.pickView selectedRowInComponent:2]];
}




@end
