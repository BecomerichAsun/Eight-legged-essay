//
//  NSURL+AsunUrl.m
//  002-Demo
//
//  Created by Asun on 2021/6/29.
//

#import "NSURL+AsunUrl.h"
#import <objc/runtime.h>

@implementation NSURL (AsunUrl)
/**
 Load调用时机
 1.在Main函数之前调用
 2.类优先于分类调用+load方法
 3.子类调用+load方法时，要先调用父类的+load方法
 4.不同的类 按照编译先后顺序调用 +load方法
 5.分类按照编译顺序调用 +load方法
 
 +load方法是系统根据方法地址直接调用
 并不是objc_msgSend函数调用（isa，superClass);
 这就决定了如果子类没有实现+load方法，那么当它被加载时runtime是不会调用父类的+load方法的
 除非父类也实现了+load方法
 */
+(void)load {
    Method urlWithString = class_getClassMethod(self, @selector(URLWithString:));
    
    Method customUrlWithString = class_getClassMethod(self, @selector(Asun_URLWithString:));
    
    method_exchangeImplementations(urlWithString, customUrlWithString);
}


+ (instancetype)Asun_URLWithString:(NSString *)URLString {
    
    NSURL* url = [NSURL Asun_URLWithString:URLString];
    
    if (url == nil) {
        NSLog(@"网址为空");
    };
    return url;
}
@end
