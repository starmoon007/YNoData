//
//  ViewController.m
//  YNoData
//
//  Created by young on 16/1/14.
//  Copyright © 2016年 young. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+NOData.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self setNoDataCallBack:^{
        NSLog(@"这个是点击没有数据View的回调方法");
    }];
    
    self.showNoDataTips = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
