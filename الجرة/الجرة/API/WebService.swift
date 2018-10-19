//
//  WebService.swift
//  الجرة
//
//  Created by Sayed Abdo on 10/13/18.
//  Copyright © 2018 JETS. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class WebService: NSObject {
   
    class func getResponse(p:Person,completion:@escaping (_ error:Error?,_ orderNum:Int)
        ->Void){
        let url = "http://jarra.pythonanywhere.com/userview/"
        let id = UIDevice.current.identifierForVendor!.uuidString
    
    
        let parameters = [
            "name": p.pName,
            "phone_number": p.pPhoneNumber,
            "email": p.pEmail,
            "processor_id": id
        
        ]
        

        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization":" Token 55596e72d14c329a64f620fc0859dab0ca1690f2"
        ]
        Alamofire.request(url, method:.post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                switch response.result
                {
                case.failure(let error):
                   
                    completion(error,0)
                case.success(let value):
                    
                    let json = JSON(value)
                   
                    var orderNumber = json["order"].int
                    var status = json["status"].string
                    
                   
                    
                    if(status == "fail"){
                        
                        completion(nil,0)
                    }
                    else{
                       
                        completion(nil,orderNumber!)
                        
                    }
                }
        }
        
        
    }
    
    
    
    
    
    
    
}
