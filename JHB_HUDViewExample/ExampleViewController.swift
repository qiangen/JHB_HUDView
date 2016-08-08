//
//  ExampleViewController.swift
//  JHB_HUDViewExample
//
//  Created by Leon_pan on 16/8/8.
//  Copyright © 2016年 bruce. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {
    var askTime = 0
    
    @IBOutlet weak var stateLabel: UILabel!
// MARK: Interface
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
        
        let hudBtn1 = UIButton.init()
        hudBtn1.frame = CGRectMake(0, 100, 40, 50)
        hudBtn1.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn1.setTitle("转圈圈", forState: UIControlState.Normal)
        hudBtn1.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn1.sizeToFit()
        hudBtn1.backgroundColor = UIColor.whiteColor()
        hudBtn1.addTarget(self, action: #selector(ExampleViewController.justshowcircle(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(hudBtn1)
        
        let hudBtn2 = UIButton.init()
        hudBtn2.frame = CGRectMake(80, 100, 50, 50)
        hudBtn2.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn2.setTitle("转圈圈还有字", forState: UIControlState.Normal)
        hudBtn2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn2.sizeToFit()
        hudBtn2.backgroundColor = UIColor.whiteColor()
        hudBtn2.addTarget(self, action: #selector(ExampleViewController.netAskBtnClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(hudBtn2)
        
        
        
        let hudBtn3 = UIButton.init()
        hudBtn3.frame = CGRectMake(190, 100, 50, 50)
        hudBtn3.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn3.setTitle("只有字只一行", forState: UIControlState.Normal)
        hudBtn3.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn3.sizeToFit()
        hudBtn3.backgroundColor = UIColor.whiteColor()
        hudBtn3.addTarget(self, action: #selector(ExampleViewController.justshowAlineMsg(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(hudBtn3)
        
        let hudBtn4 = UIButton.init()
        hudBtn4.frame = CGRectMake(280, 100, 50, 50)
        hudBtn4.titleLabel?.font = UIFont.systemFontOfSize(13)
        hudBtn4.setTitle("只有字好多行", forState: UIControlState.Normal)
        hudBtn4.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        hudBtn4.sizeToFit()
        hudBtn4.backgroundColor = UIColor.whiteColor()
        hudBtn4.addTarget(self, action: #selector(ExampleViewController.hudBtnClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(hudBtn4)
    }
// MARK: Event
    func justshowcircle(sender:UIButton){
        self.showProgress()
        self.pretendReloadData()
    }
    
    func hudBtnClicked(sender:UIButton) {
        self.showMsgMultiLine("你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala你看不见我!CoderBala",coreInSet: 50,labelInSet: 1500, delay:1)
        
    }
    
    func justshowAlineMsg(sender:UIButton) {
        self.showMsg("你看不见我!CoderBala")
    }
    
    func netAskBtnClicked(sender:UIButton) {
        self.showProgressMsg("加载中...")
        self.pretendReloadData()
    }
    
    func pretendReloadData(){
        self.performSelector(#selector(getAskResult), withObject: self, afterDelay: 2)
    }
    
    
// MARK: PretendNetAsk
    func getAskResult() {
        askTime += 1
        self.stateLabel.text = "第\(askTime)次请求"
        self.hideProgress()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

