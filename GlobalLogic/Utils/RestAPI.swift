//
//  RestAPI.swift
//  GlobalLogic
//
//  Created by Alejandro  Rodriguez on 17-03-18.
//  Copyright © 2018 Alejandro  Rodriguez. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
class RestAPI {
    
    func getData(completion: @escaping ([Any]) -> Void){
        let url = "\(util.shared.API)"
        
        Alamofire.request(url).responseArray(completionHandler: { (response: DataResponse<[DataModel]>) in
            if response.response?.statusCode == 200 {
                guard response.result.isSuccess else {
                    print("Error while fetching tags: \(String(describing: response.result.error))")
                    completion([DataModel]())
                    return;
                }
                completion(response.result.value!)
            } else {
                
            }
        })
    }
}
