//
//  SwiftViewController3.swift
//  20171027_SwiftDemo
//
//  Created by shaoqiu on 2018/4/27.
//  Copyright © 2018年 shaoqiu. All rights reserved.
//

import UIKit

class SwiftViewController3: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    var backBtn: UIButton?
    var myTableView:UITableView? = nil
    var dataArray = NSMutableArray()
    var isEdit = false               // 判断tableview是否在编辑状态
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.backgroundColor = UIColor.white;  //类方法调用----》用点符号
        
        self.getData()
        self.initView()
    }
    
    //界面将要出现
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true);
        
        self.title = "SwiftViewController3"
        
        //修改导航栏背景色
        self.navigationController?.navigationBar.barTintColor = kBarTintColor

        //修改导航栏文字颜色
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        //修改导航栏按钮颜色
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    // MARK: - 创建界面
    //初始化tableview
    func initView() {
        self.myTableView = UITableView(frame:CGRect(x:0, y:0, width:self.view.frame.size.width, height:self.view.frame.size.height - 10), style:UITableViewStyle.plain)
        self.myTableView!.delegate = self
        self.myTableView!.dataSource = self
        self.myTableView?.register(UITableViewCell.self, forCellReuseIdentifier: "SwiftViewController3")
        self.view.addSubview(self.myTableView!)
        
        let footerView = UIView.init(frame: CGRect(x:0, y:0, width:self.view.frame.size.width, height:0.5))
        footerView.backgroundColor = UIColor.white
        self.myTableView?.tableFooterView = footerView
    }
    
    
    //设置返回的cell的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    //返回的cell的行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    //cell内容的显示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SwiftViewController3", for: indexPath)
        let model : SwiftDataModel = self.dataArray[indexPath.row] as! SwiftDataModel
        cell.textLabel!.text = model.stuName
        
        return cell
    }
    
    //cell点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            break
//            let vc = SwiftUIViewController()
//            vc.initNum1 = "1000"
//            vc.initNum2 = "2000"
//            self.navigationController?.pushViewController(vc , animated: true)
            
        default:
            break
        }
    }
    
    // 获取数据
    func getData() {
        
        for i in 1...10 {
            
            let model : SwiftDataModel = SwiftDataModel(name: String(format: "student %d", arguments: [i]), age: 15 + i, height: Double(160 + i), score: 100)
            
            self.dataArray.add(model);
        }
    }
}

