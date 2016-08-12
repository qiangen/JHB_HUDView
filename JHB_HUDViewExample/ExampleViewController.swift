//
//  ExampleViewController.swift
//  JHB_HUDViewExample
//
//  Created by Leon_pan on 16/8/8.
//  Copyright © 2016年 bruce. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {
    // MARK: parameters
    let SCREEN_WIDTH  = UIScreen.mainScreen().bounds.size.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    let multiStr = "你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala"
    
    var kMargin : CGFloat = 50
    override func viewDidLoad() {
        let version1 = UILabel.init()
        version1.frame = CGRectMake(0, 20, SCREEN_WIDTH, 50)
        version1.text = "PreVersion:默认自下而上效果"
        version1.textColor = UIColor.redColor()
        version1.sizeToFit()
        self.view.addSubview(version1)
        /********************❤️First Version***********************/
        let hudBtn = UIButton.init()
        hudBtn.frame = CGRectMake(0, 50, 40, 50)
        hudBtn.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn.setTitle("转圈圈", forState: UIControlState.Normal)
        hudBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn.sizeToFit()
        hudBtn.backgroundColor = UIColor.whiteColor()
        hudBtn.addTarget(self, action: #selector(ExampleViewController.justshowcircle(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(hudBtn)
        
        let netAskBtn = UIButton.init()
        netAskBtn.frame = CGRectMake(60, 50, 50, 50)
        netAskBtn.titleLabel?.font = UIFont.systemFontOfSize(13)
        netAskBtn.setTitle("转圈圈还有字", forState: UIControlState.Normal)
        netAskBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        netAskBtn.sizeToFit()
        netAskBtn.backgroundColor = UIColor.whiteColor()
        netAskBtn.addTarget(self, action: #selector(ExampleViewController.netAskBtnClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(netAskBtn)
        
        let hudBtn2 = UIButton.init()
        hudBtn2.frame = CGRectMake(150, 50, 50, 50)
        hudBtn2.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn2.setTitle("只有字只一行", forState: UIControlState.Normal)
        hudBtn2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn2.sizeToFit()
        hudBtn2.backgroundColor = UIColor.whiteColor()
        hudBtn2.addTarget(self, action: #selector(ExampleViewController.justshowAlineMsg(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(hudBtn2)
        
        let hudBtn3 = UIButton.init()
        hudBtn3.frame = CGRectMake(240, 50, 50, 50)
        hudBtn3.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn3.setTitle("只有字好多行", forState: UIControlState.Normal)
        hudBtn3.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn3.sizeToFit()
        hudBtn3.backgroundColor = UIColor.whiteColor()
        hudBtn3.addTarget(self, action: #selector(ExampleViewController.hudBtnClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(hudBtn3)
        
        let version2 = UILabel.init()
        version2.frame = CGRectMake(0, 90, SCREEN_WIDTH, 50)
        version2.text = "NewVersion:新增隐现/左右/缩放效果"
        version2.textColor = UIColor.redColor()
        version2.sizeToFit()
        self.view.addSubview(version2)
        /********************❤️Second Version***********************/
        let hudBtn4 = UIButton.init()
        hudBtn4.frame = CGRectMake(0, 130, 50, 50)
        hudBtn4.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn4.setTitle("转圈圈-慢慢放大", forState: UIControlState.Normal)
        hudBtn4.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn4.sizeToFit()
        hudBtn4.backgroundColor = UIColor.whiteColor()
        hudBtn4.addTarget(self, action: #selector(ExampleViewController.hudBtnClickedWithType1(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hudBtn4)
        
        let hudBtn5 = UIButton.init()
        hudBtn5.frame = CGRectMake(0, 170, 50, 50)
        hudBtn5.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn5.setTitle("转圈圈-慢慢放小", forState: UIControlState.Normal)
        hudBtn5.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn5.sizeToFit()
        hudBtn5.backgroundColor = UIColor.whiteColor()
        hudBtn5.addTarget(self, action: #selector(ExampleViewController.hudBtnClickedWithType2(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hudBtn5)
        
        let hudBtn6 = UIButton.init()
        hudBtn6.frame = CGRectMake(0, 210, 50, 50)
        hudBtn6.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn6.setTitle("转圈圈-从左到右", forState: UIControlState.Normal)
        hudBtn6.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn6.sizeToFit()
        hudBtn6.backgroundColor = UIColor.whiteColor()
        hudBtn6.addTarget(self, action: #selector(ExampleViewController.hudBtnClickedWithType3(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hudBtn6)
        
        let hudBtn7 = UIButton.init()
        hudBtn7.frame = CGRectMake(0, 250, 50, 50)
        hudBtn7.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn7.setTitle("转圈圈-从右到左", forState: UIControlState.Normal)
        hudBtn7.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn7.sizeToFit()
        hudBtn7.backgroundColor = UIColor.whiteColor()
        hudBtn7.addTarget(self, action: #selector(ExampleViewController.hudBtnClickedWithType4(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hudBtn7)
        
        let hudBtn8 = UIButton.init()
        hudBtn8.frame = CGRectMake(0, 290, 50, 50)
        hudBtn8.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn8.setTitle("转圈圈-从上到下", forState: UIControlState.Normal)
        hudBtn8.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn8.sizeToFit()
        hudBtn8.backgroundColor = UIColor.whiteColor()
        hudBtn8.addTarget(self, action: #selector(ExampleViewController.hudBtnClickedWithType5(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hudBtn8)
        
        let hudBtn9 = UIButton.init()
        hudBtn9.frame = CGRectMake(0, 330, 50, 50)
        hudBtn9.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn9.setTitle("转圈圈-从下到上", forState: UIControlState.Normal)
        hudBtn9.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn9.sizeToFit()
        hudBtn9.backgroundColor = UIColor.whiteColor()
        hudBtn9.addTarget(self, action: #selector(ExampleViewController.hudBtnClickedWithType6(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hudBtn9)
        
        
        /****************************************************/
        let hudBtn10 = UIButton.init()
        hudBtn10.frame = CGRectMake(CGRectGetMaxX(hudBtn9.frame)+kMargin, 130, 50, 50)
        hudBtn10.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn10.setTitle("转圈圈也有字-慢慢放大", forState: UIControlState.Normal)
        hudBtn10.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn10.sizeToFit()
        hudBtn10.backgroundColor = UIColor.whiteColor()
        hudBtn10.addTarget(self, action: #selector(ExampleViewController.hudBtnClickedWithType10(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hudBtn10)
        
        let hudBtn11 = UIButton.init()
        hudBtn11.frame = CGRectMake(CGRectGetMaxX(hudBtn9.frame)+kMargin, 170, 50, 50)
        hudBtn11.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn11.setTitle("转圈圈也有字-慢慢放小", forState: UIControlState.Normal)
        hudBtn11.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn11.sizeToFit()
        hudBtn11.backgroundColor = UIColor.whiteColor()
        hudBtn11.addTarget(self, action: #selector(ExampleViewController.hudBtnClickedWithType11(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hudBtn11)
        
        let hudBtn12 = UIButton.init()
        hudBtn12.frame = CGRectMake(CGRectGetMaxX(hudBtn9.frame)+kMargin, 210, 50, 50)
        hudBtn12.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn12.setTitle("转圈圈也有字-从左到右", forState: UIControlState.Normal)
        hudBtn12.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn12.sizeToFit()
        hudBtn12.backgroundColor = UIColor.whiteColor()
        hudBtn12.addTarget(self, action: #selector(ExampleViewController.hudBtnClickedWithType12(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hudBtn12)
        
        let hudBtn13 = UIButton.init()
        hudBtn13.frame = CGRectMake(CGRectGetMaxX(hudBtn9.frame)+kMargin, 250, 50, 50)
        hudBtn13.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn13.setTitle("转圈圈也有字-从右到左", forState: UIControlState.Normal)
        hudBtn13.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn13.sizeToFit()
        hudBtn13.backgroundColor = UIColor.whiteColor()
        hudBtn13.addTarget(self, action: #selector(ExampleViewController.hudBtnClickedWithType13(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hudBtn13)
        
        let hudBtn14 = UIButton.init()
        hudBtn14.frame = CGRectMake(CGRectGetMaxX(hudBtn9.frame)+kMargin, 290, 50, 50)
        hudBtn14.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn14.setTitle("转圈圈也有字-从上到下", forState: UIControlState.Normal)
        hudBtn14.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn14.sizeToFit()
        hudBtn14.backgroundColor = UIColor.whiteColor()
        hudBtn14.addTarget(self, action: #selector(ExampleViewController.hudBtnClickedWithType14(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hudBtn14)
        
        let hudBtn15 = UIButton.init()
        hudBtn15.frame = CGRectMake(CGRectGetMaxX(hudBtn9.frame)+kMargin, 330, 50, 50)
        hudBtn15.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn15.setTitle("转圈圈也有字-从下到上", forState: UIControlState.Normal)
        hudBtn15.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn15.sizeToFit()
        hudBtn15.backgroundColor = UIColor.whiteColor()
        hudBtn15.addTarget(self, action: #selector(ExampleViewController.hudBtnClickedWithType15(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hudBtn15)
        
        /****************************************************/
        
        let hudBtn16 = UIButton.init()
        hudBtn16.frame = CGRectMake(0, 380, 50, 50)
        hudBtn16.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn16.setTitle("单行文字-慢慢放大", forState: UIControlState.Normal)
        hudBtn16.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn16.sizeToFit()
        hudBtn16.backgroundColor = UIColor.whiteColor()
        hudBtn16.addTarget(self, action: #selector(ExampleViewController.hudBtnClickedWithType16(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hudBtn16)
        
        let hudBtn17 = UIButton.init()
        hudBtn17.frame = CGRectMake(0, 410, 50, 50)
        hudBtn17.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn17.setTitle("单行文字-慢慢放小", forState: UIControlState.Normal)
        hudBtn17.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn17.sizeToFit()
        hudBtn17.backgroundColor = UIColor.whiteColor()
        hudBtn17.addTarget(self, action: #selector(ExampleViewController.hudBtnClickedWithType17(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hudBtn17)
        
        let hudBtn18 = UIButton.init()
        hudBtn18.frame = CGRectMake(0, 445, 50, 50)
        hudBtn18.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn18.setTitle("单行文字-从左到右", forState: UIControlState.Normal)
        hudBtn18.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn18.sizeToFit()
        hudBtn18.backgroundColor = UIColor.whiteColor()
        hudBtn18.addTarget(self, action: #selector(ExampleViewController.hudBtnClickedWithType18(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hudBtn18)
        
        let hudBtn19 = UIButton.init()
        hudBtn19.frame = CGRectMake(0, 475, 50, 50)
        hudBtn19.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn19.setTitle("单行文字-从右到左", forState: UIControlState.Normal)
        hudBtn19.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn19.sizeToFit()
        hudBtn19.backgroundColor = UIColor.whiteColor()
        hudBtn19.addTarget(self, action: #selector(ExampleViewController.hudBtnClickedWithType19(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hudBtn19)
        
        let hudBtn20 = UIButton.init()
        hudBtn20.frame = CGRectMake(0, 510, 50, 50)
        hudBtn20.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn20.setTitle("单行文字-从上到下", forState: UIControlState.Normal)
        hudBtn20.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn20.sizeToFit()
        hudBtn20.backgroundColor = UIColor.whiteColor()
        hudBtn20.addTarget(self, action: #selector(ExampleViewController.hudBtnClickedWithType20(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hudBtn20)
        
        let hudBtn21 = UIButton.init()
        hudBtn21.frame = CGRectMake(0, 540, 50, 50)
        hudBtn21.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn21.setTitle("单行文字-从下到上", forState: UIControlState.Normal)
        hudBtn21.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn21.sizeToFit()
        hudBtn21.backgroundColor = UIColor.whiteColor()
        hudBtn21.addTarget(self, action: #selector(ExampleViewController.hudBtnClickedWithType21(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hudBtn21)
        
        /****************************************************/
        
        let hudBtn22 = UIButton.init()
        hudBtn22.frame = CGRectMake(CGRectGetMaxX(hudBtn21.frame)+kMargin, 380, 50, 50)
        hudBtn22.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn22.setTitle("多行文字-慢慢放大", forState: UIControlState.Normal)
        hudBtn22.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn22.sizeToFit()
        hudBtn22.backgroundColor = UIColor.whiteColor()
        hudBtn22.addTarget(self, action: #selector(ExampleViewController.hudBtnClickedWithType22(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hudBtn22)
        
        let hudBtn23 = UIButton.init()
        hudBtn23.frame = CGRectMake(CGRectGetMaxX(hudBtn21.frame)+kMargin, 410, 50, 50)
        hudBtn23.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn23.setTitle("多行文字-慢慢放小", forState: UIControlState.Normal)
        hudBtn23.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn23.sizeToFit()
        hudBtn23.backgroundColor = UIColor.whiteColor()
        hudBtn23.addTarget(self, action: #selector(ExampleViewController.hudBtnClickedWithType23(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hudBtn23)
        
        let hudBtn24 = UIButton.init()
        hudBtn24.frame = CGRectMake(CGRectGetMaxX(hudBtn21.frame)+kMargin, 445, 50, 50)
        hudBtn24.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn24.setTitle("多行文字-从左到右", forState: UIControlState.Normal)
        hudBtn24.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn24.sizeToFit()
        hudBtn24.backgroundColor = UIColor.whiteColor()
        hudBtn24.addTarget(self, action: #selector(ExampleViewController.hudBtnClickedWithType24(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hudBtn24)
        
        let hudBtn25 = UIButton.init()
        hudBtn25.frame = CGRectMake(CGRectGetMaxX(hudBtn21.frame)+kMargin, 475, 50, 50)
        hudBtn25.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn25.setTitle("多行文字-从右到左", forState: UIControlState.Normal)
        hudBtn25.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn25.sizeToFit()
        hudBtn25.backgroundColor = UIColor.whiteColor()
        hudBtn25.addTarget(self, action: #selector(ExampleViewController.hudBtnClickedWithType25(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hudBtn25)
        
        let hudBtn26 = UIButton.init()
        hudBtn26.frame = CGRectMake(CGRectGetMaxX(hudBtn21.frame)+kMargin, 510, 50, 50)
        hudBtn26.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn26.setTitle("多行文字-从上到下", forState: UIControlState.Normal)
        hudBtn26.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn26.sizeToFit()
        hudBtn26.backgroundColor = UIColor.whiteColor()
        hudBtn26.addTarget(self, action: #selector(ExampleViewController.hudBtnClickedWithType26(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hudBtn26)
        
        let hudBtn27 = UIButton.init()
        hudBtn27.frame = CGRectMake(CGRectGetMaxX(hudBtn21.frame)+kMargin, 540, 50, 50)
        hudBtn27.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn27.setTitle("多行文字-从下到上", forState: UIControlState.Normal)
        hudBtn27.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn27.sizeToFit()
        hudBtn27.backgroundColor = UIColor.whiteColor()
        hudBtn27.addTarget(self, action: #selector(ExampleViewController.hudBtnClickedWithType27(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hudBtn27)
        
    }
    
    /********************❤️First Version***********************/
    func justshowcircle(sender:UIButton){
        JHB_HUDView.showProgress()
        self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
    }
    func hudBtnClicked(sender:UIButton) {
        // ❤️显示多行
        JHB_HUDView.showMsgMultiLine("你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala",coreInSet: 50,labelInSet: 1500, delay:1)
    }
    func justshowAlineMsg(sender:UIButton) {
        JHB_HUDView.showMsg("你看不见我!CoderBala")
    }
    func netAskBtnClicked(sender:UIButton) {
        JHB_HUDView.showProgressMsg("Hello CoderBala !")
        self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
    }
    /********************❤️Second Version***********************/
    func hudBtnClickedWithType1(sender:UIButton) {
        JHB_HUDView.showProgressWithType(HUDType.kHUDTypeScaleFromInsideToOutside)
        self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
    }
    func hudBtnClickedWithType2(sender:UIButton) {
        JHB_HUDView.showProgressWithType(HUDType.kHUDTypeScaleFromOutsideToInside)
        self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
    }
    func hudBtnClickedWithType3(sender:UIButton) {
        JHB_HUDView.showProgressWithType(HUDType.kHUDTypeShowFromLeftToRight)
        self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
    }
    func hudBtnClickedWithType4(sender:UIButton) {
        JHB_HUDView.showProgressWithType(HUDType.kHUDTypeShowFromRightToLeft)
        self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
    }
    func hudBtnClickedWithType5(sender:UIButton) {
        JHB_HUDView.showProgressWithType(HUDType.kHUDTypeShowFromTopToBottom)
        self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
    }
    func hudBtnClickedWithType6(sender:UIButton) {
        JHB_HUDView.showProgressWithType(HUDType.kHUDTypeShowFromBottomToTop)
        self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
    }
    /****************************************************/
    func hudBtnClickedWithType10(sender:UIButton) {
        JHB_HUDView.showProgressMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeScaleFromInsideToOutside)
        self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
    }
    func hudBtnClickedWithType11(sender:UIButton) {
        JHB_HUDView.showProgressMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeScaleFromOutsideToInside)
        self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
    }
    func hudBtnClickedWithType12(sender:UIButton) {
        JHB_HUDView.showProgressMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeShowFromLeftToRight)
        self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
    }
    func hudBtnClickedWithType13(sender:UIButton) {
        JHB_HUDView.showProgressMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeShowFromRightToLeft)
        self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
    }
    func hudBtnClickedWithType14(sender:UIButton) {
        JHB_HUDView.showProgressMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeShowFromTopToBottom)
        self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
    }
    func hudBtnClickedWithType15(sender:UIButton) {
        JHB_HUDView.showProgressMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeShowFromBottomToTop)
        self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
    }
    /****************************************************/
    func hudBtnClickedWithType16(sender:UIButton) {
        JHB_HUDView.showMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeScaleFromInsideToOutside)
      
    }
    func hudBtnClickedWithType17(sender:UIButton) {
        JHB_HUDView.showMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeScaleFromOutsideToInside)
    
    }
    func hudBtnClickedWithType18(sender:UIButton) {
        JHB_HUDView.showMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeShowFromLeftToRight)
    
    }
    func hudBtnClickedWithType19(sender:UIButton) {
        JHB_HUDView.showMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeShowFromRightToLeft)
        
    }
    func hudBtnClickedWithType20(sender:UIButton) {
        JHB_HUDView.showMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeShowFromTopToBottom)
      
    }
    func hudBtnClickedWithType21(sender:UIButton) {
        JHB_HUDView.showMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeShowFromBottomToTop)
      
    }
    
    /****************************************************/
    func hudBtnClickedWithType22(sender:UIButton) {
        JHB_HUDView.showMsgMultiLineWithType(multiStr, coreInSet: 30, labelInSet: 20, delay: 2, HudType: .kHUDTypeScaleFromInsideToOutside)
   
    }
    func hudBtnClickedWithType23(sender:UIButton) {
        
        JHB_HUDView.showMsgMultiLineWithType(multiStr, coreInSet: 30, labelInSet: 20, delay: 2, HudType: .kHUDTypeScaleFromOutsideToInside)
      
    }
    func hudBtnClickedWithType24(sender:UIButton) {
        
        JHB_HUDView.showMsgMultiLineWithType(multiStr, coreInSet: 30, labelInSet: 20, delay: 2, HudType: .kHUDTypeShowFromLeftToRight)
     
    }
    func hudBtnClickedWithType25(sender:UIButton) {
        
        JHB_HUDView.showMsgMultiLineWithType(multiStr, coreInSet: 30, labelInSet: 20, delay: 2, HudType: .kHUDTypeShowFromRightToLeft)

    }
    func hudBtnClickedWithType26(sender:UIButton) {
        
        JHB_HUDView.showMsgMultiLineWithType(multiStr, coreInSet: 30, labelInSet: 20, delay: 2, HudType: .kHUDTypeShowFromTopToBottom)

    }
    func hudBtnClickedWithType27(sender:UIButton) {
        
        JHB_HUDView.showMsgMultiLineWithType(multiStr, coreInSet: 30, labelInSet: 20, delay: 2, HudType: .kHUDTypeShowFromBottomToTop)
      
    }
  
    func hide() {
        JHB_HUDView.hideProgress()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

