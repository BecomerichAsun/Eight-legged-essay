//
//  Person.h
//  001--自定义对象序列化
//
//  Created by Asun on 2021/6/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject<NSCoding>
@property (nonatomic,copy) NSString* name;
@property (nonatomic,assign) int age;

@end

NS_ASSUME_NONNULL_END
