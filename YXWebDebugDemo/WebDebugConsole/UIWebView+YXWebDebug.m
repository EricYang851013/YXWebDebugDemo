//
//  UIWebView+YXWebDebug.m
//  YXWebDebugDemo
//
//  Created by yangxu on 16/5/25.
//  Copyright © 2016年 yangxu. All rights reserved.
//

#import "UIWebView+YXWebDebug.h"
#import <objc/runtime.h>
#import "YXWebDebugManager.h"

static char YXWebDebugOriginDelegateKey;
static char YXWebDebugManagerKey;


@interface UIWebView ()<UIWebViewDelegate>
@property (nonatomic,weak)id<UIWebViewDelegate> webViewOriginDelegate;
@property (nonatomic)YXWebDebugManager *debugManager;
@end

@implementation UIWebView (YXWebDebug)
- (void)enableWebDebug
{
    self.webViewOriginDelegate = self.delegate;
    self.delegate = self;
    self.debugManager = [[YXWebDebugManager alloc] init];
    
}

- (void)disableWebDebug
{
    self.delegate = self.webViewOriginDelegate;
    self.debugManager = nil;
}

#pragma mark - Setter And Getter Methods

- (void)setWebViewOriginDelegate:(id<UIWebViewDelegate>)webViewOriginDelegate
{
    objc_setAssociatedObject(self,&YXWebDebugOriginDelegateKey, webViewOriginDelegate,OBJC_ASSOCIATION_ASSIGN );

}

- (id<UIWebViewDelegate>)webViewOriginDelegate
{
    return objc_getAssociatedObject(self, &YXWebDebugOriginDelegateKey);
}

- (void)setDebugManager:(YXWebDebugManager *)debugManager
{
    objc_setAssociatedObject(self,&YXWebDebugManagerKey, debugManager,OBJC_ASSOCIATION_RETAIN_NONATOMIC );

}

- (YXWebDebugManager *)debugManager
{
    return objc_getAssociatedObject(self, &YXWebDebugManagerKey);
}

#pragma mark - UIWebViewDelegate Delegate Methods
- (BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType
{
    
    //TODO:yangxu  如何区分第一次请求和后续请求
    
    
    if ([self.webViewOriginDelegate respondsToSelector:@selector(webView:shouldStartLoadWithRequest:navigationType:)]) {
        return [self.webViewOriginDelegate webView:webView shouldStartLoadWithRequest:request navigationType:navigationType];
    }
    else
    {
        return YES;
    }
}


- (void)webViewDidStartLoad:(UIWebView *)webView
{
    if ([self.webViewOriginDelegate respondsToSelector:@selector(webViewDidStartLoad:)]) {
        [self.webViewOriginDelegate webViewDidStartLoad:webView];
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    if ([self.webViewOriginDelegate respondsToSelector:@selector(webViewDidFinishLoad:)]) {
        [self.webViewOriginDelegate webViewDidFinishLoad:webView];
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    if ([self.webViewOriginDelegate respondsToSelector:@selector(webView:didFailLoadWithError:)]) {
        [self.webViewOriginDelegate webView:webView didFailLoadWithError:error];
    }
}
@end
