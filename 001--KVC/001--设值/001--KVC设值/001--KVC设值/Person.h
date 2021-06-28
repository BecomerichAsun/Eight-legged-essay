//
//  Person.h
//  001--KVC设值
//
//  Created by Asun on 2021/6/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
{
    NSString* _name;
    NSString* _isName;
    NSString* name;
    NSString* isName;
    
}

@property(nonatomic,assign) int age;
@property(nonatomic,assign) BOOL switcha;

-(void)desc;

@end

NS_ASSUME_NONNULL_END
