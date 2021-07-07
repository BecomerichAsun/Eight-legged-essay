//
//  Person.h
//  001--类的属性构造
//
//  Created by Asun on 2021/7/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject {
    NSString* asunString;
}

@property (nonatomic,assign) NSString* asunName;

- (void)asunCoolMethod;

- (id)asunParCoolMethod;

@end

NS_ASSUME_NONNULL_END
