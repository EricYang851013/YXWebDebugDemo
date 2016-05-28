//
//  YXWebDebugMessage.m
//  YXWebDebugDemo
//
//  Created by yangxu on 16/5/25.
//  Copyright © 2016年 yangxu. All rights reserved.
//

#import "YXWebDebugMessage.h"

@implementation YXWebDebugMessage
+ (YXWebDebugMessage *)messageWithInfo:(NSString *)info
{
    return [YXWebDebugMessage messageWithInfo:info source:YXWebDebugMessageSourceNative];
}
+ (YXWebDebugMessage *)messageWithInfo:(NSString *)info source:(YXWebDebugMessageSource)source
{
    return [YXWebDebugMessage messageWithInfo:info source:source state:YXWebDebugMessageStateLog];
}
+ (YXWebDebugMessage *)messageWithInfo:(NSString *)info source:(YXWebDebugMessageSource)source state:(YXWebDebugMessageState)state
{
    YXWebDebugMessage *message = [[YXWebDebugMessage alloc] init];
    message.message = info;
    message.messageState = state;
    message.messageSource = source;
    return message;
}
@end
