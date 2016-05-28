//
//  YXWebDebugManager.h
//  YXWebDebugDemo
//
//  Created by yangxu on 16/5/25.
//  Copyright © 2016年 yangxu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class YXWebDebugMessage;
@interface YXWebDebugManager : NSObject
@property (nonatomic, weak)UIWebView *mainWebView;
- (void)addMessage:(YXWebDebugMessage *)message;
- (NSArray *)messages;
- (void)performCommand:(NSString *)command;
@end
