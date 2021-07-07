//
//  ViewController.m
//  002--KVC取值
//
//  Created by Asun on 2021/6/25.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    Person* person = [[Person alloc]init];
//    [person valueForKey:@"123"];
    [self test];
}

- (void)test {
    NSString* str = [NSString stringWithFormat:@"大家好"];
//    NSString* str1 = @"大家好";
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"%p---%@",str,str);
    });
    
    str = @"哈哈";
    NSLog(@"%@---%p",str,str);
}


@end
