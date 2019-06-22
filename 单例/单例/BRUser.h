//
//  BRUser.h
//  单例
//
//  Created by 李小龙 on 2019/6/3.
//  Copyright © 2019 李小龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//定义一个枚举（比较严密）
typedef NS_ENUM(NSInteger,BRUserGender) {
    BRUserGenderUnknow,  //未知
    BRUserGenderMale,    //男性
    BRUserGenderFemale,  //女性
    BRUserGenderNeuter   //无性
};
@interface BRUser : NSObject<NSCopying>
@property (nonatomic, readonly, copy)NSString *name;
@property (nonatomic, readonly, assign)NSUInteger age;
@property (nonatomic, readonly, assign)BRUserGender gener;

- (instancetype)initWithName:(NSString *)name age:(NSUInteger)age gener:(BRUserGender)gener;
@end
//说明：
//既然该类中已经有一个"初始化方法"， 用于设置name，age和genger的初始值，那么在设计对应@property时就应该尽量使用不可变的对象：其三个属性都应该设为"只读"。用初始化方法设置好属性值之后，就不能再改变了。
//属性的参数应该按照下面的顺序排列：（原子性，读写，内存管理）
NS_ASSUME_NONNULL_END
