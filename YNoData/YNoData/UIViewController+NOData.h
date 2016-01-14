//
//  UIViewController+NOData.h
//  ICSON_Y
//
//  Created by young on 16/1/14.
//  Copyright © 2016年 young. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NOData)

/**
 *  显示 空数据 提示
 */
@property (nonatomic, assign) BOOL showNoDataTips;

/**
 *  空数据提示View
 */
@property (nonatomic, strong) UIView *noDataTipsView;

/**
 *  点击 空数据提示View 回调方法
 */
@property (nonatomic, copy) void (^noDataCallBack)();

@end
