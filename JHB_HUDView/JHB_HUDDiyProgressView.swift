/****************** JHB_HUDDiyProgressView.swift ****************/
/*******  (JHB)  ************************************************/
/*******  Created by Leon_pan on 16/6/15. ***********************/
/*******  Copyright © 2016年 CoderBala. All rights reserved.*****/
/****************** JHB_HUDDiyProgressView.swift ****************/

import UIKit
class JHB_HUDDiyProgressView: UIView {
    
    /*自定义图片*//*DiyImageView*/
    var diyImageView       = UIImageView()
    /*预备自定义图片*//*DiySpareImageView*/
    var diySpareImageView  = UIImageView()
    /*自定义信息标签*//*DiyMsgLabel*/
    var diyMsgLabel        = UILabel()
    /*用于展示图片*//*TheImageNeededToShow*/
    var diyShowImage       = NSString()
    /*图片展示类型*//*TheTypeOfImageShow*/
    var diyHudType         = NSInteger()
    /*判断是否使用预备ImageView*//*TheJudgementOfUsingSpareImageView*/
    var ifChangeImgView    = Bool()
    /*动画速度*//*TheSpeedOfAnimation*/
    var diySpeed           = CFTimeInterval()
    /*实现动画的图片个数*//*TheNumberOfImagesThatWithAnimation-Type*/
    var diyImgsNumber      = NSInteger()
    /*信息标签长度*//*TheLengthOfMessageLabel*/
    var diyMsgLabelWidth   = CGFloat()
    /*信息标签高度*//*TheHeightOfMessageLabel*/
    var diyMsgLabelHeight  = CGFloat()
    /*两边的间隔*//*TheMarginOfLeftAndRight*/
    var kMargin : CGFloat  = 10
    /*两边的间隔*//*TheMarginOfLeftAndRight*/
    var kContent = NSString.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        ifChangeImgView = false
        diyImgsNumber = 0
        self.setSubViews()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(JHB_HUDDiyProgressView.resetSubViewsForJHB_DIYHUD_haveNoMsg), name: "JHB_DIYHUD_haveNoMsg", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(JHB_HUDDiyProgressView.resetSubViewsForJHB_DIYHUD_haveNoMsgWithScale(_:)), name: "JHB_DIYHUD_haveNoMsgWithScale", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(JHB_HUDDiyProgressView.resetSubViewsForJHB_DIYHUD_haveMsg), name: "JHB_DIYHUD_haveMsg", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(JHB_HUDDiyProgressView.resetSubViewsForJHB_DIYHUD_haveMsgWithScale(_:)), name: "JHB_DIYHUD_haveMsg_WithScale", object: nil)
        self.addSubview(self.diyImageView)
        self.addSubview(self.diyMsgLabel)
        self.addSubview(self.diySpareImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSubViews(){
        
        self.diyImageView = UIImageView.init()
        self.diyImageView.clipsToBounds = true
        self.diyImageView.sizeToFit()
        self.diyImageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        self.diyMsgLabel = UILabel.init()
        self.diyMsgLabel.textColor = UIColor.whiteColor()
        self.diyMsgLabel.font = UIFont.systemFontOfSize(15.0)
        self.diyMsgLabel.textAlignment = NSTextAlignment.Center
        self.diyMsgLabel.sizeToFit()
        
        self.diySpareImageView = UIImageView.init()
        self.diySpareImageView.hidden = true
        self.diySpareImageView.clipsToBounds = true
        self.diySpareImageView.sizeToFit()
        self.diySpareImageView.contentMode = UIViewContentMode.ScaleAspectFit
    }
    
    func resetSubViews() {
        
        self.diyImageView.frame = CGRectMake(self.bounds.size.width/2-25 ,CGRectGetMidY(self.bounds)-35 ,50 ,50 )
        self.diyMsgLabel.frame = CGRectMake((self.bounds.size.width - (diyMsgLabelWidth - 2 * kMargin))/2, CGRectGetMidY(self.bounds)+10, diyMsgLabelWidth - 2 * kMargin, 18)
        self.diySpareImageView.frame = CGRectMake(0 ,0 ,50 ,50 )
        self.diySpareImageView.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
            self.resetSubViews()
    }
    
    // MARK: - NotificationCenter
    func resetSubViewsForJHB_DIYHUD_haveNoMsg() {
        ifChangeImgView = true
        self.diyImageView.hidden = true
        self.diyMsgLabel.hidden = true
        self.diySpareImageView.hidden = false
        self.JudgeIfNeedAnimation()
    }
    func resetSubViewsForJHB_DIYHUD_haveNoMsgWithScale(noti:NSNotification) {
        ifChangeImgView = true
        self.diyImageView.hidden = true
        self.diyMsgLabel.hidden = true
        self.diySpareImageView.hidden = false
        self.JudgeIfNeedAnimation()
        let obValue = noti.object as! CGFloat
        var newObValue = CGFloat()
        if obValue < 1 {
            newObValue = 0.9
        }else {
            newObValue = 1.05
        }
        self.diySpareImageView.transform = CGAffineTransformScale(self.diySpareImageView.transform, 1/newObValue, 1/newObValue)
    }
    func resetSubViewsForJHB_DIYHUD_haveMsg() {
        ifChangeImgView = false
        self.diyImageView.hidden = false
        self.diyMsgLabel.hidden = false
        self.diySpareImageView.hidden = true
        self.JudgeIfNeedAnimation()
        self.diyMsgLabel.frame = CGRectMake(0, CGRectGetMaxY(self.diyImageView.bounds), diyMsgLabelWidth + 2 * kMargin, 18)
    }
    func resetSubViewsForJHB_DIYHUD_haveMsgWithScale(noti:NSNotification) {
        ifChangeImgView = false
        self.diyImageView.hidden = false
        self.diyMsgLabel.hidden = false
        self.diySpareImageView.hidden = true
        self.JudgeIfNeedAnimation()
        let obValue = noti.object as! CGFloat
        self.diyMsgLabel.frame = CGRectMake((self.bounds.size.width - diyMsgLabelWidth)/2,  CGRectGetMaxY(self.diyImageView.bounds) + 10, diyMsgLabelWidth - 2 * kMargin, 18)
        self.diyImageView.transform = CGAffineTransformScale(self.diyImageView.transform, 1/obValue, 1/obValue)
        self.diyMsgLabel.transform = CGAffineTransformScale(self.diyMsgLabel.transform, 1/obValue, 1/obValue)
    }
    
    // MARK: - Judge Different Show-Type
    func JudgeIfNeedAnimation() {
        if self.diyShowImage.hasSuffix(".png") {
            self.diyShowImage.substringToIndex(self.diyShowImage.length-4)
        }
        if self.diyImgsNumber == 0 {
            if ifChangeImgView == true {
                self.diySpareImageView.image = UIImage.init(named: "\(self.diyShowImage)" + ".png" as String)
                self.RealizeEffectOfImageView()
            }else if ifChangeImgView == false {
                self.diyImageView.image = UIImage.init(named: "\(self.diyShowImage)" + ".png" as String)
                self.RealizeEffectOfImageView()
            }
        }else {
            self.RealizeAnimationOfImageView()
        }
    }
    
    // MARK: - Realize The Effect Of ImageView
    func RealizeEffectOfImageView() {
        switch self.diyHudType {
        case DiyHUDType.kDiyHUDTypeDefault.hashValue:// 单纯展示
            
            break
        case DiyHUDType.kDiyHUDTypeRotateWithY.hashValue:
            
            //绕哪个轴，那么就改成什么：这里是绕y轴 ---> transform.rotation.y
            let rotationAnimation = CABasicAnimation.init(keyPath: "transform.rotation.y")
            //旋转角度
            rotationAnimation.toValue = NSNumber.init(double: M_PI)
            //每次旋转的时间（单位秒）
            rotationAnimation.duration = self.diySpeed
            rotationAnimation.cumulative = true
            //重复旋转的次数，如果你想要无数次，那么设置成MAXFLOAT
            rotationAnimation.repeatCount = MAXFLOAT
            if ifChangeImgView == true {
                self.diySpareImageView.layer.addAnimation(rotationAnimation, forKey: "transform.rotation.y")
            }else if ifChangeImgView == false {
                self.diyImageView.layer.addAnimation(rotationAnimation, forKey: "transform.rotation.y")
            }
            break
        case DiyHUDType.kDiyHUDTypeRotateWithZ.hashValue:
            //绕哪个轴，那么就改成什么：这里是z轴 ---> transform.rotation.y
            let rotationAnimation = CABasicAnimation.init(keyPath: "transform.rotation.z")
            //旋转角度
            rotationAnimation.toValue = NSNumber.init(double: M_PI)
            //每次旋转的时间（单位秒）
            rotationAnimation.duration = self.diySpeed
            rotationAnimation.cumulative = true
            //重复旋转的次数，如果你想要无数次，那么设置成MAXFLOAT
            rotationAnimation.repeatCount = MAXFLOAT
            if ifChangeImgView == true {
                 self.diySpareImageView.layer.addAnimation(rotationAnimation, forKey: "transform.rotation.z")
            }else if ifChangeImgView == false {
                 self.diyImageView.layer.addAnimation(rotationAnimation, forKey: "transform.rotation.z")
            }
           
            break
        case DiyHUDType.kDiyHUDTypeShakeWithX.hashValue:
             let shakeAnimation = CAKeyframeAnimation.init(keyPath: "transform.translation.x")
             var currentTx = CGFloat()
             if ifChangeImgView == true {
                 currentTx = self.diySpareImageView.transform.tx
             }else if ifChangeImgView == false {
                 currentTx = self.diyImageView.transform.tx
             }
             
             shakeAnimation.delegate = self
             shakeAnimation.duration = self.diySpeed
             shakeAnimation.repeatCount = MAXFLOAT
             // currentTx + 8, currentTx - 8, currentTx + 5, currentTx - 5,currentTx + 2, currentTx - 2, currentTx
             shakeAnimation.values = [currentTx,currentTx + 10,currentTx, currentTx - 10,currentTx,currentTx + 10,currentTx,currentTx - 10]
             shakeAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
             if ifChangeImgView == true {
                self.diySpareImageView.layer.addAnimation(shakeAnimation, forKey: "transform.translation.x")
             }else if ifChangeImgView == false {
                self.diyImageView.layer.addAnimation(shakeAnimation, forKey: "transform.translation.x")
             }
             
            break
        default:
            
            break
        }
    }
    // MARK: - Realize The Effect Of Animation
    func RealizeAnimationOfImageView() {
        _ = 0
        var images=[UIImage]()
        for num  in 1 ... self.diyImgsNumber {

            let img=UIImage(named: "\(self.diyShowImage)" + "\(num)"+".png")
            images.append(img!)

        }
        
        if ifChangeImgView == true {
            self.diySpareImageView.animationImages = images
            self.diySpareImageView.animationDuration = self.diySpeed
            self.diySpareImageView.animationRepeatCount = 0
            self.diySpareImageView.startAnimating()
        }else if ifChangeImgView == false {
            self.diyImageView.animationImages = images
            self.diyImageView.animationDuration = self.diySpeed
            self.diyImageView.animationRepeatCount = 0
            self.diyImageView.startAnimating()
        }
    }
}
