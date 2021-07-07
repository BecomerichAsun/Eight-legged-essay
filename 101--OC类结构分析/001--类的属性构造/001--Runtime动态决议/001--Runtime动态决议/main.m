//
//  main.m
//  001--Runtime动态决议
//
//  Created by Asun on 2021/7/7.
//

#import <Foundation/Foundation.h>

/**
 对象方法动态决议 + (BOOL)resolveInstanceMethod:(SEL)sel
 当调用不存在的Method时，Runtime会进行动态方法决议
 
 - 1.先判断是否为类调用
 static NEVER_INLINE IMP
 resolveMethod_locked(id inst, SEL sel, Class cls, int behavior)
 
 if (! cls->isMetaClass()) {
     // try [cls resolveInstanceMethod:sel]
     resolveInstanceMethod(inst, sel, cls);
 }
 
 - 2.调用对象方法相对应的方法
 static void resolveInstanceMethod(id inst, SEL sel, Class cls)
 
 - 3.本质就是发送了一个objc_msgSend,子类默认不实现，继承基类，所以调用不存在的方法不会Crash
 在此位置，依旧崩溃在 sel（自己写的不存在方法名）
 resolve_sel = @selector(resolveInstanceMethod:);
 
 - 4. 如果子类实现了 resolveInstanceMethod,并进行了一系列操作，则 会重新进行查找操作
 IMP imp = lookUpImpOrNilTryCache(inst, sel, cls);
 
 */

/**
 对象方法动态决议 + (BOOL)resolveInstanceMethod:(SEL)sel
情况一: 元类调用类方法 [Person 类方法];
情况二: 元类调用对象方法 [Person 对象方法];
 
 情况一解析:
 - 1.先判断是否为元类调用
 static NEVER_INLINE IMP
 resolveMethod_locked(id inst, SEL sel, Class cls, int behavior)
 
 resolveClassMethod(inst, sel, cls);
 if (!lookUpImpOrNilTryCache(inst, sel, cls)) {
     resolveInstanceMethod(inst, sel, cls);
 }
 
 - 2.流程与上述对象方法查找流程一样，只不过 resolve变成了 @selector(resolveClassMethod:)
 
 - 3. 如果子类实现了 resolveInstanceMethod,并进行了一系列操作，则 会重新进行查找操作
 IMP imp = lookUpImpOrNilTryCache(inst, sel, cls);
 
 情况二：
  元类调用对象方法，只是在情况1的基础上，等待情况1返回找不到后，在进行一次判断，从而转换为去调用对象方法。
 完美解释了 元类ISA走位
 if (!lookUpImpOrNilTryCache(inst, sel, cls)) {
     resolveInstanceMethod(inst, sel, cls);
 }
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
     
    }
    return 0;
}
