//
//  Connectivity.swift
//  الجرة
//
//  Created by Sayed Abdo on 10/13/18.
//  Copyright © 2018 JETS. All rights reserved.
//

import UIKit

import Alamofire
class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }

}
