//
//  OCDataModel.m
//  20171027_SwiftDemo
//
//  Created by shaoqiu on 2018/4/27.
//  Copyright © 2018年 shaoqiu. All rights reserved.
//

#import "OCDataModel.h"

@implementation OCDataModel

- (instancetype)initWithName:(NSString *)name age:(int)age height:(double)height{
    if (self = [super init]) {
        self.stuName = name;
        self.stuAge = age;
        self.stuHeight = height;
    }
    return self;
}


- (void)changeStuname:(NSString *)newName{
    self.stuName = newName;
}

@end
