//
//  main.m
//  Block笔记
//
//  Created by 李小龙 on 2019/5/28.
//  Copyright © 2019 李小龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "TestObject.h"
 int iVar = 10;
int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        int a = 10;
        int b = 20;
        // p: 栈
        // TestObject对象（计数器==1）:堆
        TestObject *p = [[TestObject alloc] init];
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
    /**
     没有访问任何变量
     */
    void (^block)(void) = ^{
        NSLog(@"===");
    };
    block();
    
    /**
     访问了全局(静态)变量
     */
    void (^block1)(void) = ^{
        NSLog(@"===%d",iVar);
    };
    block1();
    
    /**
     访问了局部变量
     */
    int iVar1 = 10;
    void (^block2)(void) = ^{
        NSLog(@"===%d",iVar1);
    };
    
    
  
}


