//
//  Person.m
//  003--动态添加方法
//
//  Created by Asun on 2021/6/29.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    class_addMethod(self, sel, eat, "v");
    return [super resolveInstanceMethod:sel];
}

void eat(id self,SEL asun,NSString* food) {
    NSLog(@"吃%@",food);
}

@end
