//
//  NetWork.swift
//  DemoSwift
//
//  Created by cython on 2018/6/1.
//  Copyright © 2018年 cy. All rights reserved.
//

import UIKit
import Moya
import Alamofire
import SwiftyJSON

protocol  NetworkProtocol{
    
    /**首页数据*/
    static func loadHomeCategoryData(completionHandler: @escaping (_ categoryData:[DemoModel]) -> ())
}

extension NetworkProtocol{
    static func loadHomeCategoryData(completionHandler: @escaping (_ categoryData:[DemoModel]) -> ()){
        Alamofire.request("http://static.youshikoudai.com/mockapi/data", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseSwiftyJSON { (response) in
            
            let jsonArray:String? = String.init(data: response.data!, encoding: String.Encoding.utf8)
            if let models = [DemoModel].deserialize(from: jsonArray) {
                completionHandler(models as! [DemoModel])
            }else{
                completionHandler([])
            }
            
        }
    }
}

struct Network:NetworkProtocol {}
