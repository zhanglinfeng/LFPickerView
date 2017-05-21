//
//  ViewController.m
//  LFPickerView
//
//  Created by 张林峰 on 17/1/11.
//  Copyright © 2017年 张林峰. All rights reserved.
//

#import "ViewController.h"
#import "LFPickerView.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *tfInput;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addTapGesture];
    
    //搭配TextField使用的单列picker
    LFPickerView *picker = [[LFPickerView alloc] initWithComponents:1 dataSource:@[@"保密", @"男", @"女"] height:216];
    [picker.pickerView selectRow:0 inComponent:0 animated:YES];
    picker.receiverField = self.tfInput;//搭配TextField使用可自动填充数据，不用监听回调
    picker.cancelBlock = ^{
        self.tfInput.text = @"保密";
    };
    self.tfInput.inputView = picker;
    
    //更多block回调请看LFPickerView.h
}

- (void)addTapGesture {
    UITapGestureRecognizer *tapGestureRecognizer =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedController:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    tapGestureRecognizer.cancelsTouchesInView = NO; //为yes只响应优先级最高的事件，Button高于手势，textfield高于手势，textview高于手势，手势高于tableview。为no同时都响应，默认为yes
}

- (void)tappedController:(UIGestureRecognizer *)gesture {
    [self.view endEditing:YES];
}

//多列picker
- (IBAction)showMultiseriatePicker:(id)sender {
    UIButton *button = (UIButton *)sender;
    
    //多列的数据源是大数组套多个小数组
    NSArray *array = @[@[@"上衣", @"裤子"], @[@"红色", @"蓝色", @"绿色"]];
    LFPickerView *picker = [[LFPickerView alloc] initWithComponents:2 dataSource:array height:216];
    [picker.pickerView selectRow:1 inComponent:0 animated:YES];
    [picker.pickerView selectRow:1 inComponent:1 animated:YES];
    picker.strAppending = @"-";//连接符
    picker.valueComplete = ^(LFPickerView * picker, NSArray *value, NSString *strResult) {
        [button setTitle:strResult forState:UIControlStateNormal];
    };
    picker.cancelBlock = ^{
        [button setTitle:@"多列picker" forState:UIControlStateNormal];
    };
    [picker show];
}

//时间picker
- (IBAction)showDatePicker:(id)sender {
    
    UIButton *button = (UIButton *)sender;
    
    LFPickerView *picker = [[LFPickerView alloc] initWithFormat:@"yyyy-MM-dd" height:216];
    picker.datePicker.datePickerMode = UIDatePickerModeDate;
    picker.dateChanged = ^(LFPickerView * picker, NSString *strDate) {
        [button setTitle:strDate forState:UIControlStateNormal];
    };
    picker.cancelBlock = ^{
        self.tfInput.text = @"日期picker";
    };
    [picker show];
    //更多block回调请看LFPickerView.h
}

@end
