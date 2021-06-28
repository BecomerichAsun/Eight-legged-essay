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
    Person* person = [[Person alloc]init];
    [person valueForKey:@"123"];
}


@end
