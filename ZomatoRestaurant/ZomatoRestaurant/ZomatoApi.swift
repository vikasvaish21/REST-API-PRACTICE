//
//  ZomatoApi.swift
//  ZomatoRestaurant
//
//  Created by vikas on 21/07/19.
//  Copyright © 2019 project1. All rights reserved.
//

import Foundation
class ZomatoApi{
    static let appKey = "d54574e539168c9b095995e600bfa398"
    enum Endpoint{
        
        case categories
        
        var url:URL{
            return URL(string:self.stringValue)!
        }
        
        
        var stringValue:String{
            switch self{
            case .categories:
                return "https://developers.zomato.com/api/v2.1/categories"
            }
        }
  }
    
    class func categoriesList(completionHandler: @escaping  ([String], Error?) -> Void) {
        var request = URLRequest(url:  Endpoint.categories.url)
        request.addValue(appKey, forHTTPHeaderField: "user-key")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completionHandler([],error)
                print("guard statement successful")
                return
            }
            print("api call successful")
            do{
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                print(jsonObject)
                print("json parsing successful")
            }
            catch{
                print("json parsing field")
                completionHandler([], nil)
                print(error)
            }
            
        }
        task.resume()
    }
    
    
}
