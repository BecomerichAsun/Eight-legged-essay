//
//  ViewController.swift
//  003-RunLoop
//
//  Created by Asun on 2021/6/28.
//
/**
 Runloop优化大图加载
 
 1.task: 创建图片 + 设置图片 + 添加图片
 
 2.[taskBlock] = [(task)->()]
 
 3.监听runloop状态 ，当Runloop空闲时 ，执行[taskBlock]中的第一个 闭包taskBlock,执行完成，将数组中的第一个移除任务。
 */


import UIKit

class ViewController: UIViewController {
    
    var isFinished: Bool = false
    
    var count:Int = 1
    
    var timers:DispatchSourceTimer!
    
    let observer = RunLoopObserver()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observer.addRunloopObserver(currentObj: self, mode: .defaultMode)
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { t in
            
        }
    }
    
    /// GCD计时器
    func gcdTimer() {
        timers = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
        timers.schedule(deadline: .now(), repeating: 1.0)
      
        timers.setEventHandler(qos: .default, flags: .noQoS) {
            print("123")
        }
        timers.resume()
    }
    
    /// 原生计时器
    func timer() {
        /**
         1.子线程中添加Timer对象并正常运作，必须得实现线程保活。
         2.需要将定时器添加到当前线程的Runloop中
         3.如果需要停止线程内部工作且销毁当前线程对象，需要做一定操作
         */
        let thread = AsunThread.init {
            let timer: Timer = Timer(fireAt: Date.init(timeIntervalSinceNow: 0), interval: 1.0, target: self, selector: #selector(self.timerMethod), userInfo: nil, repeats: true)
            RunLoop.current.add(timer, forMode: .default)
            while !self.isFinished {
                RunLoop.current.run(until: Date.init(timeIntervalSinceNow: 0.0001))
            }
            print("来了")
        }
        
        thread.start()
    }
    
    @objc func timerMethod() {
        count += 1
        print("\(count)")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isFinished = !isFinished
    }
}


class AsunThread: Thread {
    deinit {
        print("线程销毁了")
    }
}
