//
//  RunLoopObserver.swift
//  003-RunLoop
//
//  Created by Asun on 2021/6/28.
//

import UIKit
import CoreFoundation

class RunLoopObserver: NSObject {
    
    
    let callBack:((CFRunLoopObserver?, CFRunLoopActivity, UnsafeMutableRawPointer?) -> Void) = {_,_,_ in }
    
    override init() {
        super.init()
    }
    
    func addRunloopObserver(currentObj:AnyObject, mode: CFRunLoopMode) {
        // 获取到当前Runloop
        let cfRunloop = CFRunLoopGetCurrent()
        ///创建回调中的上下文
        var info = CFRunLoopObserverContext.init(version: 0, info: unsafeBitCast(self, to: UnsafeMutablePointer.self), retain: nil, release: nil, copyDescription: nil)
       
        /// 创建观察者
        // new create copy 在堆区开辟空间
        let observer: CFRunLoopObserver = CFRunLoopObserverCreate(nil, CFRunLoopActivity.beforeWaiting.rawValue, true, 0, loopCallBack(), &info)
        
        CFRunLoopAddObserver(cfRunloop, observer, mode)

    }
    
    
    func loopCallBack() -> CFRunLoopObserverCallBack? {
        return { (observer, activity, point) in
            /**
             /// 获取当前页面
             let currentVc = unsafeBitCast(point, to: ViewController.self)
             /// 当前页面任务池为0 则返回空
             if currentVc.tasks.isEmpty {
             return nil
             }
             /// 获取到第一个任务
             let task = currentVc.tasks.first
             /// 执行第一个任务
             task()
             /// 执行完成移除第一个任务
             vc.tasks.removeIndex(0)
             */
        }
    }
}
