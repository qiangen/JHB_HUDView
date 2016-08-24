/****************** JHB_HUDTopViewController.swift ****************/
/*******  (JHB)  ************************************************/
/*******  Created by Leon_pan on 16/8/22. ***********************/
/*******  Copyright © 2016年 CoderBala. All rights reserved.*****/
/****************** JHB_HUDTopViewController.swift ****************/

import UIKit
class JHB_HUDTopViewController: UIViewController{
    
    var kIfCanRotated: Bool = true
    var orientation = UIDevice.currentDevice().orientation
    
    // MARK: - Interface
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(JHB_HUDTopViewController.cannotRotate(_:)), name: "JHB_HUDTopVcCannotRotated", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(JHB_HUDTopViewController.canRotate), name: "JHB_HUDTopVcCanRotated", object: nil)
        
    }
    
    // MARK: - 处理通知
   
    func cannotRotate(noti:NSNotification) {
        
        let kOrientation = noti.object as! CGFloat
        if kOrientation == 1 {
            orientation = .Portrait
        }else if kOrientation == 2 {
            orientation = .PortraitUpsideDown
        }else if kOrientation == 3 {
            orientation = .LandscapeLeft
        }else if kOrientation == 4 {
            orientation = .LandscapeRight
        }
        
        kIfCanRotated = false
        self.shouldAutorotate()
        self.supportedInterfaceOrientations()
    }
    
    func canRotate() {
        kIfCanRotated = true
        self.shouldAutorotate()
        self.supportedInterfaceOrientations()
    }
  
    // MARK: - 重写旋转方法
    // ❤️这是在当前使用的控制器中应该使用的重写方法,以阻止旋转后重新实现旋转
    override func shouldAutorotate() -> Bool {
    
        if kIfCanRotated == true {
            return true
        }else if kIfCanRotated == false {
            return false
        }
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if kIfCanRotated == true {
            return .All
        }else if kIfCanRotated == false {

            if orientation == .Portrait {
                return .Portrait
            }else if orientation == .PortraitUpsideDown {
                return .PortraitUpsideDown
            }else if orientation == .LandscapeLeft {
                return .LandscapeLeft
            }else if orientation == .LandscapeRight {
                return .LandscapeRight
            }
        }
        return .All
    }
    
}
