//
//  LXDScanView.h
//  LXDScanQRCode
//
//  Created by 林欣达 on 15/10/14.
//  Copyright © 2015年 cnpayany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BorderView.h"
#import "LBXScanNetAnimation.h"
#import "LBXScanLineAnimation.h"




/*! 扫描成功发送通知（在代理实现的情况下不发送）*/
extern NSString * const LXDSuccessScanQRCodeNotification;
/*! 通知传递数据中存储二维码信息的关键字*/
extern NSString * const LXDScanQRCodeMessageKey;

@class LXDScanView;
@protocol LXDScanViewDelegate <NSObject>

- (void)scanView: (LXDScanView *)scanView codeInfo: (NSString *)codeInfo;

@end

/**
 扫码区域动画效果
 */

typedef NS_ENUM(NSInteger,LBXScanAnimationType){
    LBXScanAnimationLine = 0,   //线条上下移动
    LBXScanAnimationNet,//网格
    LBXScanAnimationNone,//无

};
/*!
 *  @class
 *
 *  @abstract
 *  二维码/条形码扫描视图
 */
@interface LXDScanView : UIView


@property (assign, nonatomic) LBXScanAnimationType scanType;
//线条扫码动画封装
@property (nonatomic,strong)LBXScanLineAnimation *scanLineAnimation;
//网格扫码动画封装
@property (nonatomic,strong)LBXScanNetAnimation *scanNetAnimation;
/*! 扫描回调代理人*/
@property (nonatomic, weak) id<LXDScanViewDelegate> delegate;

/*! 创建扫描视图，建议使用LXDScanCodeController*/
+ (instancetype)scanViewShowInController: (UIViewController *)controller;

/*! 开始扫描*/
- (void)start;
/*! 结束扫描*/
- (void)stop;
/**
 *  开始扫描动画
 */
- (void)startScanAnimationWithAniamtionType:(LBXScanAnimationType *)animationType;

/**
 *  结束扫描动画
 */
- (void)stopScanAnimation;

@end
