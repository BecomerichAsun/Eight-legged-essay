//
//  ViewController.m
//  自定义KVC
//
//  Created by Asun on 2021/6/25.
//

#import "ViewController.h"
#import "NSObject+AsunKVC.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person* p = [[Person alloc] init];
    
    [p asun_setValue:@"123" forKey:@"name"];
    
    NSString* str = [p asun_valueForKey:@"name"];
    
    NSLog(@"%@",str);
    
    
}


@end
