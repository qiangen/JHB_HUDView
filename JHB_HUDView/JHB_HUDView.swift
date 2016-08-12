/********************** JHB_HUDView.swift ***********************/
/*******  (JHB)  ************************************************/
/*******  Created by Leon_pan on 16/6/12. ***********************/
/*******  Copyright © 2016年 CoderBala. All rights reserved.*****/
/********************** JHB_HUDView.swift ***********************/

import UIKit

public enum HUDType {
    /**Default**/
    case kHUDTypeDefaultly/*默认*/
    /**Show And Hide**/
    case kHUDTypeShowImmediately/*马上出现,没有延时*/
    case kHUDTypeShowSlightly/*淡入淡出,延时效果*/
    /**Top And Bottom**/
    case kHUDTypeShowFromBottomToTop/*从底部到顶部并有默认效果*/
    case kHUDTypeShowFromTopToBottom/*从顶部到底部并有默认效果*/
    /**Left And Right**/
    case kHUDTypeShowFromLeftToRight/*从左边到右边并有默认效果*/
    case kHUDTypeShowFromRightToLeft/*从右边到左边并有默认效果*/
    /**Inside And Outside**/
    case kHUDTypeScaleFromInsideToOutside/*从内部向外部放大*/
    case kHUDTypeScaleFromOutsideToInside/*从外部向内部缩小*/
}

var hud = JHB_HUD()
public class JHB_HUDView:NSObject{
    
    /************************❤️显示进程***************************/
    public class func showProgress(){// DEFAULT
        let HUD = JHB_HUD.init()
        hud = HUD
        HUD.showProgress()
    }
    /**********************❤️显示进程+HUDType**********************/
    public class func showProgressWithType(HudType:HUDType){// DEFAULT
        let HUD = JHB_HUD.init()
        hud = HUD
        HUD.showProgressWithType(HudType)
    }
    
    /***********************❤️显示进程及信息***************************/
    public class func showProgressMsg(msg:NSString) {// DEFAULT
        let msgHUD = JHB_HUD.init()
        hud = msgHUD
        msgHUD.showProgressMsgs(msg)
    }
    /*********************❤️显示进程及信息+HUDType**********************/
    public class func showProgressMsgWithType(msg:NSString,HudType:HUDType){// DEFAULT
        let HUD = JHB_HUD.init()
        hud = HUD
        HUD.showProgressMsgsWithType(msg, HudType: HudType)
    }
    
    /********************❤️显示单行信息(自行执行Hide)********************/
    public class func showMsg(msg:NSString) {// DEFAULT
        let msgHUD = JHB_HUD.init()
        hud = msgHUD
        msgHUD.show(msg)
    }
    /*****************❤️显示单行信息(自行执行Hide)+HUDType****************/
    public class func showMsgWithType(msg:NSString,HudType:HUDType) {// DEFAULT
        let msgHUD = JHB_HUD.init()
        hud = msgHUD
        msgHUD.showWithType(msg, HudType: HudType)
    }
    
    /********************❤️显示多行信息(自行执行Hide)********************/
    public class func showMsgMultiLine(msg:NSString, coreInSet: CGFloat, labelInSet: CGFloat, delay: Double) {// DEFAULT
        let msgHUD = JHB_HUD.init()
        hud = msgHUD
        msgHUD.showMultiLine(msg, coreInSet: coreInSet, labelInSet: labelInSet, delay: delay)
    }
    /****************❤️显示多行信息(自行执行Hide)+HUDType****************/
    public class func showMsgMultiLineWithType(msg:NSString, coreInSet: CGFloat, labelInSet: CGFloat, delay: Double ,HudType:HUDType) {// DEFAULT
        let msgHUD = JHB_HUD.init()
        hud = msgHUD
        msgHUD.showMultiLineWithType(msg, coreInSet: coreInSet, labelInSet: labelInSet, delay: delay, HudType: HudType)
    }
    
    /*****************❤️HIDE隐藏并移除(Pre + HUDType)*******************/
    public class func hideProgress() {// DEFAULT
        hud.hideProgress()
    }
}