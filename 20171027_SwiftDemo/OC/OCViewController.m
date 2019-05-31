//
//  OCViewController.m
//  20171027_SwiftDemo
//
//  Created by shaoqiu on 2017/11/14.
//  Copyright © 2017年 shaoqiu. All rights reserved.
//

/**
 创建桥接文件
 1，新建头文件，命名。
 2，在Build Settings 搜索brid，找到 Objctive-C Bridging Header，双击右边部分，将刚才建好的桥接文件直接拖入，会自动引用路径；
 3，将需要桥接的文件import进上面创建的桥接文件中。
 */

#import "OCViewController.h"

@interface OCViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *optionTableView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation OCViewController

- (NSMutableArray *)dataArr{
    
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc] init];
    }
    
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"OCViewController");
    self.title = @"OCViewController";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backBtnDone)];
    
    [self getData];
    
    _optionTableView = [[UITableView alloc] initWithFrame:(CGRect){0, 64, KWidth, KHeight - 64}];
    _optionTableView.backgroundColor = [UIColor whiteColor];
    _optionTableView.delegate = self;
    _optionTableView.dataSource = self;
    _optionTableView.rowHeight = 50;
    [self.view addSubview:self.optionTableView];
    
    if (@available(iOS 11.0, *)) {
        self.optionTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (void)backBtnDone{
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OCVCCellIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"OCVCCellIdentifier"];
    }
    
    OCDataModel *model = self.dataArr[indexPath.row];
    cell.textLabel.text = model.stuName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)getData{
    
    for (int i = 0; i < 10; i++) {
        OCDataModel *model = [[OCDataModel alloc] initWithName:[NSString stringWithFormat:@"student %d", i + 1] age:i + 10 height:160.00 + i];
        [self.dataArr addObject:model];
    }
}

@end
