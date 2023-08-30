//
//  ViewController.swift
//  concurrencyUsingOperations
//
//  Created by Ravneet Arora on 25/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Initial commit
        // Do any additional setup after loading the view.
        //     /// ------ one task in block operation -------
        //        let blockOperation = BlockOperation {
        //            for i in 0...10 {
        //                print("i ---> \(i)")
        //            }
        //            print("Ravneet Arora")
        //            print("Age - 32")
        //        }
        //
        //        blockOperation.start()
        
        //        /// ------ multiple task in block operation -------
        //           let blockOperation = BlockOperation()
        //
        //        blockOperation.addExecutionBlock {
        //            for i in 0...10 {
        //                print("Task 1  ---> \(i)")
        //            }
        //        }
        //
        //        blockOperation.addExecutionBlock {
        //            for i in 0...10 {
        //                print("Task 2  ---> \(i)")
        //            }
        //        }
        //           blockOperation.start()
        //        print("block operation will block the main thread here. I will execute after all tasks submitted in operation block executed")
        
        
        //        /// ------ multiple task in block operation  and run start operation on background thread-------
        //           let blockOperation = BlockOperation()
        //
        //        blockOperation.addExecutionBlock {
        //            for i in 0...10 {
        //                print("Task 1  ---> \(i)")
        //            }
        //        }
        //
        //        blockOperation.addExecutionBlock {
        //            for i in 0...10 {
        //                print("Task 2  ---> \(i)")
        //            }
        //        }
        //
        //        DispatchQueue.global(qos: .background).async {
        //            blockOperation.start()
        //            print("after start operation in background queue on thread ---> \(Thread.current) and is main thread ---> \(Thread.isMainThread)")
        //        }
        //
        //        print("outside background queue on thread ---> \(Thread.current) and is main thread ---> \(Thread.isMainThread)")
        
        
        /// ------ completion blocks of block operation ------
        //           let blockOperation = BlockOperation()
        //
        //        blockOperation.completionBlock = {
        //            print("operation completed on Thread ---> \(Thread.current)")
        //            print("operation completed on Is MainThread ---> \(Thread.isMainThread)")
        //            print("All blocks in this block operartion are executed")
        //        }
        //
        //        blockOperation.addExecutionBlock {
        //            for i in 0...10 {
        //                print("Task 1  ---> \(i)")
        //            }
        //        }
        //
        //        blockOperation.addExecutionBlock {
        //            for i in 0...10 {
        //                print("Task 2  ---> \(i)")
        //            }
        //        }
        //
        //        DispatchQueue.global(qos: .background).async {
        //            print("operation started on  Thread ---> \(Thread.current)")
        //            print("operation started on  Is MainThread ---> \(Thread.isMainThread)")
        //            blockOperation.start()
        //        }
        
        //        /// ------ operation queues ------
        //        let operationQueue = OperationQueue()
        //
        //        let operation1 = BlockOperation {
        //            for i in 0...10 {
        //                print("Task 1 in operation 1 ---> \(i)")
        //           //     print("Thread ---> \(Thread.current)")
        //           //     print("Is MainThread ---> \(Thread.isMainThread)")
        //            }
        //        }
        //
        //        let operation2 = BlockOperation {
        //            for i in 0...10 {
        //                print("Task 2 in operation 2 ---> \(i)")
        //         //       print("Thread ---> \(Thread.current)")
        //         //       print("Is MainThread ---> \(Thread.isMainThread)")
        //            }
        //        }
        //
        //        operationQueue.addOperation(operation1)
        //        operationQueue.addOperation(operation2)
        
        //        /// ------ set max concurrent operation ------
        //        let operationQueue = OperationQueue()
        //        operationQueue.maxConcurrentOperationCount = 1
        //
        //        let operation1 = BlockOperation {
        //            for i in 0...10 {
        //                print("Task 1  ---> \(i)")
        //                print("Is MainThread ---> \(Thread.isMainThread)")
        //            }
        //        }
        //
        //        let operation2 = BlockOperation {
        //            for i in 0...10 {
        //                print("Task 2 ---> \(i)")
        //                print("Is MainThread ---> \(Thread.isMainThread)")
        //            }
        //        }
        //
        //        operationQueue.addOperation(operation1)
        //        operationQueue.addOperation(operation2)
        
        /// ------ add dependency between operations ------
        //        let operationQueue = OperationQueue()
        //
        //        let operation1 = BlockOperation {
        //            for i in 0...10 {
        //                print("Task 1  ---> \(i)")
        //                print("Is MainThread ---> \(Thread.isMainThread)")
        //            }
        //        }
        //
        //        let operation2 = BlockOperation {
        //            for i in 0...10 {
        //                print("Task 2  ---> \(i)")
        //                print("Is MainThread ---> \(Thread.isMainThread)")
        //            }
        //        }
        //        //OPERATION 1 HAS DEPENDENCY ON OPERATION 2. operation 1 will start after operation 2
        //        operation1.addDependency(operation2)
        //        operationQueue.addOperation(operation1)
        //        operationQueue.addOperation(operation2)
        
        /// ------ add dependency between operations ------
        let operationQueue = OperationQueue()
        
        let operation1 = BlockOperation {
            for i in 0...10 {
                print("Task 1  ---> \(i)")
            }
        }
        
        let operation2 = BlockOperation {
            for i in 0...10 {
                print("Task 2  ---> \(i)")
            }
        }
        
        let operation3 = BlockOperation {
            for i in 0...10 {
                print("Task 3  ---> \(i)")
            }
        }
        
        let operation4 = BlockOperation {
            print("first three tasks are executed")
        }
        operation4.addDependency(operation1)
        operation4.addDependency(operation2)
        operation4.addDependency(operation3)
     
        //Block  thread.
        operationQueue.addOperations([operation1, operation2, operation3, operation4], waitUntilFinished: true)
        print("Thread was blocked")
        
        //unblock  thread
      //  operationQueue.addOperations([operation1, operation2, operation3, operation4], waitUntilFinished: true)
      //  print("Thread not blocked")
    
    }
    
    
}

