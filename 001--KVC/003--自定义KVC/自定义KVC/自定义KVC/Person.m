//
//  Person.m
//  自定义KVC
//
//  Created by Asun on 2021/6/25.
//

#import "Person.h"

@implementation Person 
- (instancetype)init
{
    self = [super init];
    if (self) {
        name = @"大家好===";
    }
    return self;
}

+ (BOOL)accessInstanceVariablesDirectly {
    return YES;
}

//-(NSString*)name {
//    return @"aaaa";
//}

@end
