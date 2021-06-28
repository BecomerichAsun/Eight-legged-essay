//
//  Person.m
//  002--KVC取值
//
//  Created by Asun on 2021/6/25.
//

#import "Person.h"

@implementation Person


- (instancetype)init
{
    self = [super init];
    if (self) {
        name = @"name";
        _isName = @"_isName";
        _name = @"_name";
        isName = @"isName";
    }
    return self;
}

/// 测试为NO
+ (BOOL)accessInstanceVariablesDirectly {
    return NO;
}

- (id)valueForUndefinedKey:(NSString *)key {
    NSLog(@"找不到Key ： %@", key);
    return @"123";
}

/// getter三个方法 顺序
-(NSString*)getName {
    return name;
}
-(NSString*)name {
    return name;
}
-(NSString*)isName {
    return name;
}

@end
