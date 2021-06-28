//
//  NSObject+AsunKVC.h
//  自定义KVC
//
//  Created by Asun on 2021/6/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (AsunKVC)

/// 自定义SetValue
/// @param value 值
/// @param key Key
- (void)asun_setValue:(id)value forKey:(NSString*)key;

/// 自定义ValueForKey
/// @param key Key
- (id)asun_valueForKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
