//
//  ViewController.m
//  Super区别
//
//  Created by Asun on 2021/6/30.
//

#import "ViewController.h"
#import "Father.h"
#import "Son.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Son* s = [[Son alloc]init];
    [s eat];
 
}


@end
