//
//  ViewController.m
//  002-Demo
//
//  Created by Asun on 2021/6/29.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL* url = [NSURL URLWithString:@"https:www.baidu.com"];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    NSLog(@"url = %@",url);
    
}


@end
