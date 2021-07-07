//
//  ViewController.m
//  Alloc&init
//
//  Created by Asun on 2021/6/29.
//

#import "ViewController.h"
#import "Person.h"


#ifdef DEBUG
#define print(format, ...) printf("%s\n", [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define print(format, ...);
#endif


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person* p1 = [Person alloc];
    p1.str = @"123";
    p1.str1 = @"1234";
    p1.str2 = @"1235";
    p1.str3 = @"1236";

//     x/Nxg p1
    print(@"%@", p1);
}


@end
