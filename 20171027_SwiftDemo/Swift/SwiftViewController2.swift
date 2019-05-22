//
//  SwiftViewController2.swift
//  20171027_SwiftDemo
//
//  Created by shaoqiu on 2017/11/13.
//  Copyright © 2017年 shaoqiu. All rights reserved.
//

import UIKit

class SwiftViewController2: UIViewController {
    var backBtn: UIButton?
    var numTF1: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        
        // UI 相关
        //返回
        backBtn = UIButton(type: .system);
        backBtn!.frame = CGRect(x: 20, y: 64, width: 70, height:50);
        backBtn!.backgroundColor = UIColor.blue;
        backBtn!.setTitle("返回", for:.normal)
        backBtn!.setTitleColor(UIColor.white, for: .normal)
        self.view.addSubview(backBtn!);
        backBtn!.addTarget(self, action:#selector(backBtnClick), for:.touchUpInside)
        
        numTF1 = UITextField(frame: CGRect(x: 20, y:  backBtn!.frame.origin.y + backBtn!.frame.size.height + 20, width: 200, height: 50));
        numTF1!.keyboardType = UIKeyboardType.numberPad      //键盘
        numTF1!.placeholder = ""
        numTF1!.clearButtonMode = .whileEditing              //编辑时出现清除按钮
        numTF1!.adjustsFontSizeToFitWidth = true             //当文字超出文本框宽度时，自动调整文字大小
        numTF1!.minimumFontSize = 14                         //最小可缩小的字号
        numTF1!.borderStyle = UITextBorderStyle.roundedRect  //设置边框样式为圆角矩形
        numTF1!.layer.masksToBounds = true                   //修改圆角半径的话需要将masksToBounds设为true
        numTF1!.layer.cornerRadius = 12.0                    //圆角半径
        numTF1!.layer.borderWidth = 2.0                      //边框粗细
        numTF1!.layer.borderColor = UIColor.red.cgColor      //边框颜色
        numTF1?.text = "0";
        self.view.addSubview(numTF1!);
        
        
        /**
         基本数据类型
         1.整数:      Int
         2.浮点数:     Double
         3.布尔类型:   Bool
         4.字符串:     String
         5.字符:      Character
         */
        
        //switf定义变量或常量时，可以不指定数据类型
        
        //变量:值能被修改,var 修饰
        var doubleValue1:Double = 20;
        doubleValue1 = 10;
        
        //常量:值不能被修改,let 修饰
        let intValue1:Int = 30 ;
        print("doubleValue1 = ",doubleValue1,"intValue1 = %d",intValue1,"\n");
        
        //不指定类型的话，系统会会自动推导声明的变量或常量的数据类型
        let testStr = "testStr";
        let intValue2 = 10;
        print("testStr == ",testStr,"intValue2 == ",intValue2,"\n");
        
        /**
         基本运算
         */
        let intValue3:Int = 3;
        let intValue4:Int = intValue3;
        let intValue5:Int = intValue4;
        print("intValue3 == ",intValue3,"intValue4 == ", intValue4, "intValue5 == %@",intValue5,"\n");
        
        let intValue6:Int = intValue4 + intValue5;
        print(intValue4,"+",intValue5,"==",intValue6,"\n");
        
        //任何情况下都不会做隐式转化，必须以相同类型进行计算
        let testNum1:Int = 2;
        let testNum2:Double = 0.5;
        let testNum3 = Double(testNum1) / testNum2;        //必须要显式类型的转化
        print(testNum1,"/",testNum2,"==",testNum3,"\n");
        
        
        // 8.空合运算(Nil Coalescing Operator)
        /**
         可选值:可以有值,可以为nil(用 ? 表示可选值)
         1.空合运算符( a ?? b )将对可选类型 a 进行空判断(可选项内容详见:04-可选项)
         2.如果为nil，则返回 ?? 后面的，否则执行aName（注意??两边都有空格）
         */
        var testStr2: String? = nil;
        testStr2 = "not nil";
        let testStr3 = testStr2 ?? "is nil"
        print(testStr3 + "\n");
        
        // var 的可选项默认为 nil
        //var testNum4:Int?
        ///print(testNum4 ?? "is nil")
        //print("\n")
        
        
        // URL 为可选项 // if let : 确保有值，才会进入分支
        print("\n");
        print("if let : 确保有值，才会进入分支");
        let testURL = NSURL(string: "http://www.baidu.com/");
        if let testURL2 = testURL{
            print(testURL2,"\n")
        }
        
        
        
        /*************************** guard let ********************
         1.guard let 和 if let 相反。表示一定有值,没有就直接返回
         2.降低分支层次结构
         3.playground不能展示效果，要在函数中展示
         ****/
        
        print("guard let :一定有值,没有就直接返回");
        
        // 创建一个类
        class guardTest{
            func guardTestFunction(){
                let myNickName: String? = "shaoqinggexia"
                let myAge: Int? = 22
                
                guard let nick = myNickName ,let age = myAge  else {
                    print("myNickName myAge is nil")
                    return
                }
                print("guard let:  myNickName ", nick,"  myAge  ", String(age))
            }
            
        }
        let guardTestObject = guardTest();
        guardTestObject.guardTestFunction();
        
        
        // 创建一个数组
        /**
         1.dataArr? 表示 dataArr 可能为 nil
         2.如果为 nil, .count 不会报错，仍然返回 nil
         2.如果不为 nil，.count执行，返回数组元素个数
         **/
        
        print("\n");
        print("===========数组==========");
        var dataArr:[String]?;
        dataArr = ["11","22","33","44"];
        let count = dataArr?.count ?? 0;
        let count2 = dataArr!.count;    // 表示 dataArr 一定有值,否则会出错！
        print("count == ",count,"  count2 == ",count2);
        
        
        /**if语句
         1.必须要有大括号
         2.没有"非零即真"的概念，只有ture／false,意思是，if 3 不是true
         */
        print("\n");
        print("========= if语句 ===========");
        let testNum5 = 20;
        if testNum5 > 10{
            print("testNum5 = ",testNum5," > 10");
        }
        
        /**
         switch
         1.值可以是任何类型
         2.作用域仅在 case 内部
         3.不需要 break
         4.每一个 case 都要有代码
         */
        print("\n");
        print("========= switch语句 ===========")
        let testNum6:Int = Int(numTF1!.text!)!
        
        switch testNum6 {
        case 0:
            print("case 0");
            
        case 1:
            print("case 1");
            
        case 2:
            print("case 2");
            
        case 3:
            break;  //相当于有一行代码
            
        default:
            print("other");
            break;
        }
        
        
        /***************************for循环*************************/
        print("========= for循环 ===========")
        
        for i in 1...5 {
            print("闭区间1...5    i == ",i);
        }
        
        print("\n");
        for i in 1..<5 {
            print("半开区间1..<5  i == ",i);
        }
        
        // 递增(步数为2)
        print("\n");
        for i in stride(from: 0, to: 12, by: 2) {
            print("步长循环 递增 0..<12   ",i)
        }
        
        // 递减
        print("\n");
        for i in stride(from: 12, to: 0, by: -2) {
            print("步长循环 递减 0..<12   ",i)
        }
        
        //反序循环
        print("\n");
        let range = 0...5
        for i in range.reversed(){
            print("反序循环0...5   ",i)
        }
        
        
        /***************************while循环*************************/
        print("\n");
        var n = 2
        while n < 100 {
            n = n * 2;
            print("while循环 n < 100      ", n)
        }
        
        /***************************epeat-while循环*************************/
        //它和 while 的区别是在判断循环条件之前，先执行一次循环的代码块。然后重复循环直到条件为 false
        print("\n");
        var m = 200
        repeat {
            m = m * 2
            print("epeat-while循环 m < 100      ", m)
        } while m < 100

        
        /**********************************************************************
         1.String 结构体，效率比对象高，一般推荐使用，支持遍历
         2.NSString 继承NSObject
         **********************************************************************/
        print("\n");
        print("========= String =========");
        let testStr5:String = "Hello world～～"

        // 字节数量
        print("Bytes count  ",testStr5.lengthOfBytes(using: .utf8))
        
        // 字符串长度
        print("\n");
        print("string count  ", testStr5.count)
        
        print("\n");
        for ch in testStr5{
            print(testStr5," ch = ",ch)
        }
        
        
        // 字符串拼接
        print("\n");
        let name:String? = "老王"
        let age = 80
        let location = "隔壁"
        print(location, (name ?? "a"),String(age),"岁")

        // 格式字符串
        print("\n");
        let hour = 13
        let minute = 5
        let second = 9
        let timeStr = String(format: "%02d:%02d:%02d", arguments: [hour,minute,second])
        let timeStr1 = String(format: "%02d:%02d:%02d", hour,minute,second)
        print("timeStr = ",timeStr,"timeStr1 = ",timeStr1);
        
        /**********************************************************************
         1.在Swift中使用 Range，最好把 String 改成 NSString
         2.str.substring(with: Range<String.Index>) 很麻烦
         3. '值 as 类型' 作为类型转换
         let newStr = String(str[..<index]) // = str.substring(to: index) In Swift 3
         let newStr = String(str[index...]) // = str.substring(from: index) In Swif 3
         let newStr = String(str[range]) // = str.substring(with: range) In Swift 3
         **********************************************************************/
        print("\n");
        
        //截取字符串(a,b)
        let testStr6 = (testStr5 as NSString).substring(with: NSMakeRange(2, 5))
        print(testStr5,"(2, 5)  testStr6 = ",testStr6);

        //截取字符串(index,~)
        let index = testStr5.index(testStr5.startIndex, offsetBy: 3)
        let testStr7 = String(testStr5[index...])
        print(testStr5,"from 3  testStr7 = ",testStr7);
        
        //截取字符串(0,index)
        let testStr8 = String(testStr5[..<index])
        print(testStr5,"0 to: 3  testStr9 = ",testStr8);
        
        //截取字符串,从某个string开始
        let testStr9 = String(testStr5["wo".endIndex...])
        print(testStr5,"from: wo  testStr9 = ",testStr9);
        
        
        // String 使用 Range
        let myRange = testStr5.startIndex..<testStr5.index(testStr5.startIndex, offsetBy: 5)
        let testStr10 = String(testStr5[myRange])
        print(testStr5,"Range 0-5 testStr10 = ",testStr10);
        
        let myRange1 = index..<testStr5.index(testStr5.startIndex, offsetBy: 5)
        let testStr11 = String(testStr5[myRange1])
        print(testStr5,"Range 3< <= 5  testStr11 = ",testStr11);
        
        
        // 元组的元素个数固定，不允许增加、删除
        print("\n");
        var student = (404,"小白")
        print("student = ",student)
        
        // 支持嵌套
        print("\n");
        let msg = ("基本信息", ("李玉刚",34))
        print("msg = ",msg)
        
        print("\n");
        let (a,b) = student
        print("student a = ",a," b = ",b)
        
        //如果仅需要元组中的个别的值，可以使用"_"的方式来处理不需要的值
        let (c,_) = student
        print("student c = ",c)
        
        //通过序号获得元组的值
        print("student is", student.0, student.1)
        
        // 可以修改
        student.0 = 500
        print("student is", student)
        
        let message = (status: 100, msg:"哈哈")
        print("message.status ",message.status," message.msg",message.msg)
        
        
        
        /***************************数组定义*************************/
        print("\n");
        print("************数组定义************")
        
        //方括号 [] 来创建数组
        let array1 = ["11","22","33","33"]
        print("array1 = ", array1)
        
        let array2 = [1,2,3,4,5]
        print("array2 = ", array2)
        
        // 定义一个数组（没有初始化）
        var array3:[Int]
        array3 = [Int]()    //初始化
        array3.append(100);
        print("array3 = ", array3)
        
        //声明空数组,（必须初始化
        var array4 = [String]()
        array4.append("200");
        print("array4 = ", array4)
        
        //数组装入不同类型数据
        let array5:[Any] = ["zhangsan","lisi",20]
        print("array5 = ", array5)
        
        //初始化1个长度固定的数组
        let array6 = [Double](repeating: 0.0, count: 3) //[0.0, 0.0, 0.0]
        print("array6 = ", array6)
        
        let array7 = Array(repeating: 3.0, count: 3)  //[3.0, 3.0, 3.0]
        print("array7 = ", array7)
        
        //数组的count
        let array8: [String] = ["Alex", "Brian", "Dave"]
        print("array8.count ",array8.count,"array8 = ",array8)
        
        
        /***************************数组遍历*************************/
        print("\n");
        var array9: [String] = ["qiuqiu", "fengfeng", "pingping"]
        
        for name in array9{
            print("array9 遍历 = ",name)
        }
        
        print("\n");
        for i in 0..<array9.count{
            print("array9 遍历2 = ",array9[i])
        }
        
        // 同时遍历下标和内容
        print("\n");
        for e in array9.enumerated(){
            print("array9 遍历3 = ",e," offset ",e.offset," element ",e.element)
        }
        
        // 反序遍历
        print("\n");
        for a in array9.reversed(){
            print("array9 反序遍历 = ",a)
        }
        
        /***************************数组增删改*************************/
        // 追加
        print("\n");
        array9.append("dandan")
        for a in array9.reversed(){
            print("array9 追加 = ",a)
        }
        
        // 合并(类型必须一致)
        var array10 = ["果果","老刘","老汪","老王"]
        print("\n");
        print("array10 = ",array10)
        
        array9 += array10
        for a in array9.reversed(){
            print("array9 array10 合并 = ",a)
        }
        
        print("\n");
        print("array10 = ",array10)
        
        // 修改
        array10[0] = "tony"
        print("array10 修改 0 = tony ",array10)
        
        // 删除
        array10.removeFirst()
        print("array10 删除 0 = ",array10)
        
        array10.remove(at: 1)
        print("array10 删除 1 = ",array10)
        
        // 删除全部并保留空间
        array10.removeAll(keepingCapacity: true)
        print("array10 删除全部并保留空间,数组容量  = ",array10.capacity)
        print("array10 = ",array10)
        
        /***************************容量*************************/
        print("\n");
        var array11 = [1,2,3,4,5,6,7,8,9,0]
        print("array11 = ", array11)
        
        // 容量每次增加，都会在原来基础上 * 2,而不是等于数组的count
        //例如，数组初始容量为10，若往数组中添加3个元素，数组容量 10 -> 10*2 = 20，
        //若往数组中添加11个元素，数组容量 10 -> 10*2 = 20 -> 20*2 = 40
        print("\n");
        print("初始容量 ",array11.capacity)
        for i in 0..<11{
            array11.append(i)
            print("array11 容量 ",array11.capacity)
        }
        
        
        
        /***************************数组定义*************************/
        print("\n");
        let testArr2 = [
            ["name":"lisi","age":"18"],
            ["name":"wangwu","age":8]
        ];
        print("testArr2 = ",testArr2);
        
        print("\n");
        let testArr3:[[String:Any]] = [
            ["name":"lisi","age":"18"],
            ["name":"wangwu","age":8]
        ];
        print("testArr3 = ",testArr3);
        
        
        /***************************字典增删改*************************/
        print("\n");
        //方括号 [] 来创建字典
        let testDict？ = ["name":"lisi","age":"18"];
        print("testDict = ",testDict？);
        
        
        // 不同类型必须指明为 any
        var testDict2:[String:Any] = ["name":"lisi","age":18];
        print("testDict2[\"age\"]",testDict2["age"] ?? "nil");
        
        // 增加
        testDict2["sex"] = "man";
        print("testDict2 add sex",testDict2);
        
        // 修改（通过key来取值，key不存在就是新增）
        testDict2["name"] = "qiuqiu";
        print("testDict2 修改 name",testDict2);
        
        // 删除(直接给key进行删除)
        testDict2.removeValue(forKey: "age")
        print("testDict2 删除 age",testDict2);
        
        
        /***************************字典遍历*************************/
        print("\n");
        for temp in testDict2{
            //temp 为元组
            print("字典遍历testDict2 = ","temp.key = ",temp.key," temp.value = ",temp.value);
        }
        
        // key value 可以随意更改
        print("\n");
        for (key,value) in testDict2{
            print("字典遍历testDict2 = ","key ",key," value = ",value);
        }
        
        /***************************字典合并*************************/
        print("\n");
        
        var testDict3:[String:Any] = ["name":"老张","age":18,"sex":"man"]
        let testDict4:[String:Any] = ["name":"老王","height":50]
        print("testDict3 = ",testDict3);
        print("testDict4 = ",testDict4);
        
        // 如果key存在修改  不存在会增加
        print("\n");
        for temp in testDict4{
            testDict3[temp.key] = testDict4[temp.key]
        }
        print("testDict4 合并到 testDict3 = ",testDict3)
        print("testDict4 = ",testDict4)
        
    }
    
    
    //隐藏系统导航栏
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true);
        //self.navigationController?.navigationBar.isHidden = true;
    }
    
    //点击空白，隐藏键盘
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        numTF1?.resignFirstResponder()
    }
    
    //返回
    @objc func backBtnClick(){
        numTF1?.resignFirstResponder()
        self.navigationController?.popViewController(animated: true);
    }

}
