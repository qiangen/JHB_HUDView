/****************** JHB_HUDDiyManager.swift *********************/
/*******  (JHB)  ************************************************/
/*******  Created by Leon_pan on 16/8/15. ***********************/
/*******  Copyright © 2016年 CoderBala. All rights reserved.*****/
/****************** JHB_HUDDiyManager.swift *********************/

import UIKit

public class JHB_HUDDiyManager: UIView {
    private  var windowsTemp: [UIWindow] = []
    private  var timer: dispatch_source_t?
    // MARK: parameters
    let SCREEN_WIDTH  = UIScreen.mainScreen().bounds.size.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    /*透明背景*//*Clear Background*/
    var bgClearView   = UIView();
    /*核心视图*//*Core View Part*/
    var coreView      = JHB_HUDDiyProgressView();
    /*核心视图尺寸*//*The Frame Of Core View Part*/
    var coreViewRect  = CGRect()
    /*核心视图内部统一间隔*//*The Uniformed Margin Inside Core View Part*/
    var kMargin : CGFloat = 10
    /*定义当前类型*//*Current Type*/
    var type : NSInteger = 0
    /*之前的屏幕旋转类型*//*The Screen Rotation Type Of Previous*/
    var PreOrientation = UIDevice.currentDevice().orientation
    /*初始化的屏幕旋转类型*//*The Screen Rotation Type Of Initial-status*/
    var InitOrientation = UIDevice.currentDevice().orientation
    
    // MARK: - Interface
    override init(frame: CGRect) {
        super.init(frame: UIScreen.mainScreen().bounds)
        self.setSubViews()
        self.addSubview(self.bgClearView);
        self.addSubview(self.coreView);
        PreOrientation = UIDevice.currentDevice().orientation
        InitOrientation = UIDevice.currentDevice().orientation
        self.registerDeviceOrientationNotification()
        
        if PreOrientation != .Portrait {
            NSNotificationCenter.defaultCenter().postNotificationName("JHB_HUDTopVcCannotRotated", object: self.PreOrientation.hashValue, userInfo: nil)
        }
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSubViews() {
        self.bgClearView = UIView.init()
        self.bgClearView.backgroundColor = UIColor.clearColor()
        
        self.coreView = JHB_HUDDiyProgressView.init()
        self.coreView.sizeToFit()
        self.coreView.layer.cornerRadius = 10;
        self.coreView.layer.masksToBounds = true
        self.coreView.backgroundColor = UIColor.blackColor()
        self.coreView.alpha = 0
        
        self.resetSubViews()
    }
    
    func resetSubViews() {
        self.bgClearView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
        self.coreView.frame = CGRectMake((SCREEN_WIDTH - 70) / 2, (SCREEN_HEIGHT - 70) / 2, 70, 70)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 + 60)
    }
    
    
    // MARK: About Notification
    // 1⃣️remove
    private func RemoveNotification() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    // 2⃣️register
    private func registerDeviceOrientationNotification() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.transformWindow(_:)), name: UIDeviceOrientationDidChangeNotification, object: nil)
    }
    
    // MARK - 当前根控制器
    func topviewController() -> UIViewController {
        return self.topViewControllerWithRootViewController((UIApplication.sharedApplication().keyWindow?.rootViewController)!)
    }
    func topViewControllerWithRootViewController(rootViewController:UIViewController) -> UIViewController {
        if rootViewController.isKindOfClass(UITabBarController) {
            let tabbarVc = rootViewController as! UITabBarController
            return self.topViewControllerWithRootViewController((tabbarVc.selectedViewController)!)
        }else if rootViewController.isKindOfClass(UINavigationController) {
            let navVc = rootViewController as! UINavigationController
            return self.topViewControllerWithRootViewController((navVc.visibleViewController)!)
        }else if (rootViewController.presentedViewController != nil){
            let presentVc = rootViewController.presentedViewController
            return self.topViewControllerWithRootViewController((presentVc)!)
        }
        return rootViewController
    }
    
    // transform
    @objc private func transformWindow(notification: NSNotification) {
        var rotation: CGFloat = 0
        if self.InitOrientation == .Portrait{
            if self.PreOrientation == .Portrait {
                switch UIDevice.currentDevice().orientation {
                case .Portrait:
                    rotation = 0
                case .PortraitUpsideDown:
                    rotation = CGFloat(M_PI)
                case .LandscapeLeft:
                    rotation = CGFloat(M_PI/2)
                case .LandscapeRight:
                    rotation = CGFloat(M_PI + (M_PI/2))
                default:
                    break
                }
            }else if self.PreOrientation == .PortraitUpsideDown {
                switch UIDevice.currentDevice().orientation {
                case .Portrait:
                    rotation = 0
                case .PortraitUpsideDown:
                    rotation = CGFloat((M_PI/2))
                case .LandscapeLeft:
                    rotation = CGFloat((M_PI/2))
                case .LandscapeRight:
                    rotation = CGFloat(M_PI + M_PI/2)
                default:
                    break
                }
            }else if self.PreOrientation == .LandscapeLeft {
                switch UIDevice.currentDevice().orientation {
                case .Portrait:
                    rotation = 0
                case .PortraitUpsideDown:
                    rotation = CGFloat(M_PI)
                case .LandscapeLeft:
                    rotation = 0
                case .LandscapeRight:
                    rotation = CGFloat(M_PI + M_PI/2)
                default:
                    break
                }
            }else if self.PreOrientation == .LandscapeRight {
                switch UIDevice.currentDevice().orientation {
                case .Portrait:
                    rotation = 0
                case .PortraitUpsideDown:
                    rotation = CGFloat(M_PI)
                case .LandscapeLeft:
                    rotation = CGFloat(M_PI/2)
                case .LandscapeRight:
                    rotation = 0
                default:
                    break
                }
            }else if self.PreOrientation == .FaceDown ||  self.PreOrientation == .FaceDown {
                return
            }
        }else if self.InitOrientation == .LandscapeLeft || self.InitOrientation == .LandscapeRight || self.InitOrientation == .PortraitUpsideDown {
            return
        }
        
        self.PreOrientation = UIDevice.currentDevice().orientation
        windowsTemp.forEach {_ in 
            window!.center = self.getCenter()
            window!.transform = CGAffineTransformMakeRotation(rotation)
        }
    }
 
    // center
    private  func getCenter() -> CGPoint {
        let rv = UIApplication.sharedApplication().keyWindow?.subviews.first as UIView!
        if self.InitOrientation == .Portrait{
            if self.PreOrientation == .Portrait {
                return rv.center
            }else {
                if rv.bounds.width > rv.bounds.height {
                    return CGPoint(x: rv.bounds.height/2, y: rv.bounds.width/2)
                }
            }
        }else if self.InitOrientation == .LandscapeLeft {
            if self.PreOrientation == .LandscapeLeft || self.PreOrientation == .LandscapeRight {
                return rv.center
            }else {
                if rv.bounds.width > rv.bounds.height {
                    return CGPoint(x: rv.bounds.height/2, y: rv.bounds.width/2)
                }
            }
        }else if self.InitOrientation == .LandscapeRight {
            if self.PreOrientation == .LandscapeLeft || self.PreOrientation == .LandscapeRight {
                return rv.center
            }else {
                if rv.bounds.width > rv.bounds.height {
                    return CGPoint(x: rv.bounds.height/2, y: rv.bounds.width/2)
                }
            }
        }
        return rv.center

    }
    // dismiss
    @objc private func dismiss() {
        var timer: dispatch_source_t?
        if let _ = timer {
            dispatch_source_cancel(timer!)
            timer = nil
        }
        windowsTemp.removeAll(keepCapacity: false)
    }
}


public extension JHB_HUDDiyManager{
    
    // MARK: - 1⃣️单纯显示DIY进程中(Just Show In DIY-Progress)
    public func showDIYProgressWithType(img:NSString,diySpeed:CFTimeInterval,diyHudType:DiyHUDType, HudType:HUDType) {// DEFAULT
        
        self.coreView.diyShowImage = img
        self.coreView.diySpeed = diySpeed
        self.coreView.diyHudType = diyHudType.hashValue
        self.type = HudType.hashValue
        self.showDIYProgressWithHUDType(HudType)
    }
    // MARK: - 2⃣️单纯显示DIY进程中(Just Show In DIY-Progress:❤️播放图片数组)
    public func showDIYProgressAnimated(imgsName:NSString,imgsNumber:NSInteger,diySpeed:NSTimeInterval, HudType:HUDType){
        self.coreView.diyShowImage = imgsName
        self.coreView.diyImgsNumber = imgsNumber
        self.coreView.diySpeed = diySpeed
        self.type = HudType.hashValue
        self.showDIYProgressWithHUDType(HudType)
    }
    
    private func showDIYProgressWithHUDType(HudType:HUDType) {
        
        switch HudType {
        case .kHUDTypeDefaultly:
            self.EffectShowProgressAboutTopAndBottom(.kHUDTypeShowFromBottomToTop)
        case .kHUDTypeShowImmediately:
            self.EffectShowProgressAboutStablePositon(.kHUDTypeShowImmediately)
        case .kHUDTypeShowSlightly:
            self.EffectShowProgressAboutStablePositon(.kHUDTypeShowSlightly)
        case .kHUDTypeShowFromBottomToTop:
            self.EffectShowProgressAboutTopAndBottom(.kHUDTypeShowFromBottomToTop)
        case .kHUDTypeShowFromTopToBottom:
            self.EffectShowProgressAboutTopAndBottom(.kHUDTypeShowFromTopToBottom)
        case .kHUDTypeShowFromLeftToRight:
            self.EffectShowProgressAboutLeftAndRight(.kHUDTypeShowFromLeftToRight)
        case .kHUDTypeShowFromRightToLeft:
            self.EffectShowProgressAboutLeftAndRight(.kHUDTypeShowFromRightToLeft)
        case .kHUDTypeScaleFromInsideToOutside:
            self.EffectShowProgressAboutInsideAndOutside(.kHUDTypeScaleFromInsideToOutside)
        case .kHUDTypeScaleFromOutsideToInside:
            self.EffectShowProgressAboutInsideAndOutside(.kHUDTypeScaleFromOutsideToInside)
        }
        
    }
    
      // 1⃣️原位置不变化
    private func EffectShowProgressAboutStablePositon(type:HUDType) {
        
        var kIfNeedEffect : Bool = false
        switch type {
        case .kHUDTypeShowImmediately:
            kIfNeedEffect = false
            self.coreView.alpha = 1
            break
        case .kHUDTypeShowSlightly:
            kIfNeedEffect = true
            self.coreView.alpha = 0
            break
        default:
            
            break
        }
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_DIYHUD_haveNoMsg", object: nil)
        /*重写位置*/
        self.coreView.diyMsgLabel.hidden = true
        self.coreView.frame = CGRectMake((SCREEN_WIDTH - 80) / 2, (SCREEN_HEIGHT - 80) / 2, 80, 80)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 )
        self.ResetWindowPosition()
        
        if kIfNeedEffect == false {
        }else if kIfNeedEffect == true {
            /*实现动画*/
            UIView.animateWithDuration(0.65) {
                self.coreView.alpha = 1
                self.coreView.center = CGPointMake(UIScreen.mainScreen().bounds.size.width / 2, UIScreen.mainScreen().bounds.size.height / 2)
            }
        }
    }
    // 2⃣️上下相关
    private  func EffectShowProgressAboutTopAndBottom(type:HUDType) {
        var value : CGFloat = 0
        switch type {
        case .kHUDTypeShowFromBottomToTop:
            value = -60
            break
        case .kHUDTypeShowFromTopToBottom:
            value = 60
            break
        default:
            
            break
        }
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_DIYHUD_haveNoMsg", object: nil)
        /*重写位置*/
        self.coreView.diyMsgLabel.hidden = true
        self.coreView.frame = CGRectMake((SCREEN_WIDTH - 80) / 2, (SCREEN_HEIGHT - 80) / 2, 80, 80)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 - value)
        self.ResetWindowPosition()
        
        /*实现动画*/
        UIView.animateWithDuration(0.65) {
            self.coreView.alpha = 1
            self.coreView.center = CGPointMake(UIScreen.mainScreen().bounds.size.width / 2, UIScreen.mainScreen().bounds.size.height / 2)
        }
        
    }
    
    // 3⃣️左右相关
    private  func EffectShowProgressAboutLeftAndRight(type:HUDType){
        var value : CGFloat = 0
        switch type {
        case .kHUDTypeShowFromLeftToRight:
            value = -60
            break
        case .kHUDTypeShowFromRightToLeft:
            value = 60
            break
        default:
            
            break
        }
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_DIYHUD_haveNoMsg", object: nil)
        /*重写位置*/
        self.coreView.diyMsgLabel.hidden = true
        self.coreView.frame = CGRectMake((SCREEN_WIDTH - 80) / 2, (SCREEN_HEIGHT - 80) / 2, 80, 80)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2 + value, SCREEN_HEIGHT / 2)
        self.ResetWindowPosition()
        
        /*实现动画*/
        UIView.animateWithDuration(0.65) {
            self.coreView.alpha = 1
            self.coreView.center = CGPointMake(UIScreen.mainScreen().bounds.size.width / 2, UIScreen.mainScreen().bounds.size.height / 2)
        }
        
    }
    
    // 4⃣️内外相关
    private  func EffectShowProgressAboutInsideAndOutside(type:HUDType){
        
        var kInitValue : CGFloat = 0
        var kScaleValue : CGFloat = 0
        switch type {
        case .kHUDTypeScaleFromInsideToOutside:
            kInitValue = 45
            kScaleValue = 1.78
            break
        case .kHUDTypeScaleFromOutsideToInside:
            kInitValue = 120
            kScaleValue = 0.67
            break
        default:
            
            break
        }
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_DIYHUD_haveNoMsgWithScale", object: kScaleValue)
        /*重写位置*/
        self.coreView.diyMsgLabel.hidden = true
        self.coreView.frame = CGRectMake((SCREEN_WIDTH - kInitValue) / 2, (SCREEN_HEIGHT - kInitValue) / 2, kInitValue, kInitValue)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)

        self.ResetWindowPosition()
        /*实现动画*/
        UIView.animateWithDuration(0.65){
            self.coreView.alpha = 1
            self.coreView.transform = CGAffineTransformScale(self.coreView.transform, kScaleValue,kScaleValue)
        }
        
    }
   
    // MARK: - 3⃣️显示DIY进程及文字(Show DIY-InProgress-Status And The Words-Message)
    public func showDIYProgressMsgsWithType(msgs:NSString,img:NSString,diySpeed:CFTimeInterval,diyHudType:DiyHUDType, HudType:HUDType) {// NEW
        self.coreView.diySpeed = diySpeed
        self.coreView.diyHudType = diyHudType.hashValue
        self.coreView.diyShowImage = img
        self.type = HudType.hashValue
        self.showDIYProgressMsgsWithHUDType(msgs, HudType: HudType)
    }
    // MARK: - 4⃣️显示DIY进程及文字(Show DIY-InProgress-Status And The Words-Message❤️播放图片数组)
    public func showDIYProgressMsgsAnimated(msgs:NSString,imgsName:NSString,imgsNumber:NSInteger,diySpeed:NSTimeInterval, HudType:HUDType) {// NEW
        self.coreView.diyShowImage = imgsName
        self.coreView.diyImgsNumber = imgsNumber
        self.coreView.diySpeed = diySpeed
        self.type = HudType.hashValue
        self.showDIYProgressMsgsWithHUDType(msgs, HudType: HudType)
    }
    
    private func showDIYProgressMsgsWithHUDType(msgs:NSString,HudType:HUDType) {
        switch HudType {
        case .kHUDTypeDefaultly:
            self.EffectShowProgressMsgsAboutTopAndBottom(msgs,type: .kHUDTypeShowFromBottomToTop)
        case .kHUDTypeShowImmediately:
            self.EffectShowProgressMsgsAboutStablePosition(msgs, type: .kHUDTypeShowImmediately)
        case .kHUDTypeShowSlightly:
            self.EffectShowProgressMsgsAboutStablePosition(msgs, type: .kHUDTypeShowSlightly)
        case .kHUDTypeShowFromBottomToTop:
            self.EffectShowProgressMsgsAboutTopAndBottom(msgs,type: .kHUDTypeShowFromBottomToTop)
        case .kHUDTypeShowFromTopToBottom:
            self.EffectShowProgressMsgsAboutTopAndBottom(msgs,type:.kHUDTypeShowFromTopToBottom)
        case .kHUDTypeShowFromLeftToRight:
            self.EffectShowProgressMsgsAboutLeftAndRight(msgs, type: .kHUDTypeShowFromLeftToRight)
        case .kHUDTypeShowFromRightToLeft:
            self.EffectShowProgressMsgsAboutLeftAndRight(msgs, type: .kHUDTypeShowFromRightToLeft)
        case .kHUDTypeScaleFromInsideToOutside:
            self.EffectShowProgressMsgsAboutInsideAndOutside(msgs, type: .kHUDTypeScaleFromInsideToOutside)
        case .kHUDTypeScaleFromOutsideToInside:
            self.EffectShowProgressMsgsAboutInsideAndOutside(msgs, type: .kHUDTypeScaleFromOutsideToInside)
        }
    }
    
    // 1⃣️原位置不变
    private  func EffectShowProgressMsgsAboutStablePosition(msgs:NSString,type:HUDType) {
        
        switch type {
        case .kHUDTypeShowImmediately:
            self.coreView.alpha = 1
            break
        case .kHUDTypeShowSlightly:
            self.coreView.alpha = 0
            
            break
        default:
            
            break
        }
        
        coreViewRect = msgs.boundingRectWithSize(CGSizeMake(self.coreView.diyMsgLabel.bounds.width, 1000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [
            NSFontAttributeName:UIFont.systemFontOfSize(15.0)
            ], context: nil)
        var msgLabelWidth = coreViewRect.width
        if msgLabelWidth + 2*kMargin >= (SCREEN_WIDTH - 30) {
            msgLabelWidth = SCREEN_WIDTH - 30 - 2*kMargin
        }else if msgLabelWidth + 2*kMargin <= 80 {
            msgLabelWidth = 80
        }
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_DIYHUD_haveMsg", object: nil)
        self.coreView.frame = CGRectMake((SCREEN_WIDTH - msgLabelWidth) / 2, (SCREEN_HEIGHT - 80) / 2,msgLabelWidth + 2*kMargin , 80)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)
        self.ResetWindowPosition()
        
        UIView.animateWithDuration(0.65) {
            self.coreView.alpha = 1
            self.coreView.center = CGPointMake(UIScreen.mainScreen().bounds.size.width / 2, UIScreen.mainScreen().bounds.size.height / 2)
            self.setNeedsDisplay()
        }
        
        self.coreView.diyMsgLabelWidth = msgLabelWidth
        self.coreView.diyMsgLabel.text = msgs as String
    }
    // 2⃣️上下相关
    private  func EffectShowProgressMsgsAboutTopAndBottom(msgs:NSString,type:HUDType){
        
        var value : CGFloat = 0
        switch type {
        case .kHUDTypeShowFromBottomToTop:
            value = 60
            break
        case .kHUDTypeShowFromTopToBottom:
            value = -60
            break
        default:
            
            break
        }
        
        coreViewRect = msgs.boundingRectWithSize(CGSizeMake(self.coreView.diyMsgLabel.bounds.width, 1000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [
            NSFontAttributeName:UIFont.systemFontOfSize(15.0)
            ], context: nil)
        var msgLabelWidth = coreViewRect.width
        if msgLabelWidth + 2*kMargin >= (SCREEN_WIDTH - 30) {
            msgLabelWidth = SCREEN_WIDTH - 30 - 2*kMargin
        }else if msgLabelWidth + 2*kMargin <= 80 {
            msgLabelWidth = 80
        }
        self.coreView.diyMsgLabelWidth = msgLabelWidth + 20
        self.coreView.diyMsgLabel.text = msgs as String
        
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_DIYHUD_haveMsg", object: nil)
        self.coreView.frame = CGRectMake((SCREEN_WIDTH - msgLabelWidth) / 2, (SCREEN_HEIGHT - 80) / 2,msgLabelWidth + 2*kMargin , 80)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 + value)
        self.ResetWindowPosition()
        
        UIView.animateWithDuration(0.65) {
            self.coreView.alpha = 1
            self.coreView.center = CGPointMake(UIScreen.mainScreen().bounds.size.width / 2, UIScreen.mainScreen().bounds.size.height / 2)
            self.setNeedsDisplay()
        }
    }
    // 3⃣️左右相关
    private  func EffectShowProgressMsgsAboutLeftAndRight(msgs:NSString,type:HUDType){
        
        var value : CGFloat = 0
        switch type {
        case .kHUDTypeShowFromLeftToRight:
            value = -60
            break
        case .kHUDTypeShowFromRightToLeft:
            value = 60
            break
        default:
            
            break
        }
        
        coreViewRect = msgs.boundingRectWithSize(CGSizeMake(self.coreView.diyMsgLabel.bounds.width, 1000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [
            NSFontAttributeName:UIFont.systemFontOfSize(15.0)
            ], context: nil)
        var msgLabelWidth = coreViewRect.width
        if msgLabelWidth + 2*kMargin >= (SCREEN_WIDTH - 30) {
            msgLabelWidth = SCREEN_WIDTH - 30 - 2*kMargin
        }else if msgLabelWidth + 2*kMargin <= 80 {
            msgLabelWidth = 80
        }
        self.coreView.diyMsgLabelWidth = msgLabelWidth + 20
        self.coreView.diyMsgLabel.text = msgs as String
        
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_DIYHUD_haveMsg", object: nil)
        self.coreView.frame = CGRectMake((SCREEN_WIDTH - msgLabelWidth) / 2, (SCREEN_HEIGHT - 80) / 2,msgLabelWidth + 2*kMargin , 80)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2 + value, SCREEN_HEIGHT / 2)
        self.ResetWindowPosition()
        
        UIView.animateWithDuration(0.65) {
            self.coreView.alpha = 1
            self.coreView.center = CGPointMake(UIScreen.mainScreen().bounds.size.width / 2, UIScreen.mainScreen().bounds.size.height / 2)
            self.setNeedsDisplay()
        }
    }
    
    // 4⃣️内外相关
    private  func EffectShowProgressMsgsAboutInsideAndOutside(msgs:NSString,type:HUDType){
        
        coreViewRect = msgs.boundingRectWithSize(CGSizeMake(self.coreView.diyMsgLabel.bounds.width, 1000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [
            NSFontAttributeName:UIFont.systemFontOfSize(15.0)
            ], context: nil)
        var msgLabelWidth = coreViewRect.width
        if msgLabelWidth + 2*kMargin >= (SCREEN_WIDTH - 30) {
            msgLabelWidth = SCREEN_WIDTH - 30 - 2*kMargin
        }else if msgLabelWidth + 2*kMargin <= 80 {
            msgLabelWidth = 80
        }
        let CoreWidth = msgLabelWidth + 2*kMargin
        var iniWidthValue : CGFloat = 0
        var iniHeightValue : CGFloat = 0
        var kScaleValue : CGFloat = 0
        
        switch type {
        case .kHUDTypeScaleFromInsideToOutside:
            kScaleValue = 1.05
            iniWidthValue = (CoreWidth + 10)/kScaleValue
            iniHeightValue = 80/kScaleValue
            break
        case .kHUDTypeScaleFromOutsideToInside:
            kScaleValue = 0.90
            iniWidthValue = CoreWidth/kScaleValue
            iniHeightValue = 80/kScaleValue
            break
        default:
            
            break
        }
        self.coreView.diyMsgLabelWidth = iniWidthValue
        self.coreView.diyMsgLabel.text = msgs as String
        
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_DIYHUD_haveMsg_WithScale", object: kScaleValue)
        
        self.coreView.frame = CGRectMake((SCREEN_WIDTH - msgLabelWidth) / 2, (SCREEN_HEIGHT - iniHeightValue) / 2,iniWidthValue , iniHeightValue)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)
        self.ResetWindowPosition()
        
        UIView.animateWithDuration(0.65) {
            self.coreView.alpha = 1
            self.coreView.transform = CGAffineTransformScale(self.coreView.transform, kScaleValue,kScaleValue)
            self.coreView.center = CGPointMake(UIScreen.mainScreen().bounds.size.width / 2, UIScreen.mainScreen().bounds.size.height / 2)
            self.setNeedsDisplay()
        }
        
    }
    
    
    // MARK: - 隐藏(Hidden❤️Type:dissolveToTop)
    public func hideProgress() {// DEFAULT
        self.performSelector(#selector(JHB_HUDDiyManager.hideWithAnimation), withObject: self, afterDelay: 0.6)
    }
    private func hideHud() {
        self.hideProgress()
    }

    // MARK: - Self-Method Without Ask
    @objc private func hideWithAnimation() {
        
        switch self.type {
        case HUDType.kHUDTypeDefaultly.hashValue:
            // ❤️默认类型
            self.EffectRemoveAboutBottomAndTop(.kHUDTypeShowFromBottomToTop)
            break
        case HUDType.kHUDTypeShowImmediately.hashValue:
            self.EffectRemoveAboutStablePositon(.kHUDTypeShowImmediately)
            break
        case HUDType.kHUDTypeShowSlightly.hashValue:
            self.EffectRemoveAboutStablePositon(.kHUDTypeShowSlightly)
            break
        case HUDType.kHUDTypeShowFromBottomToTop.hashValue:
            self.EffectRemoveAboutBottomAndTop(.kHUDTypeShowFromBottomToTop)
            break
        case HUDType.kHUDTypeShowFromTopToBottom.hashValue:
            self.EffectRemoveAboutBottomAndTop(.kHUDTypeShowFromTopToBottom)
            break
        case HUDType.kHUDTypeShowFromLeftToRight.hashValue:
            self.EffectRemoveAboutLeftAndRight(.kHUDTypeShowFromLeftToRight)
            break
        case HUDType.kHUDTypeShowFromRightToLeft.hashValue:
            self.EffectRemoveAboutLeftAndRight(.kHUDTypeShowFromRightToLeft)
            break
        case HUDType.kHUDTypeScaleFromInsideToOutside.hashValue:
            self.EffectRemoveAboutInsideAndOutside(.kHUDTypeScaleFromInsideToOutside)
            break
        case HUDType.kHUDTypeScaleFromOutsideToInside.hashValue:
            self.EffectRemoveAboutInsideAndOutside(.kHUDTypeScaleFromOutsideToInside)
            break
        default:
            
            break
        }
        
    }
    // 1⃣️原位置不变
    func EffectRemoveAboutStablePositon(HudType:HUDType) {
        
        var  kIfNeedEffect : Bool = false
        switch HudType {
        case .kHUDTypeShowImmediately:
            kIfNeedEffect = false
            break
        case .kHUDTypeShowSlightly:
            kIfNeedEffect = true
            break
        default:
            
            break
        }
        
        if kIfNeedEffect == false {
            self.SuperInitStatus()
        }else if kIfNeedEffect == true {
            UIView.animateWithDuration(0.65, animations: {
                self.coreView.alpha = 0
                self.coreView.center = CGPointMake(self.bgClearView.bounds.size.width / 2, self.bgClearView.bounds.size.height / 2)
            }) { (true) in
                self.SuperInitStatus()
            }
        }
    }
    // 2⃣️上下相关
    func EffectRemoveAboutBottomAndTop(HudType:HUDType) {
        
        var value : CGFloat = 0
        switch HudType {
        case .kHUDTypeShowFromBottomToTop:
            value = -60
            break
        case .kHUDTypeShowFromTopToBottom:
            value = 60
            break
        default:
            
            break
        }
        
        UIView.animateWithDuration(0.65, animations: {
            self.coreView.alpha = 0
            self.coreView.center = CGPointMake(self.bgClearView.bounds.size.width / 2, self.bgClearView.bounds.size.height / 2 + value)
        }) { (true) in
            self.SuperInitStatus()
        }
    }
    
    // 3⃣️左右相关
    func EffectRemoveAboutLeftAndRight(HudType:HUDType) {
        var value : CGFloat = 0
        
        switch HudType {
        case .kHUDTypeShowFromLeftToRight:
            value = 60
            break
        case .kHUDTypeShowFromRightToLeft:
            value = -60
            break
        default:
            
            break
        }
        
        UIView.animateWithDuration(0.65, animations: {
            self.coreView.alpha = 0
            self.coreView.center = CGPointMake(self.bgClearView.bounds.size.width / 2 + value, self.bgClearView.bounds.size.height / 2)
        }) { (true) in
            self.SuperInitStatus()
        }
    }
    
    // 4⃣️内外相关
    func EffectRemoveAboutInsideAndOutside(HudType:HUDType) {
        
        var kScaleValue : CGFloat = 0
        switch HudType {
        case .kHUDTypeScaleFromInsideToOutside:
            kScaleValue = 1.78
            break
        case .kHUDTypeScaleFromOutsideToInside:
            kScaleValue = 0.67
            break
        default:
            
            break
        }
        
        UIView.animateWithDuration(0.65, animations: {
            self.coreView.alpha = 0
            self.coreView.transform = CGAffineTransformScale(self.coreView.transform, 1/kScaleValue,1/kScaleValue)
            self.coreView.center = CGPointMake(self.bgClearView.bounds.size.width / 2, self.bgClearView.bounds.size.height / 2)
        }) { (true) in
            self.SuperInitStatus()
        }
    }
    
    /*************➕保持适应屏幕旋转前提下实现移除➕************/
    
    func SuperInitStatus() {
        self.RemoveNotification()
        self.dismiss()
        InitOrientation = UIDevice.currentDevice().orientation
    NSNotificationCenter.defaultCenter().postNotificationName("JHB_HUDTopVcCanRotated", object: nil, userInfo: nil)
        self.removeFromSuperview()
    }
    /*************➕保持适应屏幕旋转前提下实现添加➕************/
    func ResetWindowPosition() {
        let window = UIWindow()
        window.backgroundColor = UIColor.clearColor()
        window.frame = CGRectMake(0, 0, (UIApplication.sharedApplication().keyWindow?.bounds.size.width)!,(UIApplication.sharedApplication().keyWindow?.bounds.size.height)!)
        window.windowLevel = UIWindowLevelAlert
        window.center = self.getCenter()
        window.hidden = false
        window.addSubview(self)
        windowsTemp.append(window)
    }

}