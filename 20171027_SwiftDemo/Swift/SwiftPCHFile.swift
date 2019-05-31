//
//  SwiftPCHFile.swift
//  20171027_SwiftDemo
//
//  Created by shaoqiu on 2018/4/27.
//  Copyright © 2018年 shaoqiu. All rights reserved.
//

import UIKit

//Swift是没有PCH文件的。要达到PCH文件的效果，直接新建一个类，选择语言为Swift，定义常量，当作宏来使用即可。
//OC的PCH文件只能作用于OC文件，故Swift和OC混编，PCH文件分别对应，两个文件定义的常量只能作用于对应的语言的文件

public let kScreenWidth = UIScreen.main.bounds.size.width
public let kScreenHeight = UIScreen.main.bounds.size.height
public let kNavHeight : CGFloat = 64

// 当前系统版本
public let  version = (UIDevice.current.systemVersion as NSString).floatValue
// Swift获取唯一标识
public let uniqueString = ProcessInfo.processInfo.globallyUniqueString

// cache文件路径
public let cachesPath: String = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last!
public let userDefault = UserDefaults.standard

// UserDefaults存储数据
func save_userDefaults(key : String,value:AnyObject?){
    userDefault.set(value!, forKey:key)
}

//主题配置
/* APP导航条barButtonItem文字大小 */
public let kNavItemFont: UIFont = UIFont.systemFont(ofSize: 16)

/* APP导航条titleFont文字大小 */
public let kNavTitleFont: UIFont = UIFont.systemFont(ofSize: 18)

/* ViewController的背景颜色 */
public let kBackgroundColor: UIColor = kRGBA(r: 255, g: 255, b: 255, a: 1)

/* webView的背景颜色 */
public let kWebViewBacagroundColor: UIColor = kRGBA(r: 245, g: 245, b: 245, a: 1)

/* 导航栏背景颜色 */
public let kBarTintColor: UIColor = kRGBA(r: 55, g: 186, b: 89, a: 1)

// 通知中心
public let notice = NotificationCenter.default


// 根据键盘监控  获取键盘高度
func getKeyBoardHeight(aNotification : NSNotification)->CGFloat{
    let uInfo   = aNotification.userInfo as NSDictionary?
    let avalue = uInfo!["UIKeyboardFrameEndUserInfoKey"] as! NSValue
    let keyrect : CGRect = avalue.cgRectValue
    let keyheight : CGFloat = keyrect.size.height;
    return keyheight
}


// 字符串转数组
func stringToArray(str:String)->NSArray{
    var dataArray:[String] = []
    for items in str{
        dataArray.append("\(items)")
    }
    return dataArray as NSArray
}


/**
 加载Xib
 - parameter nibName: Xib名字
 - returns: AnyObject
 */
func kloadNibNamed(nibName:String)-> AnyObject
{
    return Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)!.first! as AnyObject
}


func kRegisterNib(nibName:String)-> UINib
{
    return UINib(nibName: nibName, bundle: nil)
}


// View
// RGBA函数
func kRGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor
{
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}


// MARK: - ViewW
func kViewW (v:UIView) -> CGFloat
{
    return v.frame.size.width
}


// MARK: - ViewH
func kViewH (v:UIView) -> CGFloat
{
    return v.frame.size.height
}


// MARK: - ViewX
func kViewX (v:UIView) -> CGFloat
{
    return v.frame.origin.x
}


// MARK: - ViewY
func kViewY (v:UIView) -> CGFloat
{
    return v.frame.origin.y
}


// MARK: - ViewXW
func kViewXW (v:UIView) -> CGFloat
{
    return v.frame.origin.x + v.frame.size.width
}


// MARK: - ViewYH
func kViewYH (v:UIView) -> CGFloat
{
    return v.frame.origin.y + v.frame.size.height
}


// 调试相关
// MARK: - 快速打印代码执行时间
/*
 *TICK
 code 代码块
 *TOCK
 */
let TICK = NSDate()
let TOCK: () = print("Time:\(-TICK.timeIntervalSinceNow)")


class SwiftDataModel: NSObject {
    var stuName: String?
    var stuAge: Int = 0
    var stuHeight: Double = 0  // 默认是0
    let totalScore: Int   // 在Swift中let声明的值是不变量，无法被写入赋值
    
    required init(name: String, age: Int, height: Double, score: Int ) {
        stuName = name;
        stuAge = age;
        stuHeight = height;
        totalScore = score;
    }
    
    func changeStuName(newName: String) {
        stuName = newName
    }
}


