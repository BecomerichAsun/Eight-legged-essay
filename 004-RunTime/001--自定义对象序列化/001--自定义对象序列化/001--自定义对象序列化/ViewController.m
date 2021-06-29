//
//  ViewController.m
//  001--自定义对象序列化
//
//  Created by Asun on 2021/6/29.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)save:(id)sender {
    Person* p = [[Person alloc]init];
    p.name = @"Asun";
    p.age = 18;
    
    
  
  
    //2.将二进制数据保存到文件
    //创建文件
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"Asun.data"];
    //创建文件
    NSLog(@"%@",path);

    [NSKeyedArchiver archiveRootObject:p toFile:path];
}


- (IBAction)read:(id)sender {
    
    //解归档
    //获取文件路径
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"Asun.data"];
    //将二进制数据转化为对应的对象类型
    Person* p = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    NSLog(@"%@--%d", p.name,p.age);
    
}

@end
