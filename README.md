# LXDScanQRCode
对原生二维码扫描功能进行封装，轻松使用二维码扫描功能

# 相关类
LXDScanCodeController  扫描控制器，跳转后进入扫描，扫描成功后自动返回<br />
LXDScanView            扫描视图，扫描成功后自动消失<br />

# 扫描成功回调
提供了代理和通知两种回调方式，通知只在代理人未实现回调方法的情况下发送通知<br />
LXDScanCodeController 通过LXDScanCodeControllerDelegate代理回调<br />
LXDScanView           通过代理LXDScanViewDelegate回调、通过发送LXDSuccessScanQRCodeNotification通知回调<br />

***代理方式 - 通过LXDScanCodeControllerDelegate代理回调***<br />
`- (void)scanCodeController:(LXDScanCodeController *)scanCodeController codeInfo:(NSString *)codeInfo {`<br />
`    NSURL * url = [NSURL URLWithString: codeInfo];`<br />
`    if ([[UIApplication sharedApplication] canOpenURL: url]) {`<br />
`        [[UIApplication sharedApplication] openURL: url];`<br />
`    } else {`<br />
`        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"警告" message: [NSString stringWithFormat: @"%@:%@", @"无法解析的二维码", codeInfo] delegate: nil cancelButtonTitle: @"确定" otherButtonTitles: nil];`<br />
`        [alertView show];`<br />
`    }`<br />
`}`<br />

***代理方式 - 通过代理LXDScanViewDelegate回调***<br />
`- (void)scanView:(LXDScanView *)scanView codeInfo:(NSString *)codeInfo {`<br />
`    NSURL * url = [NSURL URLWithString: codeInfo];`<br />
`    if ([[UIApplication sharedApplication] canOpenURL: url]) {`<br />
`        [[UIApplication sharedApplication] openURL: url];`<br />
`    } else {`<br />
`        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"警告" message: [NSString stringWithFormat: @"%@:%@", @"无法解析的二维码", codeInfo] delegate: nil cancelButtonTitle: @"确定" otherButtonTitles: nil];`<br />
`        [alertView show];`<br />
`    }`<br />
`}`<br />

***通知方式***<br />
`- (void)receiveScanQRCodeNotification: (NSNotification *)notification {`<br />
`    NSString * codeInfo = [notification.userInfo valueForKey: LXDScanQRCodeMessageKey];`<br />
`    NSURL * url = [NSURL URLWithString: codeInfo];`<br />
`    if ([[UIApplication sharedApplication] canOpenURL: url]) {`<br />
`        [[UIApplication sharedApplication] openURL: url];`<br />
`    } else {`<br />
`        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle: @"警告" message: [NSString stringWithFormat: @"%@:%@", @"无法解析的二维码", codeInfo] delegate: nil cancelButtonTitle: @"确定" otherButtonTitles: nil];`<br />
`        [alertView show];`<br />
`    }`<br />
`}`<br />

# 控件使用
***控制器跳转***<br />
`LXDScanCodeController * scanCodeController = [LXDScanCodeController scanCodeController];`<br />
`    scanCodeController.scanDelegate = self;`<br />
`    [self.navigationController pushViewController: scanCodeController animated: YES];`<br />

***扫描视图使用***<br />
`LXDScanView * scanView = [LXDScanView scanViewShowInController: self];`<br />
`    scanView.delegate = self;`<br />
`    [self.view addSubview: scanView];`<br />
`    [scanView show];`<br />
