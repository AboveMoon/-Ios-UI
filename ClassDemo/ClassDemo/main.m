//
//  main.m
//  ClassDemo
//
//  Created by qingyun on 15/10/22.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

// 类的语法
// 第一部分:称之为 接口
@interface Person : NSObject // 类名:父类的名字

// 类的成员变量的声明（类似于结构体中的成员）
{
    int _age;
    char _name[10];
    NSString *identify;
}

// 类的方法的声明
// 以 + 开始的方法是类方法， 只能由 类来执行
// 下面是一个类方法，这个方法接收两个参数 name 和 age，然后用来实例化一个对象，这个对象的成员变量直接使用两个参数的值，最终将该对象返回，像这样的类方法称之为工厂方法
// ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️:注意区分类方法（以+开始的方法）和类的方法（类中声明的方法统称为类的方法）这两个叫法
+ (Person *)personWithName:(char *)name andAge:(int)age;

// 以 - 开始的方法是对象方法，对象方法只能能由 对象 来执行
- (void)love;
- (void)eat;
- (void)run;
- (void)afawefawfwaf;
//.....

// setter getter方法
- (void)setAge:(int)age; // setter 的命名习惯 set+成员变量名字
- (int)age; // getter 一般都是直接以成员变量命名

- (void)setName:(char *)name;
- (char *)name;

@end

// 第二部分:实现
@implementation Person

+ (Person *)personWithName:(char *)name andAge:(int)age
{
    Person *some = [Person new];
    [some setAge:age];
    [some setName:name];
    [some eat];
    [some love];
    return some;
}

- (void)eat
{
    NSLog(@"吃货");
}

- (void)love
{
    NSLog(@"loving.....");
    NSLog(@"love ....");
}

- (void)run
{
    NSLog(@"奔跑吧，兄弟!");
}

- (void)afawefawfwaf
{
    NSLog(@"失去理智了...");
}

// 成员变量可以直接在类的实现内部直接使用
- (void)setAge:(int)age
{
    _age = age;
}

- (int)age
{
    return _age;
}

- (void)setName:(char *)name
{
    strcpy(_name, name);
}
- (char *)name
{
    return _name;
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 普通的整型变量
        int a = 100;
        a += 1;
        
        // 结构体变量
        struct student {
            char name[10];
            int age;
        } st1;
        st1.age = 18;
        NSLog(@"st1'age >>>> %d", st1.age);
        
        // 类就是一种新的数据类型，类定义的变量就称为 对象
        Person *st4 = [Person new]; // 向类发消息new 就可以新建一个对象，标准说法：实例化对象（创建对象）
        
        [st4 afawefawfwaf];
        [st4 eat]; // 类似于 [类名或者对象 方法名字] 这样的方式，称之为 发消息（调用方法）
        //[st4 love];
        [st4 run];
        
        [st4 setAge:20];
        NSLog(@"st4'age >>>> %d", [st4 age]);
        
        Person *st5 = [Person new];
        [st5 setAge:21];
        [st5 run];
        
        
        // 使用自定义的类方法来创建一个对象
        Person *st6 = [Person personWithName:"fankai" andAge:20];
        NSLog(@"st6'name >>> %s, age >>> %d", [st6 name], [st6 age]);
    }
    return 0;
}
