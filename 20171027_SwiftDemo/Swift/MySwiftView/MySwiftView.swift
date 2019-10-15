//
//  MySwiftView.swift
//  20171027_SwiftDemo
//
//  Created by shaoqiu on 2017/11/13.
//  Copyright © 2017年 shaoqiu. All rights reserved.
//

import UIKit

class MySwiftView: UIView {
    // 1 声明变量
    var myImageView: UIImageView?
    
    // 2 初始化视图
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white;
        myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        myImageView?.backgroundColor = UIColor.cyan
        self.addSubview(myImageView!)
        
        //接受通知监听
        self.addObserver()
              
    }
    
    func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(receiveNotification(noti:)), name: NSNotification.Name(rawValue: QSQ_SuccessNotification), object: nil)
    }
        
    @objc func receiveNotification(noti: Notification) {
        print("收到通知啦");
    }
    
    
    // 3 增加设置图片方法
    func addImage(image: UIImage) {
        myImageView?.image = image
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
