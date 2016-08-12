/******************** JHB_HUDManager.swift **********************/
/*******  (JHB)  ************************************************/
/*******  Created by Leon_pan on 16/8/12. ***********************/
/*******  Copyright © 2016年 CoderBala. All rights reserved.*****/
/******************** JHB_HUDManager.swift **********************/

import UIKit

public class JHB_HUDManager: UIView {
    // MARK: parameters
    let SCREEN_WIDTH  = UIScreen.mainScreen().bounds.size.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    /*透明背景*//*Clear Background*/
    var bgClearView   = UIView();
    /*核心视图*//*Core View Part*/
    var coreView      = JHB_HUDProgressView();
    /*核心视图尺寸*//*The Frame Of Core View Part*/
    var coreViewRect  = CGRect()
    /*核心视图内部统一间隔*//*The Uniformed Margin Inside Core View Part*/
    var kMargin : CGFloat = 10
    // 定义当前类型
    var type : NSInteger = 0
    
    // MARK: - Interface
    override init(frame: CGRect) {
        super.init(frame: UIScreen.mainScreen().bounds)
        self.setSubViews()
        self.addSubview(self.bgClearView);
        self.addSubview(self.coreView);
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSubViews() {
        self.bgClearView = UIView.init()
        self.bgClearView.backgroundColor = UIColor.clearColor()
        
        self.coreView = JHB_HUDProgressView.init()
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
    
    // 只显示信息内容时的CoreView的行为效果(The Behavior Effect Of 'CoreView' When Just Show Message-Content)
    @objc private func coreViewShowAndHideWithAnimation(delay:Double){
        UIView.animateWithDuration(0.65, animations: {
            self.coreView.alpha = 1
            self.coreView.center = CGPointMake(UIScreen.mainScreen().bounds.size.width / 2, UIScreen.mainScreen().bounds.size.height / 2)
            self.setNeedsDisplay()
        }) { (true) in
            self.performSelector(#selector(JHB_HUDManager.selfCoreViewRemoveFromSuperview), withObject: self, afterDelay: delay)
        }
    }
    
    @objc private func selfCoreViewRemoveFromSuperview(){
        
        switch self.type {
        case HUDType.kHUDTypeDefaultly.hashValue:
            self.EffectSelfCoreViewRemoveAboutTopAndBottom(.kHUDTypeShowFromBottomToTop)
            break
        case HUDType.kHUDTypeShowImmediately.hashValue:
            self.EffectSelfCoreViewRemoveAboutStablePosition(.kHUDTypeShowImmediately)
            break
        case HUDType.kHUDTypeShowSlightly.hashValue:
            self.EffectSelfCoreViewRemoveAboutStablePosition(.kHUDTypeShowSlightly)
            break
        case HUDType.kHUDTypeShowFromBottomToTop.hashValue:
            self.EffectSelfCoreViewRemoveAboutTopAndBottom(.kHUDTypeShowFromBottomToTop)
            break
        case HUDType.kHUDTypeShowFromTopToBottom.hashValue:
            self.EffectSelfCoreViewRemoveAboutTopAndBottom(.kHUDTypeShowFromTopToBottom)
            break
        case HUDType.kHUDTypeShowFromLeftToRight.hashValue:
            self.EffectSelfCoreViewRemoveAboutLeftAndRight(.kHUDTypeShowFromLeftToRight)
            break
        case HUDType.kHUDTypeShowFromRightToLeft.hashValue:
            self.EffectSelfCoreViewRemoveAboutLeftAndRight(.kHUDTypeShowFromRightToLeft)
            break
        case HUDType.kHUDTypeScaleFromInsideToOutside.hashValue:
            self.EffectSelfCoreViewRemoveAboutInsideAndOutSide(.kHUDTypeScaleFromInsideToOutside)
            break
        case HUDType.kHUDTypeScaleFromOutsideToInside.hashValue:
            self.EffectSelfCoreViewRemoveAboutInsideAndOutSide(.kHUDTypeScaleFromOutsideToInside)
            break
        default:
            
            break
        }
    }
    
    // 1⃣️原位置不变
    func EffectSelfCoreViewRemoveAboutStablePosition(HudType:HUDType){
        
        var al : CGFloat = 1
        switch HudType {
        case .kHUDTypeShowImmediately:
            al = 1
            break
        case .kHUDTypeShowSlightly:
            al = 0
            break
        default:
            
            break
        }
        
        UIView.animateWithDuration(0.65, animations: {
            self.coreView.alpha = al
        }) { (true) in
            self.removeFromSuperview()
        }
    }
    
    // 2⃣️上下相关
    func EffectSelfCoreViewRemoveAboutTopAndBottom(HudType:HUDType) {
        
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
            self.coreView.center = CGPointMake(UIScreen.mainScreen().bounds.size.width / 2, UIScreen.mainScreen().bounds.size.height / 2 + value)
            self.setNeedsDisplay()
        }) { (true) in
            self.removeFromSuperview()
        }
        
    }
    
    // 3⃣️左右相关
    func EffectSelfCoreViewRemoveAboutLeftAndRight(HudType:HUDType) {
        
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
            self.coreView.center = CGPointMake(UIScreen.mainScreen().bounds.size.width / 2 + value, UIScreen.mainScreen().bounds.size.height / 2)
            self.setNeedsDisplay()
        }) { (true) in
            self.removeFromSuperview()
        }
        
    }
    
    // 4⃣️内外相关
    func EffectSelfCoreViewRemoveAboutInsideAndOutSide(HudType:HUDType) {
        
        var kScaleValue : CGFloat = 0
        switch HudType {
        case .kHUDTypeScaleFromInsideToOutside:
            kScaleValue = 1.05
            break
        case .kHUDTypeScaleFromOutsideToInside:
            kScaleValue = 0.95
            break
        default:
            
            break
        }
        
        UIView.animateWithDuration(0.65, animations: {
            self.coreView.alpha = 0
            self.coreView.transform = CGAffineTransformScale(self.coreView.transform, 1/kScaleValue, 1/kScaleValue)
            self.coreView.center = CGPointMake(UIScreen.mainScreen().bounds.size.width / 2 , UIScreen.mainScreen().bounds.size.height / 2)
            self.setNeedsDisplay()
        }) { (true) in
            self.removeFromSuperview()
        }
        
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
            self.removeFromSuperview()
        }else if kIfNeedEffect == true {
            UIView.animateWithDuration(0.65, animations: {
                self.coreView.alpha = 0
                self.coreView.center = CGPointMake(self.bgClearView.bounds.size.width / 2, self.bgClearView.bounds.size.height / 2)
            }) { (true) in
                self.removeFromSuperview()
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
            self.removeFromSuperview()
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
            self.removeFromSuperview()
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
            self.removeFromSuperview()
        }
    }
    
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
}

public extension JHB_HUDManager{
    
    // MARK: - 1⃣️单纯显示进程中(Just Show In Progress❤️Type:FromBottomType)
    public func showProgress() {// DEFAULT
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_HUD_haveNoMsg", object: nil)
        /*重写位置*/
        self.coreView.msgLabel.hidden = true
        self.coreView.frame = CGRectMake((SCREEN_WIDTH - 80) / 2, (SCREEN_HEIGHT - 80) / 2, 80, 80)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 + 60)
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
        
        /*实现动画*/
        UIView.animateWithDuration(0.65) {
            self.coreView.alpha = 1
            self.coreView.center = CGPointMake(UIScreen.mainScreen().bounds.size.width / 2, UIScreen.mainScreen().bounds.size.height / 2)
        }
    }
    
    public func showProgressWithType(HudType:HUDType) {// NEW
        self.type = HudType.hashValue
        
        switch HudType {
        case .kHUDTypeDefaultly:
            self.EffectShowProgressAboutTopAndBottom(.kHUDTypeShowFromBottomToTop)
            break
        case .kHUDTypeShowImmediately:
            self.EffectShowProgressAboutStablePositon(.kHUDTypeShowImmediately)
            break
        case .kHUDTypeShowSlightly:
            self.EffectShowProgressAboutStablePositon(.kHUDTypeShowSlightly)
            break
        case .kHUDTypeShowFromBottomToTop:
            self.EffectShowProgressAboutTopAndBottom(.kHUDTypeShowFromBottomToTop)
            break
        case .kHUDTypeShowFromTopToBottom:
            self.EffectShowProgressAboutTopAndBottom(.kHUDTypeShowFromTopToBottom)
            break
        case .kHUDTypeShowFromLeftToRight:
            self.EffectShowProgressAboutLeftAndRight(.kHUDTypeShowFromLeftToRight)
            break
        case .kHUDTypeShowFromRightToLeft:
            self.EffectShowProgressAboutLeftAndRight(.kHUDTypeShowFromRightToLeft)
            break
        case .kHUDTypeScaleFromInsideToOutside:
            self.EffectShowProgressAboutInsideAndOutside(.kHUDTypeScaleFromInsideToOutside)
            break
        case .kHUDTypeScaleFromOutsideToInside:
            self.EffectShowProgressAboutInsideAndOutside(.kHUDTypeScaleFromOutsideToInside)
            break
        default:
            
            break
        }
    }
    // 1⃣️原位置不变化
    private  func EffectShowProgressAboutStablePositon(type:HUDType) {
        
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
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_HUD_haveNoMsg", object: nil)
        /*重写位置*/
        self.coreView.msgLabel.hidden = true
        self.coreView.frame = CGRectMake((SCREEN_WIDTH - 80) / 2, (SCREEN_HEIGHT - 80) / 2, 80, 80)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 )
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
        
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
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_HUD_haveNoMsg", object: nil)
        /*重写位置*/
        self.coreView.msgLabel.hidden = true
        self.coreView.frame = CGRectMake((SCREEN_WIDTH - 80) / 2, (SCREEN_HEIGHT - 80) / 2, 80, 80)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 - value)
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
        
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
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_HUD_haveNoMsg", object: nil)
        /*重写位置*/
        self.coreView.msgLabel.hidden = true
        self.coreView.frame = CGRectMake((SCREEN_WIDTH - 80) / 2, (SCREEN_HEIGHT - 80) / 2, 80, 80)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2 + value, SCREEN_HEIGHT / 2)
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
        
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
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_HUD_haveNoMsgWithScale", object: kScaleValue)
        /*重写位置*/
        self.coreView.msgLabel.hidden = true
        self.coreView.frame = CGRectMake((SCREEN_WIDTH - kInitValue) / 2, (SCREEN_HEIGHT - kInitValue) / 2, kInitValue, kInitValue)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
        
        /*实现动画*/
        UIView.animateWithDuration(0.65){
            self.coreView.alpha = 1
            self.coreView.transform = CGAffineTransformScale(self.coreView.transform, kScaleValue,kScaleValue)
        }
        
    }
    
    // MARK: - 2⃣️显示进程及文字(Show InProgress-Status And The Words Message❤️Type:FromBottomType)
    public func showProgressMsgs(msgs:NSString) {
        coreViewRect = msgs.boundingRectWithSize(CGSizeMake(self.coreView.msgLabel.bounds.width, 1000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [
            NSFontAttributeName:UIFont.systemFontOfSize(15.0)
            ], context: nil)
        var msgLabelWidth = coreViewRect.width
        if msgLabelWidth + 2*kMargin >= (SCREEN_WIDTH - 30) {
            msgLabelWidth = SCREEN_WIDTH - 30 - 2*kMargin
        }else if msgLabelWidth + 2*kMargin <= 80 {
            msgLabelWidth = 80
        }
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_HUD_haveMsg", object: nil)
        self.coreView.frame = CGRectMake((SCREEN_WIDTH - msgLabelWidth) / 2, (SCREEN_HEIGHT - 80) / 2,msgLabelWidth + 2*kMargin , 80)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 + 60)
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
        
        UIView.animateWithDuration(0.65) {
            self.coreView.alpha = 1
            self.coreView.center = CGPointMake(UIScreen.mainScreen().bounds.size.width / 2, UIScreen.mainScreen().bounds.size.height / 2)
            self.setNeedsDisplay()
        }
        
        self.coreView.msgLabelWidth = msgLabelWidth
        self.coreView.msgLabel.text = msgs as String
    }
    
    public func showProgressMsgsWithType(msgs:NSString, HudType:HUDType) {// NEW
        self.type = HudType.hashValue
        
        switch HudType {
        case .kHUDTypeDefaultly:
            self.EffectShowProgressMsgsAboutTopAndBottom(msgs,type: .kHUDTypeShowFromBottomToTop)
            break
        case .kHUDTypeShowImmediately:
            self.EffectShowProgressMsgsAboutStablePosition(msgs, type: .kHUDTypeShowImmediately)
            break
        case .kHUDTypeShowSlightly:
            self.EffectShowProgressMsgsAboutStablePosition(msgs, type: .kHUDTypeShowSlightly)
            break
        case .kHUDTypeShowFromBottomToTop:
            self.EffectShowProgressMsgsAboutTopAndBottom(msgs,type: .kHUDTypeShowFromBottomToTop)
            break
        case .kHUDTypeShowFromTopToBottom:
            self.EffectShowProgressMsgsAboutTopAndBottom(msgs,type:.kHUDTypeShowFromTopToBottom)
            break
        case .kHUDTypeShowFromLeftToRight:
            self.EffectShowProgressMsgsAboutLeftAndRight(msgs, type: .kHUDTypeShowFromLeftToRight)
            break
        case .kHUDTypeShowFromRightToLeft:
            self.EffectShowProgressMsgsAboutLeftAndRight(msgs, type: .kHUDTypeShowFromRightToLeft)
            break
        case .kHUDTypeScaleFromInsideToOutside:
            self.EffectShowProgressMsgsAboutInsideAndOutside(msgs, type: .kHUDTypeScaleFromInsideToOutside)
            break
        case .kHUDTypeScaleFromOutsideToInside:
            self.EffectShowProgressMsgsAboutInsideAndOutside(msgs, type: .kHUDTypeScaleFromOutsideToInside)
            break
        default:
            
            break
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
        
        coreViewRect = msgs.boundingRectWithSize(CGSizeMake(self.coreView.msgLabel.bounds.width, 1000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [
            NSFontAttributeName:UIFont.systemFontOfSize(15.0)
            ], context: nil)
        var msgLabelWidth = coreViewRect.width
        if msgLabelWidth + 2*kMargin >= (SCREEN_WIDTH - 30) {
            msgLabelWidth = SCREEN_WIDTH - 30 - 2*kMargin
        }else if msgLabelWidth + 2*kMargin <= 80 {
            msgLabelWidth = 80
        }
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_HUD_haveMsg", object: nil)
        self.coreView.frame = CGRectMake((SCREEN_WIDTH - msgLabelWidth) / 2, (SCREEN_HEIGHT - 80) / 2,msgLabelWidth + 2*kMargin , 80)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
        
        UIView.animateWithDuration(0.65) {
            self.coreView.alpha = 1
            self.coreView.center = CGPointMake(UIScreen.mainScreen().bounds.size.width / 2, UIScreen.mainScreen().bounds.size.height / 2)
            self.setNeedsDisplay()
        }
        
        self.coreView.msgLabelWidth = msgLabelWidth
        self.coreView.msgLabel.text = msgs as String
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
        
        coreViewRect = msgs.boundingRectWithSize(CGSizeMake(self.coreView.msgLabel.bounds.width, 1000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [
            NSFontAttributeName:UIFont.systemFontOfSize(15.0)
            ], context: nil)
        var msgLabelWidth = coreViewRect.width
        if msgLabelWidth + 2*kMargin >= (SCREEN_WIDTH - 30) {
            msgLabelWidth = SCREEN_WIDTH - 30 - 2*kMargin
        }else if msgLabelWidth + 2*kMargin <= 80 {
            msgLabelWidth = 80
        }
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_HUD_haveMsg", object: nil)
        self.coreView.frame = CGRectMake((SCREEN_WIDTH - msgLabelWidth) / 2, (SCREEN_HEIGHT - 80) / 2,msgLabelWidth + 2*kMargin , 80)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 + value)
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
        
        UIView.animateWithDuration(0.65) {
            self.coreView.alpha = 1
            self.coreView.center = CGPointMake(UIScreen.mainScreen().bounds.size.width / 2, UIScreen.mainScreen().bounds.size.height / 2)
            self.setNeedsDisplay()
        }
        
        self.coreView.msgLabelWidth = msgLabelWidth
        self.coreView.msgLabel.text = msgs as String
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
        
        coreViewRect = msgs.boundingRectWithSize(CGSizeMake(self.coreView.msgLabel.bounds.width, 1000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [
            NSFontAttributeName:UIFont.systemFontOfSize(15.0)
            ], context: nil)
        var msgLabelWidth = coreViewRect.width
        if msgLabelWidth + 2*kMargin >= (SCREEN_WIDTH - 30) {
            msgLabelWidth = SCREEN_WIDTH - 30 - 2*kMargin
        }else if msgLabelWidth + 2*kMargin <= 80 {
            msgLabelWidth = 80
        }
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_HUD_haveMsg", object: nil)
        self.coreView.frame = CGRectMake((SCREEN_WIDTH - msgLabelWidth) / 2, (SCREEN_HEIGHT - 80) / 2,msgLabelWidth + 2*kMargin , 80)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2 + value, SCREEN_HEIGHT / 2)
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
        
        UIView.animateWithDuration(0.65) {
            self.coreView.alpha = 1
            self.coreView.center = CGPointMake(UIScreen.mainScreen().bounds.size.width / 2, UIScreen.mainScreen().bounds.size.height / 2)
            self.setNeedsDisplay()
        }
        
        self.coreView.msgLabelWidth = msgLabelWidth
        self.coreView.msgLabel.text = msgs as String
    }
    // 4⃣️内外相关
    private  func EffectShowProgressMsgsAboutInsideAndOutside(msgs:NSString,type:HUDType){
        
        coreViewRect = msgs.boundingRectWithSize(CGSizeMake(self.coreView.msgLabel.bounds.width, 1000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [
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
            iniWidthValue = CoreWidth/kScaleValue
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
        self.coreView.msgLabelWidth = iniWidthValue
        self.coreView.msgLabel.text = msgs as String
        
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_HUD_haveMsg_WithScale", object: kScaleValue)
        
        self.coreView.frame = CGRectMake((SCREEN_WIDTH - msgLabelWidth) / 2, (SCREEN_HEIGHT - iniHeightValue) / 2,iniWidthValue , iniHeightValue)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)
        
        
        
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
        
        UIView.animateWithDuration(0.65) {
            self.coreView.alpha = 1
            self.coreView.transform = CGAffineTransformScale(self.coreView.transform, kScaleValue,kScaleValue)
            self.coreView.center = CGPointMake(UIScreen.mainScreen().bounds.size.width / 2, UIScreen.mainScreen().bounds.size.height / 2)
            self.setNeedsDisplay()
        }
        
    }
    
    
    // MARK: - 3⃣️显示文字信息并完成隐藏(Show The Words_Message And Hidden When Finished❤️Type:FromBottomType)
    /*
     ********
     ***There Are Two Methods For The Type Of 'Just-Show-Message' , The First One is 'Show-Multi-Line',You Can Use This One To Sure That You Can Display Multi Line Message
     *********
     ***Parameters:
     'msgs':It is The Content That You Want To Display;
     'coreInSet':It Is The Value That Decide The Margin Between CoreView And The Main-Window(Just Including CoreView's Left To Window's Left Or CoreView's Right To Window's Right)
     'labelInSet':It Is The Value That Decide The Margin Between CoreView And The Message-Label(Just Including CoreView's Left To Label's Left Or CoreView's Right To Label's Right)
     *********
     ***PS : You'd Better Be Sure That  The Addition Of 'coreInSet'*2 And 'labelInSet'*2 Lower Than 'SCREEN_WIDTH - 30' ,Or It Will Reset The Margin Value Be 30 Both CoreView-To-Window And Label-To-Window     */
    // ❤️<一>:显示多行(Show Multi Line)
    public func showMultiLine(msgs:NSString, coreInSet:CGFloat, labelInSet:CGFloat, delay:Double){
        var KCore = coreInSet
        var KLabel = labelInSet
        coreViewRect = msgs.boundingRectWithSize(CGSizeMake(self.coreView.msgLabel.bounds.width, 1000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [
            NSFontAttributeName:UIFont.systemFontOfSize(15.0)
            ], context: nil)
        if coreViewRect.width > (SCREEN_WIDTH - coreInSet) {
            var paramSet : CGFloat = 0
            
            if (labelInSet+coreInSet)*2 > SCREEN_WIDTH-30 {
                KCore = 30
                KLabel = 30
                paramSet = (KCore+KLabel)*2
            }else{
                paramSet = (KCore+KLabel)*2
            }
            
            coreViewRect = msgs.boundingRectWithSize(CGSizeMake(SCREEN_WIDTH-paramSet, 1000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [
                NSFontAttributeName:UIFont.systemFontOfSize(15.0)
                ], context: nil)
        }
        let msgLabelWidth = coreViewRect.width
        let msgLabelHeight = coreViewRect.height
        
        self.coreView.actView.stopAnimating()
        self.coreView.frame = CGRectMake(KCore, (SCREEN_HEIGHT - 60) / 2,SCREEN_WIDTH - KCore*2  , msgLabelHeight+20)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 + 60)
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
        
        self.coreView.msgLabelWidth = msgLabelWidth
        self.coreView.msgLabelHeight = msgLabelHeight
        self.coreView.kContent = msgs as String
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_HUD_onlyAMsgMultipleShow", object: nil)
        self.coreViewShowAndHideWithAnimation(delay)
    }
    public func showMultiLineWithType(msgs:NSString, coreInSet:CGFloat, labelInSet:CGFloat, delay:Double,HudType:HUDType){
        
        self.type = HudType.hashValue
        
        switch HudType {
        case .kHUDTypeDefaultly:
            self.EffectShowMultiMsgsAboutTopAndBottom(msgs,coreInSet: coreInSet,labelInSet: labelInSet,delay: delay,type: .kHUDTypeShowFromBottomToTop)
            break
        case .kHUDTypeShowImmediately:
            self.EffectShowMultiMsgsAboutStablePosition(msgs, coreInSet: coreInSet, labelInSet: labelInSet, delay: delay, type: .kHUDTypeShowImmediately)
            break
        case .kHUDTypeShowSlightly:
            self.EffectShowMultiMsgsAboutStablePosition(msgs, coreInSet: coreInSet, labelInSet: labelInSet, delay: delay, type: .kHUDTypeShowSlightly)
            break
        case .kHUDTypeShowFromBottomToTop:
            self.EffectShowMultiMsgsAboutTopAndBottom(msgs,coreInSet: coreInSet,labelInSet: labelInSet,delay: delay,type: .kHUDTypeShowFromBottomToTop)
            break
        case .kHUDTypeShowFromTopToBottom:
            self.EffectShowMultiMsgsAboutTopAndBottom(msgs,coreInSet: coreInSet,labelInSet: labelInSet,delay: delay,type: .kHUDTypeShowFromTopToBottom)
            break
        case .kHUDTypeShowFromLeftToRight:
            self.EffectShowMultiMsgsAboutLeftAndRight(msgs, coreInSet: coreInSet, labelInSet: labelInSet, delay: delay, type: .kHUDTypeShowFromLeftToRight)
            break
        case .kHUDTypeShowFromRightToLeft:
            self.EffectShowMultiMsgsAboutLeftAndRight(msgs, coreInSet: coreInSet, labelInSet: labelInSet, delay: delay, type: .kHUDTypeShowFromRightToLeft)
            break
        case .kHUDTypeScaleFromInsideToOutside:
            self.EffectShowMultiMsgsAboutInsideAndOutside(msgs, coreInSet: coreInSet, labelInSet: labelInSet, delay: delay, type: .kHUDTypeScaleFromInsideToOutside)
            break
        case .kHUDTypeScaleFromOutsideToInside:
            self.EffectShowMultiMsgsAboutInsideAndOutside(msgs, coreInSet: coreInSet, labelInSet: labelInSet, delay: delay, type: .kHUDTypeScaleFromOutsideToInside)
            break
        default:
            
            break
        }
        
    }
    // 1⃣️原位置不变
    private  func EffectShowMultiMsgsAboutStablePosition(msgs:NSString, coreInSet:CGFloat, labelInSet:CGFloat, delay:Double,type:HUDType){
        
        switch type {
        case .kHUDTypeShowImmediately:
            self.coreView.alpha = 1;
            break
        case .kHUDTypeShowSlightly:
            self.coreView.alpha = 0;
            break
        default:
            
            break
        }
        
        var KCore = coreInSet
        var KLabel = labelInSet
        coreViewRect = msgs.boundingRectWithSize(CGSizeMake(self.coreView.msgLabel.bounds.width, 1000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [
            NSFontAttributeName:UIFont.systemFontOfSize(15.0)
            ], context: nil)
        if coreViewRect.width > (SCREEN_WIDTH - coreInSet) {
            var paramSet : CGFloat = 0
            
            if (labelInSet+coreInSet)*2 > SCREEN_WIDTH-30 {
                KCore = 30
                KLabel = 30
                paramSet = (KCore+KLabel)*2
            }else{
                paramSet = (KCore+KLabel)*2
            }
            
            coreViewRect = msgs.boundingRectWithSize(CGSizeMake(SCREEN_WIDTH-paramSet, 1000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [
                NSFontAttributeName:UIFont.systemFontOfSize(15.0)
                ], context: nil)
        }
        let msgLabelWidth = coreViewRect.width
        let msgLabelHeight = coreViewRect.height
        
        self.coreView.actView.stopAnimating()
        self.coreView.frame = CGRectMake(KCore, (SCREEN_HEIGHT - 60) / 2,SCREEN_WIDTH - KCore*2  , msgLabelHeight+20)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
        
        self.coreView.msgLabelWidth = msgLabelWidth
        self.coreView.msgLabelHeight = msgLabelHeight
        self.coreView.kContent = msgs as String
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_HUD_onlyAMsgMultipleShow", object: nil)
        self.coreViewShowAndHideWithAnimation(delay)
    }
    
    // 2⃣️上下相关
    private  func EffectShowMultiMsgsAboutTopAndBottom(msgs:NSString, coreInSet:CGFloat, labelInSet:CGFloat, delay:Double,type:HUDType){
        
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
        
        var KCore = coreInSet
        var KLabel = labelInSet
        coreViewRect = msgs.boundingRectWithSize(CGSizeMake(self.coreView.msgLabel.bounds.width, 1000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [
            NSFontAttributeName:UIFont.systemFontOfSize(15.0)
            ], context: nil)
        if coreViewRect.width > (SCREEN_WIDTH - coreInSet) {
            var paramSet : CGFloat = 0
            
            if (labelInSet+coreInSet)*2 > SCREEN_WIDTH-30 {
                KCore = 30
                KLabel = 30
                paramSet = (KCore+KLabel)*2
            }else{
                paramSet = (KCore+KLabel)*2
            }
            
            coreViewRect = msgs.boundingRectWithSize(CGSizeMake(SCREEN_WIDTH-paramSet, 1000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [
                NSFontAttributeName:UIFont.systemFontOfSize(15.0)
                ], context: nil)
        }
        let msgLabelWidth = coreViewRect.width
        let msgLabelHeight = coreViewRect.height
        
        self.coreView.actView.stopAnimating()
        self.coreView.frame = CGRectMake(KCore, (SCREEN_HEIGHT - 60) / 2,SCREEN_WIDTH - KCore*2  , msgLabelHeight+20)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 + value)
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
        
        self.coreView.msgLabelWidth = msgLabelWidth
        self.coreView.msgLabelHeight = msgLabelHeight
        self.coreView.kContent = msgs as String
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_HUD_onlyAMsgMultipleShow", object: nil)
        self.coreViewShowAndHideWithAnimation(delay)
    }
    
    // 3⃣️左右相关
    private  func EffectShowMultiMsgsAboutLeftAndRight(msgs:NSString, coreInSet:CGFloat, labelInSet:CGFloat, delay:Double,type:HUDType){
        
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
        
        var KCore = coreInSet
        var KLabel = labelInSet
        coreViewRect = msgs.boundingRectWithSize(CGSizeMake(self.coreView.msgLabel.bounds.width, 1000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [
            NSFontAttributeName:UIFont.systemFontOfSize(15.0)
            ], context: nil)
        if coreViewRect.width > (SCREEN_WIDTH - coreInSet) {
            var paramSet : CGFloat = 0
            
            if (labelInSet+coreInSet)*2 > SCREEN_WIDTH-30 {
                KCore = 30
                KLabel = 30
                paramSet = (KCore+KLabel)*2
            }else{
                paramSet = (KCore+KLabel)*2
            }
            
            coreViewRect = msgs.boundingRectWithSize(CGSizeMake(SCREEN_WIDTH-paramSet, 1000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [
                NSFontAttributeName:UIFont.systemFontOfSize(15.0)
                ], context: nil)
        }
        let msgLabelWidth = coreViewRect.width
        let msgLabelHeight = coreViewRect.height
        
        self.coreView.actView.stopAnimating()
        self.coreView.frame = CGRectMake(KCore, (SCREEN_HEIGHT - 60) / 2,SCREEN_WIDTH - KCore*2  , msgLabelHeight+40)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2 + value, SCREEN_HEIGHT / 2)
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
        
        self.coreView.msgLabelWidth = msgLabelWidth
        self.coreView.msgLabelHeight = msgLabelHeight
        self.coreView.kContent = msgs as String
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_HUD_onlyAMsgMultipleShow", object: nil)
        self.coreViewShowAndHideWithAnimation(delay)
    }
    
    // 4⃣️内外相关
    private  func EffectShowMultiMsgsAboutInsideAndOutside(msgs:NSString, coreInSet:CGFloat, labelInSet:CGFloat, delay:Double,type:HUDType){
        
        var KCore = coreInSet
        var KLabel = labelInSet
        coreViewRect = msgs.boundingRectWithSize(CGSizeMake(self.coreView.msgLabel.bounds.width, 1000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [
            NSFontAttributeName:UIFont.systemFontOfSize(15.0)
            ], context: nil)
        if coreViewRect.width > (SCREEN_WIDTH - coreInSet) {
            var paramSet : CGFloat = 0
            
            if (labelInSet+coreInSet)*2 > SCREEN_WIDTH-30 {
                KCore = 30
                KLabel = 30
                paramSet = (KCore+KLabel)*2
            }else{
                paramSet = (KCore+KLabel)*2
            }
            
            coreViewRect = msgs.boundingRectWithSize(CGSizeMake(SCREEN_WIDTH-paramSet, 1000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [
                NSFontAttributeName:UIFont.systemFontOfSize(15.0)
                ], context: nil)
        }
        
        let msgLabelWidth = coreViewRect.width
        let msgLabelHeight = coreViewRect.height
        
        var iniWidthValue : CGFloat = 0
        var iniHeightValue : CGFloat = 0
        var kScaleValue : CGFloat = 0
        
        switch type {
        case .kHUDTypeScaleFromInsideToOutside:
            kScaleValue = 1.05
            iniWidthValue = (msgLabelWidth + 2*KLabel)/kScaleValue
            iniHeightValue = (msgLabelHeight + 40)/kScaleValue
            break
        case .kHUDTypeScaleFromOutsideToInside:
            kScaleValue = 0.95
            iniWidthValue = (msgLabelWidth + 2*KLabel)/kScaleValue
            iniHeightValue = (msgLabelHeight + 40)/kScaleValue
            break
        default:
            
            break
        }
        
        
        self.coreView.actView.stopAnimating()
        self.coreView.frame = CGRectMake(KCore, (SCREEN_HEIGHT - iniWidthValue) / 2,iniWidthValue , iniHeightValue+20)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
        
        self.coreView.msgLabelWidth = msgLabelWidth
        self.coreView.msgLabelHeight = msgLabelHeight
        self.coreView.kContent = msgs as String
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_HUD_onlyAMsgMultipleShowWithScale", object: kScaleValue)
        
        
        UIView.animateWithDuration(0.65, animations: {
            self.coreView.alpha = 1
            self.coreView.transform = CGAffineTransformScale(self.coreView.transform, kScaleValue, kScaleValue)
            self.coreView.center = CGPointMake(UIScreen.mainScreen().bounds.size.width / 2, UIScreen.mainScreen().bounds.size.height / 2)
            self.setNeedsDisplay()
        }) { (true) in
            self.performSelector(#selector(JHB_HUDManager.selfCoreViewRemoveFromSuperview), withObject: self, afterDelay: delay)
        }
        
    }
    
    // ❤️<二>:显示单行(Show Single Line)
    /*
     *********
     ***There Is Only One Paramter,That Is The Content You Want To Display ,And If You Want To Show A Brief Message Or Just One-Line Message,You All Can Use The One!
     */
    public func show(msgs:NSString) {// DEFAULT
        coreViewRect = msgs.boundingRectWithSize(CGSizeMake(self.coreView.msgLabel.bounds.width, 150000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [
            NSFontAttributeName:UIFont.systemFontOfSize(15.0)
            ], context: nil)
        var msgLabelWidth = coreViewRect.width
        let msgLabelHeight = coreViewRect.height
        if msgLabelWidth + 2*kMargin >= (SCREEN_WIDTH - 30) {
            msgLabelWidth = SCREEN_WIDTH - 30 - 2*kMargin
        }else if msgLabelWidth + 2*kMargin <= 80 {
            msgLabelWidth = 80
        }
        
        self.coreView.actView.stopAnimating()
        self.coreView.frame = CGRectMake((SCREEN_WIDTH - msgLabelWidth) / 2, (SCREEN_HEIGHT - 60) / 2,msgLabelWidth + 2*kMargin , 60)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 + 60)
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
        
        
        self.coreView.msgLabelWidth = msgLabelWidth-20
        self.coreView.msgLabelHeight = msgLabelHeight
        self.coreView.kContent = msgs as String
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_HUD_onlyAMsgShow", object: nil)
        self.coreViewShowAndHideWithAnimation(0)
        
    }
    public func showWithType(msgs:NSString,HudType:HUDType){
        self.type = HudType.hashValue
        
        switch HudType {
        case .kHUDTypeDefaultly:
            self.EffectShowMsgsAboutTopAndBottom(msgs,type: .kHUDTypeShowFromBottomToTop)
            break
        case .kHUDTypeShowImmediately:
            self.EffectShowMsgsAboutStablePosition(msgs, type: .kHUDTypeShowImmediately)
            break
        case .kHUDTypeShowSlightly:
            self.EffectShowMsgsAboutStablePosition(msgs, type: .kHUDTypeShowSlightly)
            break
        case .kHUDTypeShowFromBottomToTop:
            self.EffectShowMsgsAboutTopAndBottom(msgs,type: .kHUDTypeShowFromBottomToTop)
            break
        case .kHUDTypeShowFromTopToBottom:
            self.EffectShowMsgsAboutTopAndBottom(msgs,type:.kHUDTypeShowFromTopToBottom)
            break
        case .kHUDTypeShowFromLeftToRight:
            self.EffectShowMsgsAboutLeftAndRight(msgs, type: .kHUDTypeShowFromLeftToRight)
            break
        case .kHUDTypeShowFromRightToLeft:
            self.EffectShowMsgsAboutLeftAndRight(msgs, type: .kHUDTypeShowFromRightToLeft)
            break
        case .kHUDTypeScaleFromInsideToOutside:
            self.EffectShowMsgsAboutInsideAndOutside(msgs, type: .kHUDTypeScaleFromInsideToOutside)
            break
        case .kHUDTypeScaleFromOutsideToInside:
            self.EffectShowMsgsAboutInsideAndOutside(msgs, type: .kHUDTypeScaleFromOutsideToInside)
            break
        default:
            
            break
        }
    }
    
    // 1⃣️原位置不变
    private func EffectShowMsgsAboutStablePosition(msgs:NSString,type:HUDType) {
        
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
        
        coreViewRect = msgs.boundingRectWithSize(CGSizeMake(self.coreView.msgLabel.bounds.width, 150000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [
            NSFontAttributeName:UIFont.systemFontOfSize(15.0)
            ], context: nil)
        var msgLabelWidth = coreViewRect.width
        let msgLabelHeight = coreViewRect.height
        if msgLabelWidth + 2*kMargin >= (SCREEN_WIDTH - 30) {
            msgLabelWidth = SCREEN_WIDTH - 30 - 2*kMargin
        }else if msgLabelWidth + 2*kMargin <= 80 {
            msgLabelWidth = 80
        }
        
        self.coreView.actView.stopAnimating()
        self.coreView.frame = CGRectMake((SCREEN_WIDTH - msgLabelWidth) / 2, (SCREEN_HEIGHT - 60) / 2,msgLabelWidth + 2*kMargin , 60)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 )
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
        
        
        self.coreView.msgLabelWidth = msgLabelWidth-20
        self.coreView.msgLabelHeight = msgLabelHeight
        self.coreView.kContent = msgs as String
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_HUD_onlyAMsgShow", object: nil)
        self.coreViewShowAndHideWithAnimation(2)
    }
    
    // 2⃣️上下相关
    private func EffectShowMsgsAboutTopAndBottom(msgs:NSString,type:HUDType)  {
        
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
        
        coreViewRect = msgs.boundingRectWithSize(CGSizeMake(self.coreView.msgLabel.bounds.width, 150000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [
            NSFontAttributeName:UIFont.systemFontOfSize(15.0)
            ], context: nil)
        var msgLabelWidth = coreViewRect.width
        let msgLabelHeight = coreViewRect.height
        if msgLabelWidth + 2*kMargin >= (SCREEN_WIDTH - 30) {
            msgLabelWidth = SCREEN_WIDTH - 30 - 2*kMargin
        }else if msgLabelWidth + 2*kMargin <= 80 {
            msgLabelWidth = 80
        }
        
        self.coreView.actView.stopAnimating()
        self.coreView.frame = CGRectMake((SCREEN_WIDTH - msgLabelWidth) / 2, (SCREEN_HEIGHT - 60) / 2,msgLabelWidth + 2*kMargin , 60)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 + value)
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
        
        
        self.coreView.msgLabelWidth = msgLabelWidth-20
        self.coreView.msgLabelHeight = msgLabelHeight
        self.coreView.kContent = msgs as String
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_HUD_onlyAMsgShow", object: nil)
        self.coreViewShowAndHideWithAnimation(0)
    }
    
    // 3⃣️左右相关
    private func EffectShowMsgsAboutLeftAndRight(msgs:NSString,type:HUDType)  {
        
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
        
        coreViewRect = msgs.boundingRectWithSize(CGSizeMake(self.coreView.msgLabel.bounds.width, 150000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [
            NSFontAttributeName:UIFont.systemFontOfSize(15.0)
            ], context: nil)
        var msgLabelWidth = coreViewRect.width
        let msgLabelHeight = coreViewRect.height
        if msgLabelWidth + 2*kMargin >= (SCREEN_WIDTH - 30) {
            msgLabelWidth = SCREEN_WIDTH - 30 - 2*kMargin
        }else if msgLabelWidth + 2*kMargin <= 80 {
            msgLabelWidth = 80
        }
        
        self.coreView.actView.stopAnimating()
        self.coreView.frame = CGRectMake((SCREEN_WIDTH - msgLabelWidth) / 2, (SCREEN_HEIGHT - 60) / 2,msgLabelWidth + 2*kMargin , 60)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2 + value, SCREEN_HEIGHT / 2 )
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
        
        
        self.coreView.msgLabelWidth = msgLabelWidth-20
        self.coreView.msgLabelHeight = msgLabelHeight
        self.coreView.kContent = msgs as String
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_HUD_onlyAMsgShow", object: nil)
        self.coreViewShowAndHideWithAnimation(0)
    }
    
    // 4⃣️内外相关
    private func EffectShowMsgsAboutInsideAndOutside(msgs:NSString,type:HUDType)  {
        
        coreViewRect = msgs.boundingRectWithSize(CGSizeMake(self.coreView.msgLabel.bounds.width, 150000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [
            NSFontAttributeName:UIFont.systemFontOfSize(15.0)
            ], context: nil)
        var msgLabelWidth = coreViewRect.width
        let msgLabelHeight = coreViewRect.height
        if msgLabelWidth + 2*kMargin >= (SCREEN_WIDTH - 30) {
            msgLabelWidth = SCREEN_WIDTH - 30 - 2*kMargin
        }else if msgLabelWidth + 2*kMargin <= 80 {
            msgLabelWidth = 80
        }
        let CoreWidth = msgLabelWidth + 2*kMargin
        var iniWidthValue : CGFloat = 0
        var kScaleValue : CGFloat = 0
        
        switch type {
        case .kHUDTypeScaleFromInsideToOutside:
            kScaleValue = 1.05
            iniWidthValue = CoreWidth/kScaleValue
            break
        case .kHUDTypeScaleFromOutsideToInside:
            kScaleValue = 0.95
            iniWidthValue = CoreWidth/kScaleValue
            break
        default:
            
            break
        }
        
        self.coreView.msgLabelWidth = msgLabelWidth-20
        self.coreView.msgLabelHeight = msgLabelHeight
        self.coreView.kContent = msgs as String
        
        self.coreView.actView.stopAnimating()
        self.coreView.frame = CGRectMake((SCREEN_WIDTH - iniWidthValue) / 2, (SCREEN_HEIGHT - 60) / 2,iniWidthValue + 2*kMargin , 60)
        self.coreView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 )
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
        
        NSNotificationCenter.defaultCenter().postNotificationName("JHB_HUD_onlyAMsgShowWithScale", object: kScaleValue)
        UIView.animateWithDuration(0.65, animations: {
            self.coreView.alpha = 1
            self.coreView.transform = CGAffineTransformScale(self.coreView.transform, kScaleValue, kScaleValue)
            self.coreView.center = CGPointMake(UIScreen.mainScreen().bounds.size.width / 2, UIScreen.mainScreen().bounds.size.height / 2)
            self.setNeedsDisplay()
        }) { (true) in
            self.performSelector(#selector(JHB_HUDManager.selfCoreViewRemoveFromSuperview), withObject: self, afterDelay: 1.5)
        }
        
    }
    
    // MARK: - 隐藏(Hidden❤️Type:dissolveToTop)
    public func hideProgress() {// DEFAULT
        self.performSelector(#selector(JHB_HUDManager.hideWithAnimation), withObject: self, afterDelay: 0.6)
    }
    private func hideHud() {
        self.hideProgress()
    }
    
}
