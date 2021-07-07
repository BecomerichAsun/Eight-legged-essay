//
//  main.m
//  001--对象的本质
//
//  Created by Asun on 2021/7/1.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic,copy) NSString* asun;
@end

@implementation Person

@end

struct FuckHard {
    NSString* a;
} AsunFuckHard;


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* p = [Person alloc];
      
        
    }
    return 0;
}
