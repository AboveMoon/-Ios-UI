//
//  main.m
//  把🐘放进冰箱
//
//  Created by qingyun on 15/10/22.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

// 大象类
@interface Elephant : NSObject

{
    NSString *_name;
    float _volume;
    BOOL _isMoved;
}

- (void)setName:(NSString *)name;
- (NSString *)name;

- (void)setVolume:(float)volume;
- (float)volume;

- (void)setIsMoved:(BOOL)isMoved;
- (BOOL)isMoved;

@end

@implementation Elephant

- (void)setName:(NSString *)name
{
    _name = name;
}
- (NSString *)name
{
    return _name;
}

- (void)setVolume:(float)volume
{
    _volume = volume;
}
- (float)volume
{
    return _volume;
}

- (void)setIsMoved:(BOOL)isMoved
{
    _isMoved = isMoved;
}
- (BOOL)isMoved
{
    return _isMoved;
}

@end

// 冰箱类
@interface Fridge : NSObject

{
    NSString *_brand;
    float _volume;
}

- (void)setBrand:(NSString *)brand;
- (NSString *)brand;

- (void)setVolume:(float)volume;
- (float)volume;

// 冰箱提供一种方法，可以放入一只大象
- (void)putInWith:(Elephant *)someElephant;

@end

@implementation Fridge

- (void)setBrand:(NSString *)brand
{
    _brand = brand;
}
- (NSString *)brand
{
    return _brand;
}

- (void)setVolume:(float)volume
{
    _volume = volume;
}
- (float)volume
{
    return _volume;
}

- (void)putInWith:(Elephant *)someElephant
{
    if ([someElephant isMoved]) {
        if ((_volume - [someElephant volume]) > 0) {
            NSLog(@"已经把 %@ 放入 %@ 冰箱", [someElephant name], _brand);
        } else {
            NSLog(@"你去减减肥吧");
        }
    } else {
        NSLog(@"不要放，要不然踩扁你");
    }
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Elephant *ele = [Elephant new];
        [ele setName:@"feifei"];
        [ele setVolume:2000.01];
        [ele setIsMoved:YES];
        
        Elephant *ele1 = [Elephant new];
        [ele1 setName:@"小强"];
        [ele1 setIsMoved:NO];
        
        Fridge *haier = [Fridge new];
        [haier setBrand:@"新飞"];
        [haier setVolume:1000.01];
        
        [haier putInWith:ele];
    }
    return 0;
}
















