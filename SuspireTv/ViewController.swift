//
//  ViewController.swift
//  SuspireTv
//
//  Created by Manoj Kumar Singh on 06/12/17.
//  Copyright © 2017 SoftIndigo. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    
   var dataArray = NSArray()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getJsonFromUrl()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getJsonFromUrl() {
        let URLString = "http://www.totalvdo.com/demo/game/suspiretv.php"
        let url = URL(string: URLString)
        
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                if (jsonObj!.value(forKey: "subcategory") as? NSArray) != nil {
                    self.dataArray = (jsonObj!.value(forKey: "subcategory") as? NSArray)!
                    print(self.dataArray.count)
                    
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }).resume()
        
        
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeScreenTableViewCell") as! HomeScreenTableViewCell
        let item = dataArray[indexPath.row] as! NSDictionary
        cell.obj.Category_id = (item as AnyObject).value(forKey: "Category_id") as! Int
        cell.obj.subcategory_id = (item as AnyObject).value(forKey: "subcategory_id") as! Int
        cell.obj.contents = ((item as AnyObject).value(forKey: "contents") as! NSArray) as [AnyObject]
        cell.obj.subcategory_name = (item as AnyObject).value(forKey: "subcategory_name") as! String
        
        cell.titleLabel.text = (item as AnyObject).value(forKey: "subcategory_name") as? String
        return cell
    }
    
    
}
