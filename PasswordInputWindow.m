//
//  PasswordInputWindow.m
//  AboutARC
//
//  Created by Jep Xia on 2018/3/31.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PasswordInputWindow.h"

@implementation PasswordInputWindow {
    UITextField *_textField;
}

+ (PasswordInputWindow *)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    });
    return sharedInstance;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 200, 20)];
        label.text = @"请输入密码";
        [self addSubview:label];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 80, 200, 20)];
        textField.backgroundColor = [UIColor whiteColor];
        textField.secureTextEntry = true;
        [self addSubview:textField];
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 110, 200, 44)];
        [button setBackgroundColor:[UIColor blueColor]];
        button.titleLabel.textColor = [UIColor blackColor];
        [button setTitle:@"确定" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(completeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        self.backgroundColor = [UIColor cyanColor];
        _textField = textField;
    }
    
    return self;
}

- (void)show {
    [self makeKeyWindow];
    self.hidden = false;
}

-(void)completeButtonPressed:(id)sender {
    if ([_textField.text isEqualToString:@"abcd"]) {
        [_textField resignFirstResponder];
        [self resignKeyWindow];
        self.hidden = true;
    } else {
        [self showErrorAlertView];
    }
}

-(void)showErrorAlertView
{
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"密码错误" message:@"ok" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
//    [alertView show];
//    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
