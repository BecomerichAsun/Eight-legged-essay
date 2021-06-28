//
//  NSObject+AsunKVC.m
//  自定义KVC
//
//  Created by Asun on 2021/6/25.
//

#import "NSObject+AsunKVC.h"
#import <objc/runtime.h>

@implementation NSObject (AsunKVC)


- (void)asun_setValue:(id)value forKey:(NSString *)key {
    /// 判断Key值是否为空，是否长度为0
    if ((key == nil) || (key.length == 0)) {
        NSException* ex = [[NSException alloc]initWithName:@"Asun-KVCSetValueError" reason:@"key值不对" userInfo:nil];
        @throw ex;
        return;
    }
    
    /// 获取set方法
    NSString* setStr = [NSString stringWithFormat:@"set%@:",key.capitalizedString];
    /// 获取set第二种方法
    NSString* isStr = [NSString stringWithFormat:@"setIs%@:",key.capitalizedString];
    
    /// 判断是否能找到setKey方法
    if ([self.class respondsToSelector:NSSelectorFromString(setStr)]) {
        [self.class performSelector:NSSelectorFromString(setStr) withObject:value];
        return;
    }
    /// 判断是否能找到isKey方法
    if ([self.class respondsToSelector:NSSelectorFromString(isStr)]) {
        [self.class performSelector:NSSelectorFromString(isStr) withObject:value];
        return;
    }
    /// 判断accessInstanceVariablesDirectly方法 如果false则Crash
    if (![self.class accessInstanceVariablesDirectly]) {
        NSException* ex = [[NSException alloc]initWithName:@"Asun-KVCError" reason:@"accessInstanceVariablesDirectly错误" userInfo:nil];
        @throw ex;
        return;
    }
    
    /// 获取当前类属性名称 分别为 _key，_isKey,key,isKey
    unsigned int count = 0;
    Ivar* ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        Ivar propretyKey = (ivars[i]);
        NSString* keyName = [NSString stringWithUTF8String:ivar_getName(propretyKey)];
        if ([keyName isEqualToString:[NSString stringWithFormat:@"_%@",key]]) {
            object_setIvar(self, propretyKey, value);
            free(ivars);
            return;
        }
    }
    
    for (int i = 0; i < count; i++) {
        Ivar propretyKey = (ivars[i]);
        NSString* keyName = [NSString stringWithUTF8String:ivar_getName(propretyKey)];
        if ([keyName isEqualToString:[NSString stringWithFormat:@"_is%@",key.capitalizedString]]) {
            object_setIvar(self, propretyKey, value);
            free(ivars);
            return;
        }
    }
    
    for (int i = 0; i < count; i++) {
        Ivar propretyKey = (ivars[i]);
        NSString* keyName = [NSString stringWithUTF8String:ivar_getName(propretyKey)];
        if ([keyName isEqualToString:[NSString stringWithFormat:@"%@",key]]) {
            object_setIvar(self, propretyKey, value);
            free(ivars);
            return;
        }
    }
    
    for (int i = 0; i < count; i++) {
        Ivar propretyKey = (ivars[i]);
        NSString* keyName = [NSString stringWithUTF8String:ivar_getName(propretyKey)];
        if ([keyName isEqualToString:[NSString stringWithFormat:@"is%@",key.capitalizedString]]) {
            object_setIvar(self, propretyKey, value);
            free(ivars);
            return;
        }
    }
    free(ivars);
    [self setValue:value forUndefinedKey:key];
}

- (id)asun_valueForKey:(NSString *)key {
    /// 判断Key值是否为空，是否长度为0
    if ((key == nil) || (key.length == 0)) {
        [self valueForUndefinedKey:key];
    }
    
    //    if ([[key substringFromIndex:0] containsString:@"_"]) {
    //        key = [key substringFromIndex:1];
    //        NSLog(@"%@",key);
    //    }
    
    /// 获取get方法 getKey, key, isKey
    NSString* getKeyStr = [NSString stringWithFormat:@"get%@",key.capitalizedString];
    
    NSString* keyStr = [NSString stringWithFormat:@"%@",key];
    
    NSString* isStr = [NSString stringWithFormat:@"getIs%@",key.capitalizedString];
    
    /// 判断是否能找到setKey方法
    if ([self respondsToSelector:NSSelectorFromString(getKeyStr)]) {
        return [self performSelector:NSSelectorFromString(getKeyStr)];
    }else if ([self respondsToSelector:NSSelectorFromString(keyStr)]) {
        return [self performSelector:NSSelectorFromString(keyStr)];
    }else if ([self respondsToSelector:NSSelectorFromString(isStr)]) {
        return [self performSelector:NSSelectorFromString(isStr)];
    }
    
    /// 判断accessInstanceVariablesDirectly方法 如果false则Crash
    if (![self.class accessInstanceVariablesDirectly]) {
        NSException* ex = [[NSException alloc]initWithName:@"Asun-KVCError" reason:@"accessInstanceVariablesDirectly错误" userInfo:nil];
        @throw ex;
    }
    NSString* getKey;
    /// 获取当前类属性名称 分别为 _key，_isKey,key,isKey
    unsigned int count = 0;
    Ivar* ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        Ivar propretyKey = (ivars[i]);
        NSString* keyName = [NSString stringWithUTF8String:ivar_getName(propretyKey)];
        if ([keyName isEqualToString:[NSString stringWithFormat:@"_%@",key]]) {
            getKey = object_getIvar(self, propretyKey);
            free(ivars);
            return getKey;
        }
    }
    
    for (int i = 0; i < count; i++) {
        Ivar propretyKey = (ivars[i]);
        NSString* keyName = [NSString stringWithUTF8String:ivar_getName(propretyKey)];
        if ([keyName isEqualToString:[NSString stringWithFormat:@"_is%@",key.capitalizedString]]) {
            getKey = object_getIvar(self, propretyKey);
            free(ivars);
            return getKey;
        }
    }
    
    for (int i = 0; i < count; i++) {
        Ivar propretyKey = (ivars[i]);
        NSString* keyName = [NSString stringWithUTF8String:ivar_getName(propretyKey)];
        if ([keyName isEqualToString:[NSString stringWithFormat:@"%@",key]]) {
            getKey = object_getIvar(self, propretyKey);
            free(ivars);
            return getKey;
        }
    }
    
    for (int i = 0; i < count; i++) {
        Ivar propretyKey = (ivars[i]);
        NSString* keyName = [NSString stringWithUTF8String:ivar_getName(propretyKey)];
        if ([keyName isEqualToString:[NSString stringWithFormat:@"is%@",key.capitalizedString]]) {
            getKey = object_getIvar(self, propretyKey);
            free(ivars);
            return getKey;
        }
    }
    free(ivars);
    [self valueForUndefinedKey:key];
    return getKey;
}

@end
