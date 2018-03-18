//
//  Utils.swift
//  GlobalLogic
//
//  Created by Alejandro  Rodriguez on 17-03-18.
//  Copyright © 2018 Alejandro  Rodriguez. All rights reserved.
//

import Foundation
import UIKit
class util {
    let API = "http://private-f0eea-mobilegllatam.apiary-mock.com/list"
    class var shared: util {
        struct Static {
            static let instance = util()
        }
        return Static.instance
    }
    
    /// Color hexadecimal
    ///
    /// - Parameters:
    ///   - hex: valor Hex
    ///   - alpha: alpha
    /// - Returns: retorna UIColor
    func UIColorFromHex(_ hex:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((hex & 0xFF0000) >> 16)/256.0
        let green = CGFloat((hex & 0xFF00) >> 8)/256.0
        let blue = CGFloat(hex & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
}
