//
//  Util.swift
//  Remember
//
//  Created by CPU12071 on 8/27/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import Foundation
class Util {
    static func getTimeStamp() -> Int64 {
       return Int64(NSDate().timeIntervalSince1970 * 1000)
    }
}
