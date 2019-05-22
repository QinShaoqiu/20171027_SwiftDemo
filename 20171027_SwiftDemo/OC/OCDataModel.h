//
//  OCDataModel.h
//  20171027_SwiftDemo
//
//  Created by shaoqiu on 2018/4/27.
//  Copyright © 2018年 shaoqiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OCDataModel : NSObject
@property (nonatomic, copy) NSString *stuName;
@property (nonatomic, assign) int stuAge;
@property (nonatomic, assign) double stuHeight;

- (instancetype)initWithName:(NSString *)name age:(int)age height:(double)height;
- (void)changeStuname:(NSString *)newName;
@end
