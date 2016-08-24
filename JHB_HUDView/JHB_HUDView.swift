/********************** JHB_HUDView.swift ***********************/
/*******  (JHB)  ************************************************/
/*******  Created by Leon_pan on 16/6/12. ***********************/
/*******  Copyright © 2016年 CoderBala. All rights reserved.*****/
/********************** JHB_HUDView.swift ***********************/

/*
 Points For Attention:
 Well, I want to say thanks for your support and concern firstly ! And at present,You can get the follows methods from the bottom to integrate into your projects according to your demands .In fact, there are two main parts : the regular-part and diy-part; In regular-part ,you can use most effects that comes from system, it is the initial part I designed, cooperated with follows nine display-dismiss types !
 And then I optimized some disadvantages , and expaned five methods to display-sidmiss diy-image(you'd better let it be lower or equal to imageView's size of 50×50) type of HUD,and it's a unique style belong to 'JHB_HUDView'. So you'd better make a distinction between the two parts! At the same times, the good news is that it can supprot the screen-rotation ,just including 'Portrait','PortraitUpsideDown','LandscapeLeft','LandscapeRight'. For example , if your project initialed with Portrait-type, it will also show in center of the screen ,and change appropriate angle by-itself,but if your project initialed with other types , the screen rotation will be limited except the HUD dismissed . At last but not least , You need let your 'Controller' inherits 'JHB_HUDTopViewController', and then it can be run !
 At last, I will tell you that I hope you can support me always ,becasue it's main reason I can go down all the way .And I will keep improving and perfecting it ,Thanks for reading .
 */

import UIKit
/*
 There are nine 'HUDTypes' for coreview-hud's display provided,including 'Deafault','ShowImmediately','ShowSlightly','ShowFromBottomToTop','ShowFromTopToBottom','ShowFromLeftToRight','ShowFromRightToLeft','ScaleFromInsideToOutside','ScaleFromOutsideToInside' .
 */
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

/*********➕NewAddition➕NewAddition➕NewAddition➕*********/
/*
 There are four 'DiyHUDTypes' for diy-image's display provided,including 'Deafault','RotateWithY','RotateWithZ','ShakeWithX' .
 */
public enum DiyHUDType {
    
    case kDiyHUDTypeDefault/*默认*/
    case kDiyHUDTypeRotateWithY/*Y轴旋转*/
    case kDiyHUDTypeRotateWithZ/*Z轴旋转*/
    case kDiyHUDTypeShakeWithX/*Y轴左右摇晃*/

}

var hud = JHB_HUDManager()
var diyHud = JHB_HUDDiyManager()
public class JHB_HUDView:NSObject{
    
    /*************✅显示进程************/
    public class func showProgress(){// DEFAULT
        let HUD = JHB_HUDManager.init()
        hud = HUD
        HUD.showProgress()
    }
    
    /***********✅显示进程+HUDType**********/
    public class func showProgressWithType(HudType:HUDType){// DEFAULT
        let HUD = JHB_HUDManager.init()
        hud = HUD
        HUD.showProgressWithType(HudType)
    }
    
    /**********✅显示进程及信息************/
    public class func showProgressMsg(msg:NSString) {// DEFAULT
        let msgHUD = JHB_HUDManager.init()
        hud = msgHUD
        msgHUD.showProgressMsgs(msg)
    }
    
    /*********✅显示进程及信息+HUDType*********/
    public class func showProgressMsgWithType(msg:NSString,HudType:HUDType){// DEFAULT
        let HUD = JHB_HUDManager.init()
        hud = HUD
        HUD.showProgressMsgsWithType(msg, HudType: HudType)
    }
    
    /***********✅显示单行信息(自行执行Hide)**********/
    public class func showMsg(msg:NSString) {// DEFAULT
        let msgHUD = JHB_HUDManager.init()
        hud = msgHUD
        msgHUD.show(msg)
    }
    
    /********✅显示单行信息(自行执行Hide)+HUDType**********/
    public class func showMsgWithType(msg:NSString,HudType:HUDType) {// DEFAULT
        let msgHUD = JHB_HUDManager.init()
        hud = msgHUD
        msgHUD.showWithType(msg, HudType: HudType)
    }
    
    /************✅显示多行信息(自行执行Hide)************/
    public class func showMsgMultiLine(msg:NSString, coreInSet: CGFloat, labelInSet: CGFloat, delay: Double) {// DEFAULT
        let msgHUD = JHB_HUDManager.init()
        hud = msgHUD
        msgHUD.showMultiLine(msg, coreInSet: coreInSet, labelInSet: labelInSet, delay: delay)
    }
    
    /*********✅显示多行信息(自行执行Hide)+HUDType***********/
    public class func showMsgMultiLineWithType(msg:NSString, coreInSet: CGFloat, labelInSet: CGFloat, delay: Double ,HudType:HUDType) {// DEFAULT
        let msgHUD = JHB_HUDManager.init()
        hud = msgHUD
        msgHUD.showMultiLineWithType(msg, coreInSet: coreInSet, labelInSet: labelInSet, delay: delay, HudType: HudType)
    }
    
    /*********✅HIDE隐藏并移除(Pre + HUDType)**********/
    /*
     In current method lists ,there are two methods can hide your HUD, but it is different from each other , this one can only be used when you created HUD without diy-image
     */
    public class func hideProgress() {// DEFAULT
        hud.hideProgress()
    }
    
    
    /*********➕NewAddition➕NewAddition➕NewAddition➕*********/
    
    
    /*
     There are four new methods can be used according to your demand , And those are basic of previous methods , Like these on the top , So each of method also has the param - 'HudType',as you know ,is shows the coreview display and dismiss's type.and except for that, there are some other params you should know well.So then I will give you the detail of each of them !And attention that if you want wo show a group of images ,there will be no 'diyHudType' can be selected !
     */
    
    /**********✅自定义展示图片+HUDType*********/
    /*
        -- img:the image file that you want to show ,it can be your program's logo or company's logo, etc.And attention that you can just delivery the image's name without suffix .
        -- diySpeed:if you set animation for your diy-image ,this param will limit your animation-speed .
        -- diyHudType:it comes from the enum 'DiyHUDType',it improve four types of diy-image's animation that you can choose .
     */
    public class func showProgressOfDIYTypeWith(img:NSString,diySpeed:CFTimeInterval,diyHudType:DiyHUDType, HudType:HUDType) {// DEFAULT
        let msgDIYHUD = JHB_HUDDiyManager.init()
        diyHud = msgDIYHUD
        msgDIYHUD.showDIYProgressWithType(img,diySpeed:diySpeed, diyHudType: diyHudType, HudType: HudType)
       
    }
    
    /**********✅自定义展示图片+AnimationType+HUDType*********/
    /*
     -- imgsName:if you want show animation created by a group of images,you can pinpoint the images' main name that can be without suffix .
     -- imgsNumber:this param will let it knows that how many images will be showed ,it can not be null .
     -- diySpeed:this param will limit your animation-speed.
     */
    public class func showProgressOfDIYTypeWithAnimation(imgsName:NSString,imgsNumber:NSInteger,diySpeed:NSTimeInterval, HudType:HUDType){
        let msgDIYHUD = JHB_HUDDiyManager.init()
        diyHud = msgDIYHUD
        msgDIYHUD.showDIYProgressAnimated(imgsName,imgsNumber:imgsNumber,diySpeed:diySpeed, HudType:HudType)
    }
    
    /**********✅自定义展示图片和信息+HUDType**********/
    /*
     -- msg:display the message that you need to show .
     -- img:the image file that you want to show ,it can be your program's logo or company's logo, etc.And attention that you can just delivery the image's name without suffix .
     -- diySpeed:if you set animation for your diy-image ,this param will limit your animation-speed .
     -- diyHudType:it comes from the enum 'DiyHUDType',it improve four types of diy-image's animation that you can choose .
     */
    public class func showProgressMsgOfDIYTypeWith(msg:NSString,img:NSString,diySpeed:CFTimeInterval,diyHudType:DiyHUDType, HudType:HUDType) {// DEFAULT
        let msgDIYHUD = JHB_HUDDiyManager.init()
        diyHud = msgDIYHUD
        msgDIYHUD.showDIYProgressMsgsWithType(msg,img:img,diySpeed:diySpeed,diyHudType:diyHudType, HudType: HudType)
    }
    
    /*********✅自定义展示图片和信息+AnimationType+HUDType**********/
    /*
     -- msg:display the message that you need to show .
     -- imgsName:if you want show animation created by a group of images,you can pinpoint the images' main name that can be without suffix .
     -- imgsNumber:this param will let it knows that how many images will be showed ,it can not be null .
     -- diySpeed:if you set animation for your diy-image ,this param will limit your animation-speed .
     */
    public class func showProgressMsgOfDIYTypeWithAnimation(msg:NSString,imgsName:NSString,imgsNumber:NSInteger, diySpeed:CFTimeInterval, HudType:HUDType) {// DEFAULT
        let msgDIYHUD = JHB_HUDDiyManager.init()
        diyHud = msgDIYHUD
        msgDIYHUD.showDIYProgressMsgsAnimated(msg,imgsName:imgsName,imgsNumber:imgsNumber,diySpeed:diySpeed, HudType:HudType)
    }
    
    /*********✅自定义类型HIDE隐藏并移除+HUDType**********/
    /*
     In current method lists ,there are two methods can hide your HUD, but it is different from each other , this one can only be used when you created diy-image-type HUD
     */
    public class func hideProgressOfDIYType() {// DEFAULT
        diyHud.hideProgress()
    }

}