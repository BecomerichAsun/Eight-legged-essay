//
//  ViewController.m
//  001--KVC设值
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
    Person* person = [[Person alloc] init];
    
    [person setValue:@"123" forKey:@"name"];
    [person setValue:nil forKey:@"age"];
    [person setValue:nil forKey:@"switcha"];
    
    [person desc];
}


@end
