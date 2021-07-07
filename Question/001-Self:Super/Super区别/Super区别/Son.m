//
//  Son.m
//  Super区别
//
//  Created by Asun on 2021/6/30.
//

#import "Son.h"

@implementation Son

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)eat {
    [super eat];
    NSArray *syms = [NSThread  callStackSymbols];
       NSLog(@"子类输出\n ---- \n<%@ %p> %@ - \ncaller: %@ ", [self class], self, NSStringFromSelector(_cmd),[syms objectAtIndex:1]);

}

@end
