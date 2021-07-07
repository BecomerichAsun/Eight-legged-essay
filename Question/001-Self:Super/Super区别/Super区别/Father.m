//
//  Father.m
//  Super区别
//
//  Created by Asun on 2021/6/30.
//

#import "Father.h"

@implementation Father
- (void)eat {
    NSArray *syms = [NSThread  callStackSymbols];
       NSLog(@"父类输出\n ---- \n<%@ %p> %@ - \ncaller: %@ ", [self class], self, NSStringFromSelector(_cmd),[syms objectAtIndex:1]);

}
@end
