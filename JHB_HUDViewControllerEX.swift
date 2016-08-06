/****************** JHB_HUDViewControllerEX.swift ***************/
/*******  (蒋红宝)  **********************************************/
/*******  Created by Leon_pan on 16/6/12. ***********************/
/*******  Copyright © 2016年 CoderBala. All rights reserved.*****/
/****************** JHB_HUDViewControllerEX.swift ***************/


import Foundation

/*****❤️UIViewController类扩展******/
var hud = JHB_HUDView()
extension UIViewController{
    /***************************❤️显示进程****************************/
    func showProgress(){
        let HUD = JHB_HUDView.init()
        hud = HUD
        HUD.showProgress()
    }
    
    /*************************❤️显示进程及信息***************************/
    func showProgressMsg(msg:NSString) {
        let msgHUD = JHB_HUDView.init()
        hud = msgHUD
        msgHUD.showProgressMsgs(msg)
    }
    /********************❤️显示单行信息(自行执行Hide)********************/
    func showMsg(msg:NSString) {
        let msgHUD = JHB_HUDView.init()
        hud = msgHUD
        msgHUD.show(msg)
    }
    /********************❤️显示多行信息(自行执行Hide)********************/
    func showMsgMultiLine(msg:NSString, coreInSet: CGFloat, labelInSet: CGFloat, delay: Double) {
        let msgHUD = JHB_HUDView.init()
        hud = msgHUD
        msgHUD.showMultiLine(msg, coreInSet: coreInSet, labelInSet: labelInSet, delay: delay)
    }
    /***********************❤️HIDE隐藏并移除*************************/
    func hideProgress() {
        hud.hideProgress()
    }
}