//
//  Person.m
//  001--自定义对象序列化
//
//  Created by Asun on 2021/6/29.
//

#import "Person.h"
#import <objc/runtime.h>

@interface Person()

@property(nonatomic,copy) NSString* englighName;

@end

@implementation Person



- (void)encodeWithCoder:(NSCoder *)coder {
    /// 传递Int指针
    /// c语言中 基本数据类型指针 如果作为参数传递 一般函数内部 是为了修改基本数据类型变量的值
    unsigned int count = 0;
    /// 调用赋值类列表 此时Count指针会发生变化
    Ivar* ivarList = class_copyIvarList(self.class, &count);
    
    for (int i = 0; i < count; i++) {
        // 取出当前类Key值
        const char *ivarName = ivar_getName(ivarList[i]);
        NSString* key = [NSString stringWithUTF8String:ivarName];
        id value = [self valueForKey:key];
        [coder encodeObject:value forKey: key];
    }
    
    free(ivarList);
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    
    if (self = [super init]) {
        //        _name = [coder decodeObjectForKey:@"name"];
        unsigned int count = 0;
        Ivar* ivarList = class_copyIvarList(self.class, &count);
        
        for (int i = 0; i < count; i++) {
            //        取出当前类Key值
            const char *ivarName = ivar_getName(ivarList[i]);
            NSString* key = [NSString stringWithUTF8String:ivarName];
            id value = [coder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        free(ivarList);
        
    }
    return self;
}





@end
