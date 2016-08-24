//
//  ExampleDiyController.swift
//  JHB_HUDViewExample
//
//  Created by Leon_pan on 16/8/23.
//  Copyright © 2016年 bruce. All rights reserved.
//

import UIKit

class ExampleDiyController: UITableViewController {
    var SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    var SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    
    
    
    // 声明一个数组,用来储存cell
    var cellArr = NSMutableArray()
    // 标示
    var ID = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Diy-Type"
        self.setTableView()
    }
    
    
    func setTableView() {
        // 注册cell
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: ID)
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
    }
    
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ID, forIndexPath: indexPath)
        cell.textLabel?.numberOfLines = 0
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "1⃣️JHB_HUDView 显示图片并有可选效果~"
        }else if indexPath.row == 1{
            cell.textLabel?.text = "2⃣️JHB_HUDView 显示图片数组动画~"
        }else if indexPath.row == 2{
            cell.textLabel?.text = "3⃣️JHB_HUDView 显示信息和图片并有可选效果~"
        }else if indexPath.row == 3{
            cell.textLabel?.text = "4⃣️JHB_HUDView 显示信息和图片数组动画~"
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0{
            let secondVc = ExampleDiyDetailController()
            secondVc.diyimgtype = .diyImageTypeJustImage
            self.navigationController?.pushViewController(secondVc, animated: true)
        }else if indexPath.row == 1{
            let secondVc = ExampleDiyDetailController()
            secondVc.diyimgtype = .diyImageTypeImageArray
            self.navigationController?.pushViewController(secondVc, animated: true)
        }else if indexPath.row == 2{
            let secondVc = ExampleDiyDetailController()
            secondVc.diyimgtype = .diyImageTypeImageWithMsg
            self.navigationController?.pushViewController(secondVc, animated: true)
        }else if indexPath.row == 3{
            let secondVc = ExampleDiyDetailController()
            secondVc.diyimgtype = .diyImageTypeImageArrayWithMsg
            self.navigationController?.pushViewController(secondVc, animated: true)
        }
    }
    
    // 设置header 和 footer
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UILabel.init(frame: CGRectMake(0, 0, SCREEN_WIDTH, 60))
        header.text = "Diy-Type中暂有四种自定义展示类型哦~!😊"
        header.sizeToFit()
        header.numberOfLines = 0
        header.textColor = UIColor.whiteColor()
        header.font = UIFont.systemFontOfSize(18)
        header.textAlignment = NSTextAlignment.Center
        header.backgroundColor = UIColor.orangeColor()
        return header
    }
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UILabel.init(frame: CGRectMake(0, 0, SCREEN_WIDTH, 60))
        footer.text = "是的,每种类型都非常的Cool~!❤️关键:支持屏幕旋转!!!😂"
        footer.sizeToFit()
        footer.numberOfLines = 0
        footer.textColor = UIColor.whiteColor()
        footer.font = UIFont.systemFontOfSize(18)
        footer.textAlignment = NSTextAlignment.Center
        footer.backgroundColor = UIColor.orangeColor()
        return footer
        
    }
    // ❤️ 如果要展示header 或 footer 就必须要设置他们的高度值!
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 60
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }

}
