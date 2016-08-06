/********************** JHB_HUDView.swift ***********************/
/*******  (蒋红宝)  **********************************************/
/*******  Created by Leon_pan on 16/6/12. ***********************/
/*******  Copyright © 2016年 CoderBala. All rights reserved.*****/
/********************** JHB_HUDView.swift ***********************/

import UIKit

class JHB_HUDView: UIView {
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
    
    // MARK: - Interface
    override init(frame: CGRect) {
        super.init(frame: UIScreen.mainScreen().bounds)
        
        self.setSubViews()
        self.addSubview(self.bgClearView);
        self.addSubview(self.coreView);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
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
    
    // MARK: - 1⃣️单纯显示进程中(Just Show In Progress❤️Type:FromBottomType)
    func showProgress() {
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
    
    // MARK: - 2⃣️显示进程及文字(Show InProgress-Status And The Words Message❤️Type:FromBottomType)
    func showProgressMsgs(msgs:NSString) {
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
    func showMultiLine(msgs:NSString, coreInSet:CGFloat, labelInSet:CGFloat, delay:Double){
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
    
    // ❤️<二>:显示单行(Show Single Line)
    /*
     *********
     ***There Is Only One Paramter,That Is The Content You Want To Display ,And If You Want To Show A Brief Message Or Just One-Line Message,You All Can Use The One!
     */
    func show(msgs:NSString) {
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

    // 只显示信息内容时的CoreView的行为效果(The Behavior Effect Of 'CoreView' When Just Show Message-Content)
    @objc private func coreViewShowAndHideWithAnimation(delay:Double){
        UIView.animateWithDuration(0.65, animations: {
            self.coreView.alpha = 1
            self.coreView.center = CGPointMake(UIScreen.mainScreen().bounds.size.width / 2, UIScreen.mainScreen().bounds.size.height / 2)
            self.setNeedsDisplay()
        }) { (true) in
            self.performSelector(#selector(JHB_HUDView.selfCoreViewRemoveFromSuperview), withObject: self, afterDelay: delay)
        }
    }
    @objc private func selfCoreViewRemoveFromSuperview(){
        UIView.animateWithDuration(0.65, animations: {
            self.coreView.alpha = 0
            self.coreView.center = CGPointMake(UIScreen.mainScreen().bounds.size.width / 2, UIScreen.mainScreen().bounds.size.height / 2 - 60)
            self.setNeedsDisplay()
        }) { (true) in
            self.removeFromSuperview()
        }
    }
    // MARK: - 隐藏(Hidden❤️Type:dissolveToTop)
    func hideProgress() {
        self.performSelector(#selector(JHB_HUDView.hideWithAnimation), withObject: self, afterDelay: 0.6)
    }
    func hideHud() {
        self.hideProgress()
    }
    // MARK: - Self-Method Without Ask
    @objc private func hideWithAnimation() {
        UIView.animateWithDuration(0.65, animations: {
            self.coreView.alpha = 0
            self.coreView.center = CGPointMake(self.bgClearView.bounds.size.width / 2, self.bgClearView.bounds.size.height / 2 - 60)
        }) { (true) in
            self.removeFromSuperview()
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()

    }

}
