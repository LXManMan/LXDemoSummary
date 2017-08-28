//
//  LXTimeSelectController.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/8/24.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXTimeSelectController.h"
#import "DateTimePickerView.h"
@interface LXTimeSelectController ()<DateTimePickerViewDelegate,UITextFieldDelegate>
@property (nonatomic, strong) DateTimePickerView *datePickerViewDate;

@property (nonatomic, strong) DateTimePickerView *datePickerViewTime;
@property(nonatomic,strong)FTTextField *editTextField;
@property(nonatomic,strong)FTTextField *textField1;

@property(nonatomic,strong)FTTextField *textField2;

@end

@implementation LXTimeSelectController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.navigationItem.title = @"时间选择器";

    
    FTTextField *textField1 =[[FTTextField alloc]initWithFrame:CGRectMake(50, 100, Device_Width -100, 40)];
    textField1.borderStyle = UITextBorderStyleBezel;
    textField1.placeholder = @"请选择";
    textField1.layer.borderColor = LXMainColor.CGColor;
    textField1.delegate = self;
    
    [self.view addSubview:textField1];
    
    FTTextField *textField2 =[[FTTextField alloc]initWithFrame:CGRectMake(50, 160, Device_Width -100, 40)];
    textField2.delegate = self;
    textField2.layer.borderColor = LXMainColor.CGColor;

    textField2.borderStyle = UITextBorderStyleBezel;
    textField2.placeholder = @"请选择";
    [self.view addSubview:textField2];
    
    self.textField1 = textField1;
    self.textField2 = textField2;
    
    [self.view addSubview:self.datePickerViewDate];
    [self.view addSubview:self.datePickerViewTime];
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
   
    
    if (textField == self.textField1) {
        
        [self.view endEditing:YES];
        
        [self.datePickerViewDate showDateTimePickerView];
        [self.datePickerViewTime hideDateTimePickerView];
        
        
        self.editTextField = (FTTextField *)textField;
        return NO;
    }
    
    if (textField == self.textField2) {
        
        [self.datePickerViewTime showDateTimePickerView];
        [self.datePickerViewDate hideDateTimePickerView];
        [self.view endEditing:YES];
        
        self.editTextField = (FTTextField *)textField;
        return NO;
    }
    
    
    return YES;
}
- (void)didClickFinishDateTimePickerView:(NSString *)date{
    self.editTextField.text = date;
}
-(DateTimePickerView *)datePickerViewDate{
    if (!_datePickerViewDate) {
        _datePickerViewDate = [[DateTimePickerView alloc] init];
        _datePickerViewDate.pickerViewMode =  DatePickerViewDateMode;
        _datePickerViewDate.delegate= self;
        [_datePickerViewDate hideDateTimePickerView];
    }
    return _datePickerViewDate;
}
-(DateTimePickerView *)datePickerViewTime{
    if (!_datePickerViewTime) {
        _datePickerViewTime = [[DateTimePickerView alloc] init];
        _datePickerViewTime.pickerViewMode =  DatePickerViewTimeMode;
        _datePickerViewTime.delegate= self;
        [_datePickerViewTime hideDateTimePickerView];
        
    }
    return _datePickerViewTime;
}


@end
