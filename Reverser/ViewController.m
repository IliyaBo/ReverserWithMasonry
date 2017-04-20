//
//  ViewController.m
//  Reverser
//
//  Created by Alexey Ulenkov on 25.02.17.
//  Copyright © 2017 Alexey Ulenkov. All rights reserved.
//

#import "ViewController.h"
#import "SBDReverser.h"
#import "SBDUpperCase.h"
#import "Masonry.h"

const NSString *SBDTextFieldDefault = @"Enter string";
const NSString *SBDGreetingMessage = @"Hello";

@interface ViewController ()<UITextFieldDelegate>

@property(nonatomic, strong) UILabel *greetingLabel;
@property(nonatomic, strong) UITextField *sourceStringField;
@property(nonatomic, weak) IBOutlet UILabel *resultLabel;
@property(nonatomic, strong) IBOutlet UIButton *reverseButton;
@property(nonatomic, weak) IBOutlet UIButton *uppercaseButton;

@end

@implementation ViewController

#pragma mark - ViewController lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.reverseButton.layer.cornerRadius = CGRectGetWidth(self.reverseButton.frame)/2;
    self.uppercaseButton.layer.cornerRadius = CGRectGetWidth(self.reverseButton.frame)/2;
    
    self.sourceStringField.text = [SBDTextFieldDefault copy];
    self.greetingLabel = [UILabel new];
    self.greetingLabel.text = (NSString *)SBDGreetingMessage;
    self.greetingLabel.textColor = [UIColor whiteColor];

    
    [self.view addSubview:self.greetingLabel];
    
    
    [self.greetingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).with.offset(40);
        make.height.equalTo(@20);
        make.width.lessThanOrEqualTo(@40);
        make.bottom.equalTo(self.resultLabel.mas_top);
    }];
    
    
    self.sourceStringField = [[UITextField alloc] initWithFrame:CGRectMake(45, 30, 200, 40)];
    self.sourceStringField.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    self.sourceStringField.font = [UIFont fontWithName:@"Helvetica-Bold" size:25];
    self.sourceStringField.backgroundColor=[UIColor whiteColor];
    self.sourceStringField.text=@"";
    
    [self.view addSubview:self.sourceStringField];

    
    [self.sourceStringField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY).with.offset(-40);
        //make.top.equalTo(self.view.mas_top).with.offset(86);
        make.height.equalTo(@40);
        make.width.equalTo(@180);
//        make.bottom.equalTo(self.resultLabel.mas_top);
    }];
    
    self.reverseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.reverseButton addTarget:self
               action:@selector(reverse:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.reverseButton setTitle:@"Reverse" forState:UIControlStateNormal];
    self.reverseButton.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    self.reverseButton.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:self.reverseButton];
    
    [self.reverseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY).with.offset(40);
//        make.top.equalTo(self.view.mas_top).with.offset(86);
        make.height.equalTo(@90);
        make.width.equalTo(@90);
//        make.bottom.equalTo(self.resultLabel.mas_top);
    }];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Actions

- (IBAction)reverse:(id)sender {
    self.resultLabel.text = [SBDReverser reverseString:self.sourceStringField.text];
}

- (IBAction)upperCase:(id)sender {
    self.resultLabel.text = [SBDUpperCase upperCase:self.sourceStringField.text];
}

#pragma mark - User interations

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    
    if ([self.sourceStringField isFirstResponder]
        && [touch view]!=self.sourceStringField) {
        [self.sourceStringField resignFirstResponder];
    }
    
    [super touchesBegan:touches withEvent:event];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([self.sourceStringField isFirstResponder]) {
        [self.sourceStringField resignFirstResponder];
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField.text.length == 0) {
        self.resultLabel.text = @"";
        textField.text = [SBDTextFieldDefault copy]; // Перенос строки ниже условия сломает логику (можно использовать в кейсе)
    }
}

@end
