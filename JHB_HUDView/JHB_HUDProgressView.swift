/******************** JHB_HUDProgressView.swift *****************/
/*******  (JHB)  ************************************************/
/*******  Created by Leon_pan on 16/6/12. ***********************/
/*******  Copyright © 2016年 CoderBala. All rights reserved.*****/
/******************** JHB_HUDProgressView.swift *****************/

import UIKit

class JHB_HUDProgressView: UIView {
    /*指示视图*//*IndicatorView*/
    var actView         = UIActivityIndicatorView()
    /*备用指示视图*//*SpareIndicatorView*/
    var spareActView    = UIActivityIndicatorView()
    /*信息标签*//*MessageLabel*/
    var msgLabel        = UILabel()
    /*备用信息标签*//*SpareMessageLabel*/
    var spareMsgLabel   = UILabel()
    /*信息标签长度*//*TheLengthOfMessageLabel*/
    var msgLabelWidth   = CGFloat()
    /*信息标签高度*//*TheHeightOfMessageLabel*/
    var msgLabelHeight  = CGFloat()
    /*两边的间隔*//*TheMarginOfLeftAndRight*/
    var kMargin : CGFloat = 10
    /*两边的间隔*//*TheMarginOfLeftAndRight*/
    var kContent = NSString.init()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setSubViews()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(JHB_HUDProgressView.resetSubViewsForJHB_HUD_haveNoMsg), name: "JHB_HUD_haveNoMsg", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(JHB_HUDProgressView.resetSubViewsForJHB_HUD_haveNoMsgWithScale(_:)), name: "JHB_HUD_haveNoMsgWithScale", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(JHB_HUDProgressView.resetSubViewsForJHB_HUD_haveMsg), name: "JHB_HUD_haveMsg", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(JHB_HUDProgressView.resetSubViewsForJHB_HUD_haveMsgWithScale(_:)), name: "JHB_HUD_haveMsg_WithScale", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(JHB_HUDProgressView.resetSubViewsForJHB_HUD_onlyAMsgShow), name: "JHB_HUD_onlyAMsgShow", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(JHB_HUDProgressView.resetSubViewsForJHB_HUD_onlyAMsgShowWithScale(_:)), name: "JHB_HUD_onlyAMsgShowWithScale", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(JHB_HUDProgressView.resetSubViewsForJHB_HUD_onlyAMsgMultipleShow), name: "JHB_HUD_onlyAMsgMultipleShow", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(JHB_HUDProgressView.resetSubViewsForJHB_HUD_onlyAMsgMultipleShowWithScale(_:)), name: "JHB_HUD_onlyAMsgMultipleShowWithScale", object: nil)
        
        
        self.addSubview(self.actView)
        self.addSubview(self.spareActView)
        self.addSubview(self.spareMsgLabel)
        self.addSubview(self.msgLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSubViews(){
        
        self.actView = UIActivityIndicatorView.init()
        self.actView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        self.actView.hidesWhenStopped = true
        self.actView.startAnimating()
        
        self.spareActView = UIActivityIndicatorView.init()
        self.spareActView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        self.spareActView.hidesWhenStopped = true
        self.spareActView.stopAnimating()
        
        self.spareMsgLabel = UILabel.init()
        self.spareMsgLabel.textColor = UIColor.whiteColor()
        self.spareMsgLabel.font = UIFont.systemFontOfSize(15.0)
        self.spareMsgLabel.textAlignment = NSTextAlignment.Center
        self.spareMsgLabel.hidden = true
        self.spareMsgLabel.sizeToFit()
        
        self.msgLabel = UILabel.init()
        self.msgLabel.textColor = UIColor.whiteColor()
        self.msgLabel.font = UIFont.systemFontOfSize(15.0)
        self.msgLabel.textAlignment = NSTextAlignment.Center
        self.msgLabel.sizeToFit()
    }
    
    func resetSubViews() {

        self.actView.frame = CGRectMake(self.bounds.size.width/2-25 ,CGRectGetMidY(self.bounds)-35 ,50 ,50 )
        self.msgLabel.frame = CGRectMake((self.bounds.size.width - (msgLabelWidth - 2 * kMargin))/2, CGRectGetMidY(self.bounds)+10, msgLabelWidth - 2 * kMargin, 18)
        self.spareActView.frame = CGRectMake((self.bounds.size.width - 50) / 2, (self.bounds.size.height - 50) / 2, 50, 50)
        self.spareMsgLabel.center = CGPointMake(self.bounds.width / 2, self.bounds.height / 2)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.resetSubViews()
    }
    
    // MARK: - NotificationCenter
    func resetSubViewsForJHB_HUD_haveNoMsg() {
        self.actView.stopAnimating()
        self.spareActView.startAnimating()
    }
    func resetSubViewsForJHB_HUD_haveNoMsgWithScale(noti:NSNotification) {
        let obValue = noti.object as! CGFloat
        self.actView.stopAnimating()
        self.spareActView.startAnimating()
        self.spareActView.transform = CGAffineTransformScale(self.actView.transform, 1/obValue, 1/obValue)
    }
    func resetSubViewsForJHB_HUD_haveMsg() {
        self.msgLabel.frame = CGRectMake(0, CGRectGetMaxY(self.actView.bounds), msgLabelWidth + 2 * kMargin, 18)
        
    }
    func resetSubViewsForJHB_HUD_haveMsgWithScale(noti:NSNotification){
        let obValue = noti.object as! CGFloat
        self.msgLabel.frame = CGRectMake((self.bounds.size.width - msgLabelWidth)/2,  CGRectGetMaxY(self.actView.bounds) + 10, msgLabelWidth - 2 * kMargin, 18)
        self.actView.transform = CGAffineTransformScale(self.actView.transform, 1/obValue, 1/obValue)
        self.msgLabel.transform = CGAffineTransformScale(self.msgLabel.transform, 1/obValue, 1/obValue)
        
    }
    func resetSubViewsForJHB_HUD_onlyAMsgShow() {
        self.spareMsgLabel.hidden = false
        self.msgLabel.hidden = true
        self.spareMsgLabel.numberOfLines = 1
        self.spareMsgLabel.text = self.kContent as String
        self.spareMsgLabel.frame = CGRectMake(0, 0, msgLabelWidth + 2 * kMargin, self.msgLabelHeight + 20)
        self.spareMsgLabel.center = CGPointMake(self.bounds.width / 2, self.bounds.height / 2)
    }
    func resetSubViewsForJHB_HUD_onlyAMsgShowWithScale(noti:NSNotification) {
        let obValue = noti.object as! CGFloat
        self.spareMsgLabel.hidden = false
        self.msgLabel.hidden = true
        self.spareMsgLabel.numberOfLines = 1
        self.spareMsgLabel.text = self.kContent as String
        self.spareMsgLabel.frame = CGRectMake(0, 0, msgLabelWidth + 2 * kMargin, self.msgLabelHeight + 20)
        self.spareMsgLabel.center = CGPointMake(self.bounds.width / 2, self.bounds.height / 2)
        self.spareMsgLabel.transform = CGAffineTransformScale(self.spareMsgLabel.transform, 1/obValue, 1/obValue)
    }
    func resetSubViewsForJHB_HUD_onlyAMsgMultipleShow() {
        self.spareMsgLabel.hidden = false
        self.msgLabel.hidden = true
        self.spareMsgLabel.numberOfLines = 0
        self.spareMsgLabel.text = self.kContent as String
        self.spareMsgLabel.frame = CGRectMake(0, 0, msgLabelWidth, self.msgLabelHeight + 20)
        self.spareMsgLabel.center = CGPointMake(self.bounds.width / 2, self.bounds.height / 2)
    }
    func resetSubViewsForJHB_HUD_onlyAMsgMultipleShowWithScale(noti:NSNotification) {
        let obValue = noti.object as! CGFloat
        self.spareMsgLabel.hidden = false
        self.msgLabel.hidden = true
        self.spareMsgLabel.numberOfLines = 0
        self.spareMsgLabel.text = self.kContent as String
        self.spareMsgLabel.frame = CGRectMake(0, 0, msgLabelWidth - 2 * kMargin, self.msgLabelHeight + 20)
        self.spareMsgLabel.center = CGPointMake(self.bounds.width / 2, self.bounds.height / 2)
        self.spareMsgLabel.transform = CGAffineTransformScale(self.spareMsgLabel.transform, 1/obValue, 1/obValue)
    }
}
