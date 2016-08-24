//
//  ExampleRegularDetailController.swift
//  JHB_HUDViewExample
//
//  Created by Leon_pan on 16/8/23.
//  Copyright © 2016年 bruce. All rights reserved.
//

import UIKit

public enum coreType{
    case coreTypeCircle
    case coreTypeCircleWithMsg
    case coreTypeSingleMsg
    case coreTypeMultiMsg
}

class ExampleRegularDetailController: JHB_HUDTopViewController ,UITableViewDelegate,UITableViewDataSource {
    var currentType = NSInteger()
    
    var SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    var SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    var coretype: coreType? {
        didSet {
            currentType = (coretype?.hashValue)!
        }
    }
    let multiStr = " 此生之路，我将走过；走过这一次，便再也无法重来。所有力所能及的善行，所有充盈于心的善意，我将毫不吝惜，即刻倾予。我将不再拖延，再不淡漠，只因此生之路，再也无法重来。"
    var tableView = UITableView.init()
    
    
    // 声明一个数组,用来储存cell
    var cellArr = NSMutableArray()
    // 标示
    var ID = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Regular-Type-Details"
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
        return 9
    }
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ID, forIndexPath: indexPath)
        cell.textLabel?.numberOfLines = 0
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "1⃣️Regular-Type kHUDTypeDefaultly"
        }else if indexPath.row == 1{
            cell.textLabel?.text = "2⃣️Regular-Type kHUDTypeShowImmediately"
        }else if indexPath.row == 2{
            cell.textLabel?.text = "3⃣️Regular-Type kHUDTypeShowSlightly"
        }else if indexPath.row == 3{
            cell.textLabel?.text = "4⃣️Regular-Type kHUDTypeShowFromBottomToTop"
        }else if indexPath.row == 4{
            cell.textLabel?.text = "5⃣️Regular-Type kHUDTypeShowFromTopToBottom"
        }else if indexPath.row == 5{
            cell.textLabel?.text = "6⃣️Regular-Type kHUDTypeShowFromLeftToRight"
        }else if indexPath.row == 6{
            cell.textLabel?.text = "7⃣️Regular-Type kHUDTypeShowFromRightToLeft"
        }else if indexPath.row == 7{
            cell.textLabel?.text = "8⃣️Regular-Type kHUDTypeScaleFromInsideToOutside"
        }else if indexPath.row == 8{
            cell.textLabel?.text = "9⃣️Regular-Type kHUDTypeScaleFromOutsideToInside"
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            self.defaultType()
        }else if indexPath.row == 1{
            self.ShowImmediatelyType()
        }else if indexPath.row == 2{
            self.ShowSlightlyType()
        }else if indexPath.row == 3{
            self.ShowFromBottomToTopType()
        }else if indexPath.row == 4{
            self.ShowFromTopToBottomType()
        }else if indexPath.row == 5{
            self.ShowFromLeftToRightType()
        }else if indexPath.row == 6{
            self.ShowFromRightToLeftType()
        }else if indexPath.row == 7{
            self.ScaleFromInsideToOutsideType()
        }else if indexPath.row == 8{
            self.ScaleFromOutsideToInsideType()
        }

    }
    
    func defaultType() {
        switch currentType {
        case coreType.coreTypeCircle.hashValue:
            JHB_HUDView.showProgressWithType(HUDType.kHUDTypeDefaultly)
            self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
            break
        case coreType.coreTypeCircleWithMsg.hashValue:
            JHB_HUDView.showProgressMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeDefaultly)
            self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
            break
        case coreType.coreTypeSingleMsg.hashValue:
            JHB_HUDView.showMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeDefaultly)
            break
        case coreType.coreTypeMultiMsg.hashValue:
            JHB_HUDView.showMsgMultiLineWithType(multiStr, coreInSet: 30, labelInSet: 20, delay: 2, HudType: .kHUDTypeDefaultly)
            break
        default:
            break
        }
    }
    
    func ShowImmediatelyType() {
        switch currentType {
        case coreType.coreTypeCircle.hashValue:
            JHB_HUDView.showProgressWithType(HUDType.kHUDTypeShowImmediately)
            self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
            break
        case coreType.coreTypeCircleWithMsg.hashValue:
            JHB_HUDView.showProgressMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeShowImmediately)
            self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
            break
        case coreType.coreTypeSingleMsg.hashValue:
            JHB_HUDView.showMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeShowImmediately)
            break
        case coreType.coreTypeMultiMsg.hashValue:
            JHB_HUDView.showMsgMultiLineWithType(multiStr, coreInSet: 30, labelInSet: 20, delay: 2, HudType: .kHUDTypeShowImmediately)
            break
        default:
            break
        }
    }
    
    func ShowSlightlyType() {
        switch currentType {
        case coreType.coreTypeCircle.hashValue:
            JHB_HUDView.showProgressWithType(HUDType.kHUDTypeShowSlightly)
            self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
            break
        case coreType.coreTypeCircleWithMsg.hashValue:
            JHB_HUDView.showProgressMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeShowSlightly)
            self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
            break
        case coreType.coreTypeSingleMsg.hashValue:
            JHB_HUDView.showMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeShowSlightly)
            break
        case coreType.coreTypeMultiMsg.hashValue:
            JHB_HUDView.showMsgMultiLineWithType(multiStr, coreInSet: 30, labelInSet: 20, delay: 2, HudType: .kHUDTypeShowSlightly)
            break
        default:
            break
        }
    }
    
    func ShowFromBottomToTopType() {
        switch currentType {
        case coreType.coreTypeCircle.hashValue:
            JHB_HUDView.showProgressWithType(HUDType.kHUDTypeShowFromBottomToTop)
            self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
            break
        case coreType.coreTypeCircleWithMsg.hashValue:
            JHB_HUDView.showProgressMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeShowFromBottomToTop)
            self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
            break
        case coreType.coreTypeSingleMsg.hashValue:
            JHB_HUDView.showMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeShowFromBottomToTop)
            break
        case coreType.coreTypeMultiMsg.hashValue:
            JHB_HUDView.showMsgMultiLineWithType(multiStr, coreInSet: 30, labelInSet: 20, delay: 2, HudType: .kHUDTypeShowFromBottomToTop)
            break
        default:
            break
        }
    }
    
    func ShowFromTopToBottomType() {
        switch currentType {
        case coreType.coreTypeCircle.hashValue:
            JHB_HUDView.showProgressWithType(HUDType.kHUDTypeShowFromTopToBottom)
            self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
            break
        case coreType.coreTypeCircleWithMsg.hashValue:
            JHB_HUDView.showProgressMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeShowFromTopToBottom)
            self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
            break
        case coreType.coreTypeSingleMsg.hashValue:
            JHB_HUDView.showMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeShowFromTopToBottom)
            break
        case coreType.coreTypeMultiMsg.hashValue:
            JHB_HUDView.showMsgMultiLineWithType(multiStr, coreInSet: 30, labelInSet: 20, delay: 2, HudType: .kHUDTypeShowFromTopToBottom)
            break
        default:
            break
        }
    }
    
    func ShowFromLeftToRightType() {
        switch currentType {
        case coreType.coreTypeCircle.hashValue:
            JHB_HUDView.showProgressWithType(HUDType.kHUDTypeShowFromLeftToRight)
            self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
            break
        case coreType.coreTypeCircleWithMsg.hashValue:
            JHB_HUDView.showProgressMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeShowFromLeftToRight)
            self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
            break
        case coreType.coreTypeSingleMsg.hashValue:
            JHB_HUDView.showMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeShowFromLeftToRight)
            break
        case coreType.coreTypeMultiMsg.hashValue:
            JHB_HUDView.showMsgMultiLineWithType(multiStr, coreInSet: 30, labelInSet: 20, delay: 2, HudType: .kHUDTypeShowFromLeftToRight)
            break
        default:
            break
        }
    }
    
    func ShowFromRightToLeftType() {
        switch currentType {
        case coreType.coreTypeCircle.hashValue:
            JHB_HUDView.showProgressWithType(HUDType.kHUDTypeShowFromRightToLeft)
            self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
            break
        case coreType.coreTypeCircleWithMsg.hashValue:
            JHB_HUDView.showProgressMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeShowFromRightToLeft)
            self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
            break
        case coreType.coreTypeSingleMsg.hashValue:
            JHB_HUDView.showMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeShowFromRightToLeft)
            break
        case coreType.coreTypeMultiMsg.hashValue:
            JHB_HUDView.showMsgMultiLineWithType(multiStr, coreInSet: 30, labelInSet: 20, delay: 2, HudType: .kHUDTypeShowFromRightToLeft)
            break
        default:
            break
        }
    }
    
    func ScaleFromInsideToOutsideType() {
        switch currentType {
        case coreType.coreTypeCircle.hashValue:
            JHB_HUDView.showProgressWithType(HUDType.kHUDTypeScaleFromInsideToOutside)
            self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
            break
        case coreType.coreTypeCircleWithMsg.hashValue:
            JHB_HUDView.showProgressMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeScaleFromInsideToOutside)
            self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
            break
        case coreType.coreTypeSingleMsg.hashValue:
            JHB_HUDView.showMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeScaleFromInsideToOutside)
            break
        case coreType.coreTypeMultiMsg.hashValue:
            JHB_HUDView.showMsgMultiLineWithType(multiStr, coreInSet: 30, labelInSet: 20, delay: 2, HudType: .kHUDTypeScaleFromInsideToOutside)
            break
        default:
            break
        }
    }
    
    func ScaleFromOutsideToInsideType() {
        switch currentType {
        case coreType.coreTypeCircle.hashValue:
            JHB_HUDView.showProgressWithType(HUDType.kHUDTypeScaleFromOutsideToInside)
            self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
            break
        case coreType.coreTypeCircleWithMsg.hashValue:
            JHB_HUDView.showProgressMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeScaleFromOutsideToInside)
            self.performSelector(#selector(hide), withObject: self, afterDelay: 1)
            break
        case coreType.coreTypeSingleMsg.hashValue:
            JHB_HUDView.showMsgWithType("Hello CoderBala !", HudType: HUDType.kHUDTypeScaleFromOutsideToInside)
            break
        case coreType.coreTypeMultiMsg.hashValue:
            JHB_HUDView.showMsgMultiLineWithType(multiStr, coreInSet: 30, labelInSet: 20, delay: 2, HudType: .kHUDTypeScaleFromOutsideToInside)
            break
        default:
            break
        }
    }
    
    func hide() {
        JHB_HUDView.hideProgress()
    }

    // 设置header 和 footer
     func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UILabel.init(frame: CGRectMake(0, 0, SCREEN_WIDTH, 60))
        header.text = "有好多展示的HUDType效果哦~!😊"
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
        footer.text = "是的,每种展示都是可供选择的哦~!😂"
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
