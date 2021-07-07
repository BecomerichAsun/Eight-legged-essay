//
//  main.m
//  001--元类
//
//  Created by Asun on 2021/7/1.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <objc/runtime.h>
#import "Person.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
       /**
        (lldb) x/4gx Person.class - 二进制获取类指针地址 分为4个
        0x1090ac510: 0x00000001090ac4e8 0x00007fff80030660
        0x1090ac520: 0x00007fff20195cd0 0x0000801000000000
        (lldb) p/x  0x00000001090ac4e8 & 0x00007ffffffffff8 - 将第一个ISA(person),采用ISA走位 操作 等同于class_getClass(xxx)
        
        (long) $10 = 0x00000001090ac4e8 - 获取到元类指针
        
        (lldb) x/4gx 0x00000001090ac4e8 - 将元类指针转为二进制 分为4个
        0x1090ac4e8: 0x00007fff80030638 0x00007fff80030638
        0x1090ac4f8: 0x0000600003e5c080 0x0003c03100000007
        
        (lldb) po 0x1090ac4e8 - 此时指针地址还是为Person
        Person
        (lldb) po 0x00007fff80030638 - 但其中的第一个属性 ISA 为元类NSObject
        NSObject
        
        1. x/4gx Person.class 获取类指针地址
        2. po 指针地址 得出 当前为Person类
        3. p/x 指针地址值 & ISA_mask 等同于class_getclass()操作(16进制P)
        4. 获取到 当前Person类的元类
        5. x/4gx 获取到父类的指针地址分割为4分
        6. 其中指针地址的第一个属性 为父类
        */
        // 对象 -> 类对象 -> 元类 -> 根元类 <-> 根元类
        ///空类
        Person* p = [Person alloc];
        
        
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
