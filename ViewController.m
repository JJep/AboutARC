//
//  ViewController.m
//  AboutARC
//
//  Created by Jep Xia on 2018/3/27.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "ViewController.h"
#import "Test.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIImageView+UIImageView_async.h"
#import "UIImage+CircleImage.h"
#import "UICircleImage.h"
#import "UICircleImageView.h"
@interface ViewController ()

@end

@implementation ViewController {
    UIWindow *_uiWindow;
}

-(IBAction)createWindowButtonPressed:(id)sender {
    _uiWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _uiWindow.windowLevel = UIWindowLevelNormal;
    _uiWindow.backgroundColor = [UIColor orangeColor];
    _uiWindow.hidden = false;
    
    UIGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] init];
    [gesture addTarget:self action:@selector(hideWindow:)];
    [_uiWindow addGestureRecognizer:gesture];
}

- (void)hideWindow:(UIGestureRecognizer *)gesture {
    _uiWindow.hidden = true;
    _uiWindow = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage* image = [UIImage imageNamed:@"test1.jpeg"];
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, [UIScreen mainScreen].bounds.size.width - 40, 200)];
    [self.view addSubview:imageView];
    [imageView setImage:[image bezierCircleImage:imageView.bounds andCornerRadius:50]];
    
//    UIImageView* imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20 + 20 + 200, [UIScreen mainScreen].bounds.size.width - 40, 200)];
//    [self.view  addSubview:imageView1];
//    UICircleImage* circleImage = [UIImage imageNamed:@"test1.jpeg"];
//    [imageView1 setImage:[circleImage bezierCircleImage:imageView1.bounds andCornerRadius:50 data:UIImagePNGRepresentation(image)]];
    UICircleImageView* imageView1 = [[UICircleImageView alloc] initWithFrame:CGRectMake(20, 20 + 20 + 200, [UIScreen mainScreen].bounds.size.width - 40, 200)];
    [self.view addSubview:imageView1];
    [imageView1 setImage:[imageView1 bezierCircleImage:imageView1.bounds andCornerRadius:50 data:UIImagePNGRepresentation(image)]];
    

}

-(void)toAsync {
    NSLog(@"开始加载图片");
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        //可并行处理的程序
        NSMutableArray *dataAry = [NSMutableArray new];
        NSData *data1 = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.windows7en.com/uploads/140829/2009120309142160.jpg"]];
        NSData *data2 = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://tse3-mm.cn.bing.net/th?id=OIP.dhB7nSlblzW7T3sfNeeTLAHaEK&p=0&o=5&pid=1.1"]];
        NSData *data3 = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://tse2-mm.cn.bing.net/th?id=OIP.C6uUnA27enUzMpNmgyQTdwHaEK&pid=15.1"]];
        NSData *data4 = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://pic1.win4000.com/wallpaper/e/508518a4ae8e1.jpg"]];
        [dataAry addObject:data1];
        [dataAry addObject:data2];
        [dataAry addObject:data3];
        [dataAry addObject:data4];
        //在main dispatch queue 中执行block
        dispatch_async(dispatch_get_main_queue(), ^{
            //只能在主线程中执行的处理
            CGFloat width = self.view.frame.size.width - 40;
            CGFloat height = (self.view.frame.size.height - 5 * 20) /4;
            for (int i = 0; i < 4; i++) {
                UIImageView *image = [UIImageView new];
                [image setFrame:CGRectMake(20, 20*(i+1) + height*i, width, height)];
                [image setImage:[UIImage imageWithData:dataAry[i]]];
                [self.view addSubview:image];
                
            }
            
        });
    });
    
    NSLog(@"图片加载完毕");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
