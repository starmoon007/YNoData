//
//  UIViewController+NOData.m
//  ICSON_Y
//
//  Created by young on 16/1/14.
//  Copyright © 2016年 young. All rights reserved.
//

#import "UIViewController+NOData.h"
#import <objc/runtime.h>
static void *noDataTipsKey      =   (void *)@"noDataTipsKey";
static void *noDataTipsViewKey  =   (void *)@"noDataTipsViewKey";
static void *noDataCallBackKey        =   (void *)@"noDataCallBackKey";


static UIView *tipsView = nil;

@implementation UIViewController (NOData)


- (BOOL)showNoDataTips{
    id show = objc_getAssociatedObject(self, noDataTipsKey);
    return [show boolValue];
}

- (void)setShowNoDataTips:(BOOL)showNoDataTips{
    objc_setAssociatedObject(self, noDataTipsKey, @(showNoDataTips), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (showNoDataTips){
        self.noDataTipsView.hidden = NO;
    }else{
        self.noDataTipsView.hidden = YES;
    }
}

- (void)tapAction:(UITapGestureRecognizer *)tap {
    if (self.noDataCallBack){
        self.noDataCallBack();
    }
}

#pragma mark - Property noDataTipsView
- (UIView *)noDataTipsView{
    UIView *noDataTipsView = objc_getAssociatedObject(self, noDataTipsViewKey);
    if ([noDataTipsView isKindOfClass:[UIView class]]){
        return noDataTipsView;
    }
    CGRect bounds = self.view.bounds;
    
    UILabel *noDataTipsLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, (bounds.size.height - 300) * 0.5, bounds.size.width, 300)];
    noDataTipsLabel.textAlignment = NSTextAlignmentCenter;
    noDataTipsLabel.text = @"NO Data";
    [self setNoDataTipsView:noDataTipsLabel];
    return noDataTipsLabel;
}

- (void)setNoDataTipsView:(UIView *)noDataTipsView{
    objc_setAssociatedObject(self, noDataTipsViewKey, noDataTipsView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    noDataTipsView.userInteractionEnabled = YES;
    noDataTipsView.hidden = YES;
    [noDataTipsView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)]];
    [self.view insertSubview:noDataTipsView atIndex:0];
}

#pragma mark - Property callBack
- (void (^)())noDataCallBack{
    return objc_getAssociatedObject(self, noDataCallBackKey);
}

- (void)setNoDataCallBack:(void (^)())noDataCallBack{
    objc_setAssociatedObject(self, noDataCallBackKey, noDataCallBack, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
