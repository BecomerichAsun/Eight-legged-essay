//
//  ViewController.m
//  003--动态添加方法
//
//  Created by Asun on 2021/6/29.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/message.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person* p = [[Person alloc]init];
    objc_msgSend(p,@selector(eatWithFood:),@"食物");

}


@end
