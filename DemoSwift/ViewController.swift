//
//  ViewController.swift
//  DemoSwift
//
//  Created by cython on 2018/5/30.
//  Copyright © 2018年 cy. All rights reserved.
//

import UIKit
import Alamofire
import Alamofire_SwiftyJSON
import SwiftyJSON
import Pods_DemoSwift

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,DemoTableViewCellDelegate,NetworkProtocol{
    
    private let tableview:UITableView = UITableView.init(frame: CGRect.zero, style: UITableViewStyle.plain)
    
    private var cellArray = [DemoModel]()
    
    override func loadView() {
        super.loadView()
        self.tableview.backgroundColor = UIColor.withHex(hexString:"#eaebed")
        self.view.backgroundColor = UIColor.withHex(hexString:"#eaebed")
        tableview.frame = self.view.frame
        tableview.delegate = self
        tableview.estimatedRowHeight = 250
        tableview.rowHeight = UITableViewAutomaticDimension
        tableview.dataSource = self
        tableview.register(DemoTableViewCell.self, forCellReuseIdentifier: "cellId")
        self.view.addSubview(tableview)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: false)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:DemoTableViewCell
        cell = tableview.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! DemoTableViewCell
        if cellArray.count>0 {
            cell.model = cellArray[indexPath.row]
        }
        cell.delegate = self
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        Network.loadHomeCategoryData { (models) in
            self.cellArray = models
            self.tableview.reloadData()
        }
    }

    func pushViewController(clicked index: NSInteger) {
        switch index {
        case 0:
            let Acontroller = AViewController()
            Acontroller.gbcolor = UIColor.red
            self.navigationController?.pushViewController(Acontroller, animated: true)
        case 1:
            let Bcontroller = BViewController()
            Bcontroller.gbcolor = UIColor.blue
            self.navigationController?.pushViewController(Bcontroller, animated: true)
        default:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

