//
//  ExampleNaviController.swift
//  JHB_HUDViewExample
//
//  Created by Leon_pan on 16/8/23.
//  Copyright © 2016年 bruce. All rights reserved.
//

import UIKit

class ExampleNaviController: UINavigationController ,UIGestureRecognizerDelegate,UINavigationControllerDelegate{
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // ❤️通过这一步,可以实现被删除掉的侧滑功能!!!!❤️
            if self.respondsToSelector(Selector.init("interactivePopGestureRecognizer")) {
                self.interactivePopGestureRecognizer!.delegate = self
            }
        }
        // ❤️1⃣️在重写pushViewController方法中来设置NavigationController下的根控制器的返回按钮
        override func pushViewController(viewController: UIViewController, animated: Bool) {
            super.pushViewController(viewController, animated: true)
            // ❤️重写返回按钮
            if viewController.isKindOfClass(ExampleMainController) {
                
            }else {
                let newBackButton = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ExampleNaviController.back(_:)))
                viewController.navigationItem.leftBarButtonItem = newBackButton;
            }
        }
        // ❤️2⃣️当然也可以在各个跟控制器中来设置新样式的navigationItem来代替原有的
        /*
         // ①隐藏原有
         self.navigationItem.hidesBackButton = true
         // ②创建新的
         let newBackButton = UIBarButtonItem(title: "<Back", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(publicNavController.back(_:)))
         // ③赋值替换
         self.navigationItem.leftBarButtonItem = newBackButton;
         */
        
        func back(sender: UIBarButtonItem) {
            // Perform your custom actions
            // ...
            // Go back to the previous ViewController
            self.popViewControllerAnimated(true)
        }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
}
