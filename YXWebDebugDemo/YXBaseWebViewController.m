//
//  YXBaseWebViewController.m
//  YXWebDebugDemo
//
//  Created by yangxu on 16/5/25.
//  Copyright © 2016年 yangxu. All rights reserved.
//

#import "YXBaseWebViewController.h"
#import "WebViewJavascriptBridge.h"
@interface YXBaseWebViewController ()<UIWebViewDelegate>
@property(nonatomic) UIWebView *webView;
@property(nonatomic) WebViewJavascriptBridge *jsBridge;
@end
@implementation YXBaseWebViewController


#pragma mark - Setter And Getter Methods
- (UIWebView *)webView {
    if (_webView == nil) {
        _webView = [[UIWebView alloc] init];
        _webView.allowsInlineMediaPlayback = YES;
        _webView.scalesPageToFit = YES;
        _webView.dataDetectorTypes = UIDataDetectorTypePhoneNumber;
        _webView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _webView;
}

- (WebViewJavascriptBridge *)jsBridge
{
    if (_jsBridge == nil) {
        _jsBridge = [WebViewJavascriptBridge bridgeForWebView:self.webView];
        [_jsBridge setWebViewDelegate:self];
    }
    return _jsBridge;
}


#pragma mark - UIWebView Delegate Methods
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
}
@end
