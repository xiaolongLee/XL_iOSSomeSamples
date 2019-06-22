//
//  ViewController.m
//  Block笔记
//
//  Created by 李小龙 on 2019/5/28.
//  Copyright © 2019 李小龙. All rights reserved.
//

#import "ViewController.h"
#import "TestObject.h"
//typedef <#returnType#>(^<#name#>)(<#arguments#>);
//Block声明结构组成(等号左侧)
//returnType 返回值类型
//^ block标志符号
//name Block名称
//arguments 参数类型
typedef int(^MNBlock)(int a ,int b);
typedef void(^MNBlcok1)(void);
typedef void(^MNBlock2)(int a);
typedef int(^MNBlock3)(void);
@interface ViewController ()
@property (nonatomic,copy) MNBlock sum;
@property (nonatomic,copy) NSMutableArray *arr;
@property (nonatomic,copy) NSString *str;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Blcok实现结构
//    ^int(int a, int b) {
//
//    };
    // ^
    // 返回值类型
    //参数类型
    //返回值
    
    int(^Sum)(int,int) = ^(int a, int b){
        return a + b;
    };
    
    int result = Sum(5,10);
    
    void (^testBlock)() = ^{
        
    };
    
    self.sum = ^int(int a, int b) {
        return a + b;
    };
    
    //[self arrCopyTest];
    [self arrMCopyTest4];
    
}
 TestObject *obj1 = nil;
- (void)varMemoryTest{
    obj1 = [[TestObject alloc] init];
    TestObject *obj2 = [[TestObject alloc] init];
    NSLog(@"内容1：%@; 内容2: %@",obj1,obj2);
    NSLog(@"指针1：%p; 指针2: %p",&obj1,&obj2);
    
    NSString *str1 = @"123";
    NSString *str2 = @"456";
    NSArray *arr = @[str1,str2];
}


///不可变集合的copy与mutableCopy
- (void)arrCopyTest {
    NSArray *arrM1 = @[[[TestObject alloc] init]];
    NSMutableArray *arrM2 = [arrM1 mutableCopy];
    NSArray *arr = [arrM1 copy];
    [arrM2 addObject:[[TestObject alloc] init]];
    //打印指针arrM1,arrM2,arr的地址：应处于栈区
    NSLog(@"%p,%p,%p",&arrM1,&arrM2,&arr);
    //打印数组的地址，即数组的内容：应处于堆区
    NSLog(@"%p,%p,%p",arrM1,arrM2,arr);
    //打印数组第一个元素指针指向的内容的地址：应该处于堆区
    NSLog(@"%p,%p,%p",arrM1[0],arrM2[0],arr[0]);
    //打印数组所有元素指向的内容
    NSLog(@"%@,%@,%@",arrM1,arrM2,arr);
}

/// 可变集合的copy与mutableCopy
- (void)arrMCopyTest1 {
    NSMutableArray *arrM1 = [NSMutableArray arrayWithObjects:@"123", nil];
    NSMutableArray *arrM2 = [arrM1 mutableCopy];
    NSArray *arr = [arrM1 copy];
    [arrM1 addObject:@"789"];
    //打印指针arrM1,arrM2,arr的地址：应处于栈区
    NSLog(@"%p,%p,%p",&arrM1,&arrM2,&arr);
    //打印数组的地址，即数组的内容：应处于堆区
    NSLog(@"%p,%p,%p",arrM1,arrM2,arr);
    //打印数组第一个元素指针指向的内容的地址：应该处于常量区，因为字符串是const类型
    NSLog(@"%p,%p,%p",arrM1[0],arrM2[0],arr[0]);
    //打印数组所有元素指向的内容
    NSLog(@"%@,%@,%@",arrM1,arrM2,arr);
    
}

/// 集合的单层深复制
- (void)arrOneLevelCopyTest {
    NSMutableDictionary *dict1 = [NSMutableDictionary  dictionaryWithObjectsAndKeys:@"key",@"123", nil];
    NSMutableArray *arrM1 = [NSMutableArray arrayWithObjects:dict1, nil];
    NSMutableArray *arrM2 = [[NSMutableArray alloc] initWithArray:arrM1 copyItems:YES];
    [arrM2 addObject:[[TestObject alloc] init]];
    //打印指针arrM1,arrM2,arr的地址：应处于栈区
    NSLog(@"%p,%p",&arrM1,&arrM2);
    //打印数组的地址，即数组的内容：应处于堆区
    NSLog(@"%p,%p",arrM1,arrM2);
    //打印数组第一个元素指针指向的内容的地址：应该处于常量区，因为字符串是const类型
    NSLog(@"%p,%p",arrM1[0],arrM2[0]);
    //打印数组所有元素指向的内容
    NSLog(@"%@,%@",arrM1,arrM2);
    
}

- (void)blockTest {
    //如果为空则返回
    
}


- (void)arrMCopyTest {
    NSMutableArray *arrM = [NSMutableArray arrayWithObjects:@"123",@"445", nil];
    NSMutableArray *arr = [arrM copy];//返回的是不可变类型
    //下面代码崩溃
    [arr addObject:@"789"];
}

- (void)arrMCopyTest3 {
    NSMutableArray *arrM = [NSMutableArray arrayWithObjects: @"123",@"456", nil];
    self.arr = arrM; //相当于_arr = [arrM copy]
    //下面代码崩溃
    [self.arr addObject:@"789"];
}


- (void)arrMCopyTest4{
    NSMutableString *str = [NSMutableString stringWithFormat:@"123"];
//    self.str = str;
    _str = str;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [str appendString:@"456"];
        NSLog(@"change");
    });
}

- (void)setStr:(NSString *)str {
    //_str = str;不要zhe这样写
    _str = [str copy];
}

@end
