//
//  SwiftUIViewController.swift
//  20171027_SwiftDemo
//
//  Created by shaoqiu on 2017/11/13.
//  Copyright © 2017年 shaoqiu. All rights reserved.
//

import UIKit

class SwiftUIViewController: UIViewController {
    
    // 属性，因为Swift中要求变量或常量在声明时就要初始化其值，所以我们在实际开发中，声明变量或常量时使用可选类型。
    // 将变量全部进行拆包处理，就是在变量声明的时候加一个？号，在使用的时候拆包处理，加一个！号：
    // 在Swift中，private成员不仅仅被当前类，而且能被在当前swift源文件的任何作用域被访问。但是在其它Swift源文件中就无法访问了。Swift中对访问权限设置得比较松弛。
    private var backBtn: UIButton?
    private var numTF1: UITextField?
    private var numTF2: UITextField?
    private var resLab: UILabel?
    private var calculatorBtn: UIButton?
    public var initNum1: String? = nil;
    public var initNum2: String? = nil;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        
        // 返回
        backBtn = UIButton(type: .system);
        backBtn!.frame = CGRect(x: 20, y: 64, width: 70, height:50);
        backBtn!.backgroundColor = UIColor.blue;
        backBtn!.setTitle("返回", for:.normal)
        backBtn!.setTitleColor(UIColor.white, for: .normal)
        self.view.addSubview(backBtn!);
        backBtn!.addTarget(self, action:#selector(backBtnClick), for:.touchUpInside)
        
        numTF1 = UITextField(frame: CGRect(x: 20, y:  backBtn!.frame.origin.y + backBtn!.frame.size.height + 20, width: 200, height: 50));
        numTF1!.keyboardType = UIKeyboardType.numberPad      // 键盘
        numTF1!.placeholder = "数字1"
        numTF1!.clearButtonMode = .whileEditing              // 编辑时出现清除按钮
        numTF1!.adjustsFontSizeToFitWidth = true             // 当文字超出文本框宽度时，自动调整文字大小
        numTF1!.minimumFontSize = 14                         // 最小可缩小的字号
        numTF1!.borderStyle = UITextBorderStyle.roundedRect  // 设置边框样式为圆角矩形
        numTF1!.layer.masksToBounds = true                   // 修改圆角半径的话需要将masksToBounds设为true
        numTF1!.layer.cornerRadius = 12.0                    // 圆角半径
        numTF1!.layer.borderWidth = 2.0                      // 边框粗细
        numTF1!.layer.borderColor = UIColor.red.cgColor      // 边框颜色
        self.view.addSubview(numTF1!);
        
        numTF2 = UITextField(frame: CGRect(x: 20, y: numTF1!.frame.origin.y + numTF1!.frame.size.height + 20, width: 200, height: 50));
        numTF2!.keyboardType = UIKeyboardType.numbersAndPunctuation
        numTF2!.placeholder = "数字2"
        numTF2!.clearButtonMode = .whileEditing
        numTF2!.adjustsFontSizeToFitWidth = true
        numTF2!.minimumFontSize = 14
        numTF2!.borderStyle = UITextBorderStyle.roundedRect
        numTF2!.layer.masksToBounds = true
        numTF2!.layer.cornerRadius = 12.0
        numTF2!.layer.borderWidth = 2.0
        numTF2!.layer.borderColor = UIColor.red.cgColor
        self.view.addSubview(numTF2!);
        
        numTF1?.text = initNum1
        numTF2?.text = initNum2
        
        resLab = UILabel(frame:CGRect(x: 20, y: numTF2!.frame.origin.y + numTF2!.frame.size.height + 20, width: 200, height: 50))
        resLab!.text = "0"
        resLab!.textColor = UIColor.black                     // 文字
        resLab!.backgroundColor = UIColor.white               // 背景
        resLab!.textAlignment = .left                         // 文字左对齐
        resLab!.shadowColor = UIColor.gray                    // 灰色阴影
        resLab!.shadowOffset = CGSize(width:1, height:1)      // 阴影的偏移量
        resLab!.font = UIFont(name:"Zapfino", size:20)
        resLab!.adjustsFontSizeToFitWidth = true              // 当文字超出标签宽度时，自动调整文字大小，使其不被截断
        resLab!.numberOfLines = 2                             // 显示两行文字（默认只显示一行，设为0表示没有行数限制）
        resLab!.layer.masksToBounds = true                   // 修改圆角半径的话需要将masksToBounds设为true
        resLab!.layer.cornerRadius = 12.0                    // 圆角半径
        resLab!.layer.borderWidth = 2.0                      // 边框粗细
        resLab!.layer.borderColor = UIColor.purple.cgColor   // 边框颜色
        self.view.addSubview(resLab!);
        
        // 计算
        calculatorBtn = UIButton(type: .system); // 前面不带图标，默认文字颜色为蓝色，有触摸时的高亮效果
        calculatorBtn!.frame = CGRect(x: 20, y: resLab!.frame.origin.y + resLab!.frame.size.height + 20, width: 200, height: 50);
        calculatorBtn!.backgroundColor = UIColor.white;
        calculatorBtn!.setTitle("计算", for:.normal)
        calculatorBtn!.setTitleColor(UIColor.black, for: .normal)  // 普通状态下文字的颜色
        calculatorBtn!.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        calculatorBtn!.layer.masksToBounds = true                   // 修改圆角半径的话需要将masksToBounds设为true
        calculatorBtn!.layer.cornerRadius = 12.0                    // 圆角半径
        calculatorBtn!.layer.borderWidth = 2.0                      // 边框粗细
        calculatorBtn!.layer.borderColor = UIColor.purple.cgColor      // 边框颜色
        calculatorBtn!.tag = 10086
        self.view.addSubview(calculatorBtn!);
        
        // 监控按钮点击事件
        calculatorBtn!.addTarget(self, action:#selector(addFunc), for:.touchUpInside)
        
        // 自定义view
        let myView = MySwiftView();
        myView.frame = CGRect(x: 20, y: calculatorBtn!.frame.origin.y + calculatorBtn!.frame.size.height + 20, width: kScreenWidth - 40, height: 50);
        myView.backgroundColor = UIColor.orange
        myView.layer.cornerRadius = 12.0                       // 圆角半径
        myView.layer.borderWidth = 2.0                         // 边框粗细
        myView.layer.borderColor = UIColor.purple.cgColor      //边框颜色
        myView.tag = 10086
        myView.addImage(image: UIImage(named: "icon_ap_settting")!) // 设置图片
        self.view.addSubview(myView);
        
    }

    
    // 隐藏系统导航栏
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true);
        //self.navigationController?.navigationBar.isHidden = true;
    }
    
    // 点击空白，隐藏键盘
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        numTF1?.resignFirstResponder()
        numTF2?.resignFirstResponder()
    }
    
    
    // 求和
    @objc private func addFunc(_ button:UIButton){
        if numTF1!.text!.count == 0{
            numTF1?.text = "0";
        }
        
        if numTF2!.text!.count == 0{
            numTF2?.text = "0";
        }
        
        print("tag====",button.tag);
        let num1:(Int) = Int(numTF1!.text!)!
        let num2:(Int) = Int(numTF2!.text!)!
        
        resLab!.text = String(num1 + num2)
    }
    
    // Swift中所有的变量和方法默认都是暴露的,在其他的类中也可以访问。当要将一个变量或者方法私有化时,就需要在对应的变量或者方法前面加上 private 修饰符即可。
    // 然而,当程序运行后,按钮一旦被点击,就会报错,错误信息的大意是找不到监听按钮的点击这个方法。只要在监听按钮的私有方法前面加上@objc,便可解决这个问题。

    // 究其原因,是由于Swift是静态语言,当程序运行前就已经将所有的要运行的方法与变量分配好了存储空间,但是按钮点击这种不知道何时会调用的方法,就无法在这个时候获得属于其的存储空间了。所以在程序运行过程中,无法识别到这个方法的存在。
    // 当添加@objc修饰之后,意味这个方法还是遵循Objective - C的动态分配存储空间规则(Objective - C是动态语言)。所以这样一来,当需要调用这个监听按钮点击方法的时候,便能动态添加到了内存中进行运行。
    
//    @objc private func addFunc(_ button:UIButton){
//        print("点击按钮调用这个私有方法")
//    }
    
    // 返回
    @objc func backBtnClick(){
        numTF1?.resignFirstResponder()
        numTF2?.resignFirstResponder()
        self.navigationController?.popViewController(animated: true);
    }
}
