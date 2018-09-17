//
//  ViewController.m
//  MVCSimple2
//
//  Created by mac on 2018/9/17.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    UILabel *label;
    UIButton *button;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //创建视图方法
    
    [self setUI];
    
    //创建通知中心对象
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    //注册、接收通知
    
    [center addObserver:self selector:@selector(chanegeLabelText:)name:@"notification"object:nil];
}

- (void)setUI{
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(100, 200, 200, 30)];
    
    label.backgroundColor = [UIColor yellowColor];
    
    label.text =@"没有接收到通知";
    
    [self.view addSubview:label];
    
    
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame =CGRectMake(100, 300, 200, 30);
    
    [button setTitle:@"发送通知"forState:UIControlStateNormal];
    
    [button setBackgroundColor:[UIColor blueColor]];
    
    [button addTarget:self action:@selector(post)forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
}



//按钮点击方法

- (void)post{
    
    //初始化一个通知对象，名称是 notification  没有指定对象  穿的值是一个字典@{@"key":@"an object"}
    
//    NSNotification *notification = [NSNotification notificationWithName:@"notification"object:niluserInfo:@{@"key":@"接收到了通知"}];
    NSNotification *notification = [NSNotification notificationWithName:@"notification" object:nil userInfo:@{@"key":@"接收到了通知"}];

    
    
    
    [[NSNotificationCenter defaultCenter]postNotification:notification];
    
}



//接收通知后调用的方法

- (void)chanegeLabelText:(NSNotification *)noti{
    
    
    
    //这个方法的参数就是发送通知postNotification:方法的参数发送过来额通知。当要使用传递的userInfo的时候，就要使用noti解析出userInfo中需要的字段
    
    label.text = [noti.userInfo objectForKey:@"key"];
    
}





- (void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
    
    //在页面消失的回调方法中移除通知。
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"notification"object:nil];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
