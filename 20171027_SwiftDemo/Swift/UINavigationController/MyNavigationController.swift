//
//  MyNavigationController.swift
//  20171027_SwiftDemo
//
//  Created by qinshaoqing on 2019/9/25.
//  Copyright © 2019 shaoqiu. All rights reserved.
//

import UIKit

class MyNavigationController: UINavigationController, UIGestureRecognizerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.navigationBar.barTintColor = kBarTintColor;//导航颜色
        self.interactivePopGestureRecognizer?.delegate = self;
         /*
          当translucent = YES，controller中self.view的原点是从导航栏左上角开始计算
          当translucent = NO，controller中self.view的原点是从导航栏左下角开始计算
          */
        self.navigationBar.isTranslucent = true;
         
        let titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColorFromRGB(color_vaule: 0xffffff),
                                   NSAttributedStringKey.font : kFontSemibold(size: 17)];
        
        self.navigationBar.titleTextAttributes = titleTextAttributes
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
