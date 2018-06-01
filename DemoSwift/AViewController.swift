//
//  AViewController.swift
//  DemoSwift
//
//  Created by cython on 2018/5/30.
//  Copyright © 2018年 cy. All rights reserved.
//

import UIKit

class AViewController: UIViewController {
    
    var gbcolor:UIColor!
    var contentLabel = UILabel.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = gbcolor
    }
    
    override func loadView() {
        super.loadView()
        self.view.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(self.view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
