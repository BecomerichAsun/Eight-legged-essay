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
    unsigned int count = 0;
    Ivar* ivarList = class_copyIvarList(self.class, &count);
    
    for (int i = 0; i < count; i++) {
        //        取出当前类Key值
        const char *ivarName = ivar_getName(ivarList[i]);
        NSLog(@"%s",ivarName);
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
