//
//  main.m
//  001--内存对齐原则
//
//  Created by Asun on 2021/6/30.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <malloc/malloc.h>

/**
 struct Person1 {
 char a; // 占用1个字节
 double b; // 占用8个字节
 }
 
 struct 或者 union
 指针排布 从offset为0 开始
 之后 需要以offset/当前属性占用字节(n) = 整数倍 开始计算，
 - 如果当前位置不为属性占用字节的整数倍，则当前位置轮空占位
 - 如果为整数倍则依次排列
 
 例如:
 // IOS中char占用1个字节offset为0，此时0为该属性，后续从offset1开始
 // IOS中double占用8字节，
 判断offset(当前为1)/当前字节占用（8）是否为整数
 很明显1->7都不为整数倍  1/8 -> 7/8
 所以 (1,2,3,4,5,6,7)(占位)
 则 b 字节占用从 8...15(offset(8)+占用8字节)
 */

struct Person1 {
    double b; // 8  0 ... 7 00001000 8
    char a; // 1  min(8,1) 8
    int c; // 4   min(9,4) (9,10,11) 12,13,14,15
    short d; // 2 min(16,2) 16,17
    /**
     b,a,c,d 属性总申请内存 18个字节
     但由于要为8的倍数 所以申请内存:24
     */
}PersonS1;

struct Person2 {
    char a; // 1     0位置
    double b; // 8  min(1,8) (1,2,3,4,5,6,7)(占位) 8,9,10,11,12,13,14,15 (真实地址)
    int c; // 4 min(16,4)  16,17,18,19
    short d; // 2 min(20,2) 20,21
    /**
     a,b,c,d 属性总申请内存 22个字节
     但由于要为8的倍数 所以申请内存:24
     */
}PersonS2;

struct Person3 {
    double b; // 8  0..7
    int c; // 4 min(8,4), 8,9,10,11
    char a; // 1 min(12,1) 12
    short d;// 2 min(13,2) (13) 14 15
    /**
     b,c,a,d 属性总申请内存 16个字节
     但由于要为8的倍数 所以申请/开辟：16
     */
}PersonS3;


int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        NSLog(@"%lu -- %lu -- %lu",sizeof(PersonS1),sizeof(PersonS2),sizeof(PersonS3));
        
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
