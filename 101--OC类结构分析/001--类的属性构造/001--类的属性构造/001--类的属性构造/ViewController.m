//
//  ViewController.m
//  001--类的属性构造
//
//  Created by Asun on 2021/7/2.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Person* p = [Person alloc];
    
    Class pclass = object_getClass(p);
    
}


@end
