//
//  ViewController.swift
//  20171027_SwiftDemo
//
//  Created by shaoqiu on 2017/10/27.
//  Copyright © 2017年 shaoqiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    var backBtn: UIButton?
    var myTableView:UITableView? = nil
    var dataArray = NSMutableArray()
    let cellIdentifier = "testCellID"
    var isEdit = false               // 判断tableview是否在编辑状态
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.backgroundColor = UIColor.white;  // 类方法调用----》用点符号
        
        print("hello world!")
        self.initView()
    }
    
    // 界面将要出现
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true);
        
        self.title = "Swift从入门到转行"
        
        // 隐藏系统导航栏
        //self.navigationController?.navigationBar.isHidden = true;
        
        // 修改导航栏背景色
        self.navigationController?.navigationBar.barTintColor = kBarTintColor
        //UIColor(red: 55/255, green: 186/255, blue: 89/255, alpha: 1)
        
        // 修改导航栏文字颜色
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        // 修改导航栏按钮颜色
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        // 修改导航栏背景图片
        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "icon_ap_settting"), for: .default)
    }
    
    // 跳到下一个界面
    @objc func nextBtnClick(){
        let vc = SwiftUIViewController()
        self.navigationController?.pushViewController(vc , animated: true)
    }
    
    // MARK: - 创建界面
    // 初始化tableview
    func initView() {
        self.dataArray = ["第0行","第1行","第2行","OC","第4行"]
        
        self.myTableView = UITableView(frame:CGRect(x:0, y:0, width:self.view.frame.size.width, height:self.view.frame.size.height - 10), style:UITableViewStyle.plain)
        self.myTableView!.delegate = self
        self.myTableView!.dataSource = self
        self.myTableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        self.view.addSubview(self.myTableView!)
        
        let footerView = UIView.init(frame: CGRect(x:0, y:0, width:self.view.frame.size.width, height:0.5))
        footerView.backgroundColor = UIColor.white
        self.myTableView?.tableFooterView = footerView
    }
    
    // 设置返回的cell的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    // 返回的cell的行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }

    // cell内容的显示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //cell的写法1：
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellIdentifier)
        }
        
        cell!.textLabel!.text = self.dataArray[indexPath.row] as? String
        return cell!
        
        // cell的写法2：
//        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! UITableViewCell
//        cell.textLabel!.text = self.dataArray[indexPath.row] as? String
//        return cell
    }
    
    // cell点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        
        case 0:
            let vc = SwiftUIViewController()
            vc.initNum1 = "1000"
            vc.initNum2 = "2000"
            self.navigationController?.pushViewController(vc , animated: true)
            
        case 1:
            let vc = SwiftViewController2()
            self.navigationController?.pushViewController(vc , animated: true)
            
        case 2:
            let vc = SwiftUIViewController()
            self.navigationController?.pushViewController(vc , animated: true)
            
        case 3:
            print("case 3");
            let vc = OCViewController()
            self.navigationController?.pushViewController(vc , animated: true)
            
        case 4:
            let vc = SwiftViewController3()
            self.navigationController?.pushViewController(vc , animated: true)
            break
            
        default:
            break
        }
    }
}
