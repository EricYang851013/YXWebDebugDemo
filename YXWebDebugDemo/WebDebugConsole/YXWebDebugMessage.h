//
//  YXWebDebugMessage.h
//  YXWebDebugDemo
//
//  Created by yangxu on 16/5/25.
//  Copyright © 2016年 yangxu. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum : NSUInteger {
    YXWebDebugMessageSourceNative,
    YXWebDebugMessageSourceJS,
    YXWebDebugMessageSourceUserCommand,
    YXWebDebugMessageSourceUserCommandInput,
} YXWebDebugMessageSource;

typedef enum : NSUInteger {
    YXWebDebugMessageStateLog,
    YXWebDebugMessageStateWarning,
    YXWebDebugMessageStateError,
    YXWebDebugMessageStateSucess,
} YXWebDebugMessageState;

@interface YXWebDebugMessage : NSObject
@property (nonatomic)NSString *message;
@property (nonatomic,unsafe_unretained)YXWebDebugMessageSource messageSource;
@property (nonatomic,unsafe_unretained)YXWebDebugMessageState  messageState;

+ (YXWebDebugMessage *)messageWithInfo:(NSString *)info;
+ (YXWebDebugMessage *)messageWithInfo:(NSString *)info source:(YXWebDebugMessageSource)source;
+ (YXWebDebugMessage *)messageWithInfo:(NSString *)info source:(YXWebDebugMessageSource)source state:(YXWebDebugMessageState)state;
@end
