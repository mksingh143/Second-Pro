//
//  JsonModelClass.swift
//  SuspireTv
//
//  Created by Manoj Kumar Singh on 06/12/17.
//  Copyright © 2017 SoftIndigo. All rights reserved.
//

import UIKit

struct JsonData {
    var Category_id = Int()
    var subcategory_id = Int()
    var subcategory_name = ""
    var contents = [AnyObject]()
}

class JsonModelClass: NSObject {
    
    var dataArray = NSArray()
     var obj = JsonData()
    func getJsonFromUrl()-> NSArray {
        //creating a NSURL
        
        let URLString = "http://www.totalvdo.com/demo/game/suspiretv.php"
        let url = URL(string: URLString)
        
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
             //   self.array.removeAll()
                //printing the json in console
              //  print(jsonObj!.value(forKey: "subcategory")!)
                
                //getting the avengers tag array from json and converting it to NSArray
                if (jsonObj!.value(forKey: "subcategory") as? NSArray) != nil {
                    self.dataArray = (jsonObj!.value(forKey: "subcategory") as? NSArray)!
                    print(self.dataArray)
                    var i = 0
                    
                    //looping through all the elements
                    for item in self.dataArray{
                        self.obj.Category_id = (item as AnyObject).value(forKey: "Category_id") as! Int
                        self.obj.subcategory_id = (item as AnyObject).value(forKey: "subcategory_id") as! Int
                        self.obj.contents = ((item as AnyObject).value(forKey: "contents") as! NSArray) as [AnyObject]
                        self.obj.subcategory_name = (item as AnyObject).value(forKey: "subcategory_name") as! String
                        i =  i + 1
                    }
                }
                DispatchQueue.main.async {
                  //  self.tableView.reloadData()
                }
            }
        }).resume()
        return self.dataArray
    }
}
