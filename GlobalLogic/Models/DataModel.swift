//
//  DataModel.swift
//  GlobalLogic
//
//  Created by Alejandro  Rodriguez on 17-03-18.
//  Copyright © 2018 Alejandro  Rodriguez. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper


struct  DataModel: Mappable  {
    var title: String = ""
    var description: String = ""
    var image: String = ""
    
    
    init( map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        self.title     <- map["title"]
        self.description <- map["description"]
        self.image   <- map["image"]
    }
    
    func toImage() -> UIImage {
        let url = URL(string: self.image)
        let data = try? Data(contentsOf: url!)
        if data == nil {
            return UIImage(named: "NoImage")!
        }
        return UIImage(data: data!)!
    }
}

