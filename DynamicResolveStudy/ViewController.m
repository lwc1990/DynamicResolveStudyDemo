//
//  ViewController.m
//  DynamicResolveStudy
//
//  Created by cheyipai on 2018/6/28.
//  Copyright © 2018年 cheyipai. All rights reserved.
//

#import "ViewController.h"
#import "MyClass.h"
@interface ViewController ()
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self testEntrance];
}
//测试方法入口
-(void)testEntrance{
    //调用一个名为unknownClassMethod的未知的类方法
    [MyClass performSelector:@selector(unknownClassMethod) withObject:nil];
    //调用一个名为unknownInstanceMethod的未知的实例化方法
    [[MyClass new] performSelector:@selector(unknownInstanceMethod) withObject:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
