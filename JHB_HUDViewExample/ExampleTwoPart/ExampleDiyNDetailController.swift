//
//  ExampleDiyNDetailController.swift
//  JHB_HUDViewExample
//
//  Created by Leon_pan on 16/8/23.
//  Copyright © 2016年 bruce. All rights reserved.
//

import UIKit

public enum diyImageType{
    case diyImageTypeJustImage
    case diyImageTypeImageArray
    case diyImageTypeImageWithMsg
    case diyImageTypeImageArrayWithMsg
}
class ExampleDiyNDetailController: JHB_HUDTopViewController,UITableViewDelegate,UITableViewDataSource {
    
    var SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    var SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    var tableView = UITableView.init()
    var currentCoreType = NSInteger()
    var currentImageType = NSInteger()
    let multiStr = " 此生之路，我将走过；走过这一次，便再也无法重来。所有力所能及的善行，所有充盈于心的善意，我将毫不吝惜，即刻倾予。我将不再拖延，再不淡漠，只因此生之路，再也无法重来。"
    // 声明一个数组,用来储存cell
    var cellArr = NSMutableArray()
    // 标示
    var ID = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Diy-Type-Details(DiyImgType)"
        self.setTableView()
    }
    
    func setTableView() {
        self.tableView = UITableView.init(frame:self.view.bounds)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // 注册cell
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: ID)
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.view.addSubview(self.tableView)
    }
    
    
    // MARK: - Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ID, forIndexPath: indexPath)
        cell.textLabel?.numberOfLines = 0
        if indexPath.row == 0 {
            cell.textLabel?.text = "1⃣️Diy-Type kDiyHUDTypeDefault"
        }else if indexPath.row == 1{
            cell.textLabel?.text = "2⃣️Diy-Type kDiyHUDTypeRotateWithY"
        }else if indexPath.row == 2{
            cell.textLabel?.text = "3⃣️Diy-Type kDiyHUDTypeRotateWithZ"
        }else if indexPath.row == 3{
            cell.textLabel?.text = "4⃣️Diy-Type kDiyHUDTypeShakeWithX"
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == 0 {
            self.defaultType()
        }else if indexPath.row == 1{
            self.RotateWithYType()
        }else if indexPath.row == 2{
            self.RotateWithZType()
        }else if indexPath.row == 3{
            self.hakeWithXType()
        }
    }
    
    func defaultType() {
        switch currentCoreType {
        case HUDType.kHUDTypeDefaultly.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
            JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeDefault, HudType: HUDType.kHUDTypeDefaultly)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeDefaultly)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeDefault, HudType: HUDType.kHUDTypeDefaultly)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeDefaultly)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeShowImmediately.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeDefault, HudType: HUDType.kHUDTypeShowImmediately)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowImmediately)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeDefault, HudType: HUDType.kHUDTypeShowImmediately)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowImmediately)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeShowSlightly.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeDefault, HudType: HUDType.kHUDTypeShowSlightly)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowSlightly)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeDefault, HudType: HUDType.kHUDTypeShowSlightly)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowSlightly)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeShowFromBottomToTop.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeDefault, HudType: HUDType.kHUDTypeShowFromBottomToTop)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowFromBottomToTop)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeDefault, HudType: HUDType.kHUDTypeShowFromBottomToTop)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowFromBottomToTop)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeShowFromTopToBottom.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeDefault, HudType: HUDType.kHUDTypeShowFromTopToBottom)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowFromTopToBottom)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeDefault, HudType: HUDType.kHUDTypeShowFromTopToBottom)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowFromTopToBottom)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeShowFromLeftToRight.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeDefault, HudType: HUDType.kHUDTypeShowFromLeftToRight)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowFromLeftToRight)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeDefault, HudType: HUDType.kHUDTypeShowFromLeftToRight)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowFromLeftToRight)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeShowFromRightToLeft.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeDefault, HudType: HUDType.kHUDTypeShowFromRightToLeft)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowFromRightToLeft)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeDefault, HudType: HUDType.kHUDTypeShowFromRightToLeft)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowFromRightToLeft)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeScaleFromInsideToOutside.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeDefault, HudType: HUDType.kHUDTypeScaleFromInsideToOutside)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeScaleFromInsideToOutside)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeDefault, HudType: HUDType.kHUDTypeScaleFromInsideToOutside)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeScaleFromInsideToOutside)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeScaleFromOutsideToInside.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeDefault, HudType: HUDType.kHUDTypeScaleFromOutsideToInside)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeScaleFromOutsideToInside)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeDefault, HudType: HUDType.kHUDTypeScaleFromOutsideToInside)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeScaleFromOutsideToInside)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        default:
            break
        }
    }
    
    func RotateWithYType() {
        switch currentCoreType {
        case HUDType.kHUDTypeDefaultly.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithY, HudType: HUDType.kHUDTypeDefaultly)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeDefaultly)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithY, HudType: HUDType.kHUDTypeDefaultly)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeDefaultly)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeShowImmediately.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithY, HudType: HUDType.kHUDTypeShowImmediately)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowImmediately)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithY, HudType: HUDType.kHUDTypeShowImmediately)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowImmediately)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeShowSlightly.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithY, HudType: HUDType.kHUDTypeShowSlightly)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowSlightly)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithY, HudType: HUDType.kHUDTypeShowSlightly)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowSlightly)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeShowFromBottomToTop.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithY, HudType: HUDType.kHUDTypeShowFromBottomToTop)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowFromBottomToTop)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithY, HudType: HUDType.kHUDTypeShowFromBottomToTop)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowFromBottomToTop)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeShowFromTopToBottom.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithY, HudType: HUDType.kHUDTypeShowFromTopToBottom)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowFromTopToBottom)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithY, HudType: HUDType.kHUDTypeShowFromTopToBottom)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowFromTopToBottom)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeShowFromLeftToRight.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithY, HudType: HUDType.kHUDTypeShowFromLeftToRight)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowFromLeftToRight)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithY, HudType: HUDType.kHUDTypeShowFromLeftToRight)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowFromLeftToRight)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeShowFromRightToLeft.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithY, HudType: HUDType.kHUDTypeShowFromRightToLeft)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowFromRightToLeft)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithY, HudType: HUDType.kHUDTypeShowFromRightToLeft)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowFromRightToLeft)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeScaleFromInsideToOutside.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithY, HudType: HUDType.kHUDTypeScaleFromInsideToOutside)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeScaleFromInsideToOutside)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithY, HudType: HUDType.kHUDTypeScaleFromInsideToOutside)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeScaleFromInsideToOutside)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeScaleFromOutsideToInside.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithY, HudType: HUDType.kHUDTypeScaleFromOutsideToInside)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeScaleFromOutsideToInside)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithY, HudType: HUDType.kHUDTypeScaleFromOutsideToInside)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeScaleFromOutsideToInside)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        default:
            break
        }

    }
    
    func RotateWithZType() {
        switch currentCoreType {
        case HUDType.kHUDTypeDefaultly.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("TaiChi", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithZ, HudType: HUDType.kHUDTypeDefaultly)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeDefaultly)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "TaiChi", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithZ, HudType: HUDType.kHUDTypeDefaultly)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeDefaultly)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeShowImmediately.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("TaiChi", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithZ, HudType: HUDType.kHUDTypeShowImmediately)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowImmediately)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "TaiChi", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithZ, HudType: HUDType.kHUDTypeShowImmediately)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowImmediately)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeShowSlightly.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("TaiChi", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithZ, HudType: HUDType.kHUDTypeShowSlightly)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowSlightly)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "TaiChi", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithZ, HudType: HUDType.kHUDTypeShowSlightly)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowSlightly)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeShowFromBottomToTop.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("TaiChi", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithZ, HudType: HUDType.kHUDTypeShowFromBottomToTop)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowFromBottomToTop)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "TaiChi", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithZ, HudType: HUDType.kHUDTypeShowFromBottomToTop)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowFromBottomToTop)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeShowFromTopToBottom.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("TaiChi", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithZ, HudType: HUDType.kHUDTypeShowFromTopToBottom)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowFromTopToBottom)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "TaiChi", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithZ, HudType: HUDType.kHUDTypeShowFromTopToBottom)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowFromTopToBottom)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeShowFromLeftToRight.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("TaiChi", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithZ, HudType: HUDType.kHUDTypeShowFromLeftToRight)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowFromLeftToRight)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "TaiChi", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithZ, HudType: HUDType.kHUDTypeShowFromLeftToRight)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowFromLeftToRight)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeShowFromRightToLeft.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("TaiChi", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithZ, HudType: HUDType.kHUDTypeShowFromRightToLeft)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowFromRightToLeft)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "TaiChi", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithZ, HudType: HUDType.kHUDTypeShowFromRightToLeft)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowFromRightToLeft)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeScaleFromInsideToOutside.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithZ, HudType: HUDType.kHUDTypeScaleFromInsideToOutside)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeScaleFromInsideToOutside)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "TaiChi", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithZ, HudType: HUDType.kHUDTypeScaleFromInsideToOutside)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeScaleFromInsideToOutside)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeScaleFromOutsideToInside.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("TaiChi", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithZ, HudType: HUDType.kHUDTypeScaleFromOutsideToInside)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeScaleFromOutsideToInside)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "TaiChi", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeRotateWithZ, HudType: HUDType.kHUDTypeScaleFromOutsideToInside)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeScaleFromOutsideToInside)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        default:
            break
        }

    }
    
    func hakeWithXType() {
        switch currentCoreType {
        case HUDType.kHUDTypeDefaultly.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeShakeWithX, HudType: HUDType.kHUDTypeDefaultly)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeDefaultly)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeShakeWithX, HudType: HUDType.kHUDTypeDefaultly)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeDefaultly)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeShowImmediately.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeShakeWithX, HudType: HUDType.kHUDTypeShowImmediately)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowImmediately)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeShakeWithX, HudType: HUDType.kHUDTypeShowImmediately)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowImmediately)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeShowSlightly.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeShakeWithX, HudType: HUDType.kHUDTypeShowSlightly)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowSlightly)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeShakeWithX, HudType: HUDType.kHUDTypeShowSlightly)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowSlightly)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeShowFromBottomToTop.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeShakeWithX, HudType: HUDType.kHUDTypeShowFromBottomToTop)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowFromBottomToTop)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeShakeWithX, HudType: HUDType.kHUDTypeShowFromBottomToTop)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowFromBottomToTop)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeShowFromTopToBottom.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeShakeWithX, HudType: HUDType.kHUDTypeShowFromTopToBottom)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowFromTopToBottom)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeShakeWithX, HudType: HUDType.kHUDTypeShowFromTopToBottom)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowFromTopToBottom)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeShowFromLeftToRight.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeShakeWithX, HudType: HUDType.kHUDTypeShowFromLeftToRight)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowFromLeftToRight)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeShakeWithX, HudType: HUDType.kHUDTypeShowFromLeftToRight)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowFromLeftToRight)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeShowFromRightToLeft.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeShakeWithX, HudType: HUDType.kHUDTypeShowFromRightToLeft)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowFromRightToLeft)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeShakeWithX, HudType: HUDType.kHUDTypeShowFromRightToLeft)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowFromRightToLeft)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeScaleFromInsideToOutside.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeShakeWithX, HudType: HUDType.kHUDTypeScaleFromInsideToOutside)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeScaleFromInsideToOutside)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeShakeWithX, HudType: HUDType.kHUDTypeScaleFromInsideToOutside)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeScaleFromInsideToOutside)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        case HUDType.kHUDTypeScaleFromOutsideToInside.hashValue:
            switch currentImageType {
            case diyImageType.diyImageTypeJustImage.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWith("dropdown_anim_loading4", diySpeed: 0.65, diyHudType: DiyHUDType.kDiyHUDTypeShakeWithX, HudType: HUDType.kHUDTypeScaleFromOutsideToInside)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArray.hashValue:
                JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeScaleFromOutsideToInside)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWith(multiStr, img: "dropdown_anim_loading4", diySpeed: 0.6, diyHudType: DiyHUDType.kDiyHUDTypeShakeWithX, HudType: HUDType.kHUDTypeScaleFromOutsideToInside)
                
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            case diyImageType.diyImageTypeImageArrayWithMsg.hashValue:
                JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeScaleFromOutsideToInside)
                self.performSelector(#selector(hide), withObject: self, afterDelay: 3)
                break
            default:
                break
            }
            break
        default:
            break
        }
    }
    
    
    func hide() {
        JHB_HUDView.hideProgressOfDIYType()
    }
    
    
    
    // 设置header 和 footer
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UILabel.init(frame: CGRectMake(0, 0, SCREEN_WIDTH, 60))
        header.text = "这一堆HUDType效果类型中的每一种都可以作为实现自定义效果的基础效果显示类型哦~!😊"
        header.sizeToFit()
        header.numberOfLines = 0
        header.textColor = UIColor.whiteColor()
        header.font = UIFont.systemFontOfSize(18)
        header.textAlignment = NSTextAlignment.Center
        header.backgroundColor = UIColor.orangeColor()
        return header
    }
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UILabel.init(frame: CGRectMake(0, 0, SCREEN_WIDTH, 60))
        footer.text = "是的,点进去还有好多种选择~!😂"
        footer.sizeToFit()
        footer.numberOfLines = 0
        footer.textColor = UIColor.whiteColor()
        footer.font = UIFont.systemFontOfSize(18)
        footer.textAlignment = NSTextAlignment.Center
        footer.backgroundColor = UIColor.orangeColor()
        return footer
        
    }
    // ❤️ 如果要展示header 或 footer 就必须要设置他们的高度值!
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    
    
}
