# LXDScanQRCode
对原生二维码扫描功能进行封装，轻松使用二维码扫描功能

# 相关类
LXDScanCodeController  扫描控制器，跳转后进入扫描，扫描成功后自动返回
LXDScanView            扫描视图，扫描成功后自动消失

# 扫描成功回调
提供了代理和通知两种回调方式，通知只在代理人未实现回调方法的情况下发送通知
LXDScanCodeController 通过LXDScanCodeControllerDelegate代理回调
LXDScanView           通过代理LXDScanViewDelegate回调、通过发送LXDSuccessScanQRCodeNotification通知回调

***代理方式 - 通过LXDScanCodeControllerDelegate代理回调***
```- (void)scanCodeController:(LXDScanCodeController *)scanCodeController codeInfo:(NSString *)codeInfo
{
    NSURL * url = [NSURL URLWithString: codeInfo];
    if ([[UIApplication sharedApplication] canOpenURL: url]) {
        [[UIApplication sharedApplication] openURL: url];
    } else {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"警告" message: [NSString stringWithFormat: @"%@:%@", @"无法解析的二维码", codeInfo] delegate: nil cancelButtonTitle: @"确定" otherButtonTitles: nil];
        [alertView show];
    }
}```

***代理方式 - 通过代理LXDScanViewDelegate回调***
```- (void)scanView:(LXDScanView *)scanView codeInfo:(NSString *)codeInfo
{
    NSURL * url = [NSURL URLWithString: codeInfo];
    if ([[UIApplication sharedApplication] canOpenURL: url]) {
        [[UIApplication sharedApplication] openURL: url];
    } else {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"警告" message: [NSString stringWithFormat: @"%@:%@", @"无法解析的二维码", codeInfo] delegate: nil cancelButtonTitle: @"确定" otherButtonTitles: nil];
        [alertView show];
    }
}```

***通知方式***
```- (void)receiveScanQRCodeNotification: (NSNotification *)notification
{
    NSString * codeInfo = [notification.userInfo valueForKey: LXDScanQRCodeMessageKey];
    NSURL * url = [NSURL URLWithString: codeInfo];
    if ([[UIApplication sharedApplication] canOpenURL: url]) {
        [[UIApplication sharedApplication] openURL: url];
    } else {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"警告" message: [NSString stringWithFormat: @"%@:%@", @"无法解析的二维码", codeInfo] delegate: nil cancelButtonTitle: @"确定" otherButtonTitles: nil];
        [alertView show];
    }
}```


# 控件使用
***控制器跳转***
```LXDScanCodeController * scanCodeController = [LXDScanCodeController scanCodeController];
    scanCodeController.scanDelegate = self;
    [self.navigationController pushViewController: scanCodeController animated: YES];```

***扫描视图使用***
```LXDScanView * scanView = [LXDScanView scanViewShowInController: self];
    scanView.delegate = self;
    [self.view addSubview: scanView];
    [scanView show];
```
