//
//  SwiftPCHFile.swift
//  20171027_SwiftDemo
//
//  Created by shaoqiu on 2018/4/27.
//  Copyright © 2018年 shaoqiu. All rights reserved.
//

import UIKit
import SnapKit



//Swift是没有PCH文件的。要达到PCH文件的效果，直接新建一个类，选择语言为Swift，定义常量，当作宏来使用即可。
//OC的PCH文件只能作用于OC文件，故Swift和OC混编，PCH文件分别对应，两个文件定义的常量只能作用于对应的语言的文件


// 通知名
public let QSQ_SuccessNotification = "QSQ_SuccessNotification"



/**
 机型的屏幕大小
 */

let Device_Is_iPhone4 = __CGSizeEqualToSize(CGSize.init(width: 640/3, height: 960/3), UIScreen.main.bounds.size)

let Device_Is_iPhone5 = __CGSizeEqualToSize(CGSize.init(width: 640/3, height: 1136/3), UIScreen.main.bounds.size)

let Device_Is_iPhon6 = __CGSizeEqualToSize(CGSize.init(width: 750/3, height: 1334/3), UIScreen.main.bounds.size)

let Device_Is_iPhone6P = __CGSizeEqualToSize(CGSize.init(width: 1242/3, height: 2208/3), UIScreen.main.bounds.size)

let Device_Is_iPhoneX = __CGSizeEqualToSize(CGSize.init(width: 1125/3, height: 2436/3), UIScreen.main.bounds.size)
 
let Device_Is_iPhoneXr = __CGSizeEqualToSize(CGSize.init(width: 828/2, height: 1792/2), UIScreen.main.bounds.size)
 
let Device_Is_iPhoneXs = __CGSizeEqualToSize(CGSize.init(width: 1125/3, height: 2436/3), UIScreen.main.bounds.size)
 
let Device_Is_iPhoneXs_Max = __CGSizeEqualToSize(CGSize.init(width: 1242/3, height: 2688/3), UIScreen.main.bounds.size)
 
let isIphoneX = (Device_Is_iPhoneX || Device_Is_iPhoneXr || Device_Is_iPhoneXs||Device_Is_iPhoneXs_Max)


// 屏幕宽
public let kScreenWidth = UIScreen.main.bounds.size.width

// 屏幕高
public let kScreenHeight = UIScreen.main.bounds.size.height

// 状态栏高度
public let kStatusBarHeight : CGFloat = ((Device_Is_iPhoneX||Device_Is_iPhoneXr||Device_Is_iPhoneXs||Device_Is_iPhoneXs_Max) ? 44:20)

// 导航栏高度
public let kNavBarHeight : CGFloat = 64

// 状态栏和导航栏总高度
public let kNavBarAndStatusBarHeight : CGFloat = ((Device_Is_iPhoneX||Device_Is_iPhoneXr||Device_Is_iPhoneXs||Device_Is_iPhoneXs_Max) ? 88:64)

// TabBar高度
public let kTabBarHeight : CGFloat = (isIphoneX ? (49.0 + 34.0):(49.0))

// 顶部安全距离，该值取决于(0,0)坐标的位置。若(0,0)在导航栏左下角，取值为0，若(0,0)在导航栏左上角，取值为导航栏的高
public let kTopBarSafeHeight : CGFloat = 0

// 底部安全距离
public let kBottomSafeHeight : CGFloat = ((Device_Is_iPhoneX||Device_Is_iPhoneXr||Device_Is_iPhoneXs||Device_Is_iPhoneXs_Max) ? 34:0)

// 侧滑菜单宽度
public let kLeftTabBarWidth : CGFloat = 112



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

/// 样式  0x5B5B5B
///
/// - Parameters:
///   - color_vaule: 传入0x5B5B5B格式的色值
///   - alpha: 传入透明度
/// - Returns: 颜色
func UIColorFromRGB(color_vaule : UInt64 , alpha : CGFloat = 1) -> UIColor {
    let redValue = CGFloat((color_vaule & 0xFF0000) >> 16)/255.0
    let greenValue = CGFloat((color_vaule & 0xFF00) >> 8)/255.0
    let blueValue = CGFloat(color_vaule & 0xFF)/255.0
    return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alpha)
}


func kFontSystem (size:CGFloat) -> UIFont
{
    return UIFont.systemFont(ofSize: size)
}

func kFontLight (size:CGFloat) -> UIFont
{
    return UIFont.init(name: "PingFangSC-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
}

func kFontMedium (size:CGFloat) -> UIFont
{
    return UIFont.init(name: "PingFangSC-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
}

func kFontSemibold (size:CGFloat) -> UIFont
{
    return UIFont.init(name: "PingFangSC-Semibold", size: size) ?? UIFont.systemFont(ofSize: size)
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


//位移枚举
//public struct UIViewAutoresizing : OptionSetType {
//    public init(rawValue: UInt)
//
//    public static var None: UIViewAutoresizing { get }
//    public static var FlexibleLeftMargin: UIViewAutoresizing { get }
//    public static var FlexibleWidth: UIViewAutoresizing { get }
//    public static var FlexibleRightMargin: UIViewAutoresizing { get }
//    public static var FlexibleTopMargin: UIViewAutoresizing { get }
//    public static var FlexibleHeight: UIViewAutoresizing { get }
//    public static var FlexibleBottomMargin: UIViewAutoresizing { get }
//}
//
////普通枚举
//public enum UIViewAnimationTransition : Int {
//
//    case None
//    case FlipFromLeft
//    case FlipFromRight
//    case CurlUp
//    case CurlDown
//}
//
//
//swift里面位移枚举的用法跟OC就完全不一样了，当你去用按位或的运算符时系统会报错，在swift里面应该用数组来表示：
//
////swift里面位移枚举的定义
//    let option:UIViewAnimationOptions = [.repeat, .layoutSubviews]
//
////swift里面普通枚举的定义
//    let option:UIViewAnimationTransition = .flipFromLeft
