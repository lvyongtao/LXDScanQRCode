//
//  ViewController.m
//  LXDScanQRCode
//
//  Created by 林欣达 on 15/10/13.
//  Copyright © 2015年 cnpayany. All rights reserved.
//

#import "ViewController.h"
#import "LXDScanView.h"
#import "LXDScanCodeController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()<LXDScanViewDelegate, LXDScanCodeControllerDelegate>

@property (nonatomic, strong) LXDScanView * scanView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear: animated];
    [self.scanView stop];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    [self.scanView stop];
}


#pragma mark - event
- (IBAction)scan:(id)sender
{
    [self.view addSubview: self.scanView];
    [self.scanView start];
}

- (IBAction)jumpToScan:(id)sender
{
    [self.scanView removeFromSuperview];
    LXDScanCodeController * scanCodeController = [LXDScanCodeController scanCodeController];
    scanCodeController.scanDelegate = self;
    [self.navigationController pushViewController: scanCodeController animated: YES];
}


#pragma mark - getter
/**
 *  懒加载扫描view
 */
- (LXDScanView *)scanView
{
    if (!_scanView) {
        _scanView = [LXDScanView scanViewShowInController: self];
    }
    return _scanView;
}


#pragma mark - LXDScanViewDelegate
/**
 *  返回扫描结果
 */
- (void)scanView:(LXDScanView *)scanView codeInfo:(NSString *)codeInfo
{
    NSURL * url = [NSURL URLWithString: codeInfo];
    if ([[UIApplication sharedApplication] canOpenURL: url]) {
        [[UIApplication sharedApplication] openURL: url];
    } else {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"警告" message: [NSString stringWithFormat: @"%@:%@", @"无法解析的二维码", codeInfo] delegate: nil cancelButtonTitle: @"确定" otherButtonTitles: nil];
        [alertView show];
    }
}


#pragma mark - LXDScanCodeControllerDelegate
- (void)scanCodeController:(LXDScanCodeController *)scanCodeController codeInfo:(NSString *)codeInfo
{
    NSURL * url = [NSURL URLWithString: codeInfo];
    if ([[UIApplication sharedApplication] canOpenURL: url]) {
        [[UIApplication sharedApplication] openURL: url];
    } else {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"警告" message: [NSString stringWithFormat: @"%@:%@", @"无法解析的二维码", codeInfo] delegate: nil cancelButtonTitle: @"确定" otherButtonTitles: nil];
        [alertView show];
    }
}


@end
