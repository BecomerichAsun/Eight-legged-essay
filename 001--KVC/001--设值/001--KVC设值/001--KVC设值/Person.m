//
//  Person.m
//  001--KVC设值
//
//  Created by Asun on 2021/6/25.
//

#import "Person.h"

@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        _name = @"_name";
        _isName = @"_isName";
        name = @"name";
        isName = @"isName";
    }
    return self;
}

/**
 两个Set方法
 1.setKey
 2.setIsKey
 */
- (void)setName:(NSString* )name {
    NSLog(@"调用Setter方法  - - %@",name);
}

- (void)setIsName:(NSString* )isName {
    NSLog(@"调用Setter方法  - - %@", isName);
}

/**
 当没有写Set方法时，且accessInstanceVariablesDirectly返回NO时
 且kvc将基本数据类型设置为NIl，会调用此方法
 */
- (void)setNilValueForKey:(NSString *)key {
    NSLog(@"%@",key);
}

/**
 当没有写Set方法时，且accessInstanceVariablesDirectly返回YES时
 没有找到对应Key值会调用此方法
 */
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"%@ -- %@",key,value);
}

/// 如果没有撰写get/set方法 通过此方法的返回值，如果返回YES则继续查找当前属性，否则崩溃。默认为YES；
+ (BOOL)accessInstanceVariablesDirectly {
    // 默认为YES - 测试改为NO
    return NO;
}

- (void)desc {
    NSString* str = [NSString stringWithFormat:@"\n_name: %@\n_isName:  %@\nname: %@\nisName: %@", _name,_isName,name,isName];
    NSLog(@"%@",str);
}
@end
