//
//  MasterViewController.swift
//  SpaceX
//
//  Created by Jan Justyn Dela Cruz on 11/26/19.
//  Copyright © 2019 Jan Justyn Dela Cruz. All rights reserved.
// https://api.spacexdata.com/v2/launches
// https://api.jsonbin.io/b/5ddd8a05040d843991f99d30

// Space ships
// https://api.myjson.com/bins/ctgg6

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var SpaceXArray = [SpaceX]()


    
    func prepareJSONData(){
        let URLendpoint = "https://api.jsonbin.io/b/5ddd8a05040d843991f99d30"
        let SpaceXURL = URL(string: URLendpoint)!
        
          let jsonData = try? Data(contentsOf: SpaceXURL)
              print(jsonData ?? "ERROR: No Data To Print. jsonURLData is Nil")
          
          if (jsonData != nil){
              let dictionary:NSDictionary = (try! JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
              
              
              //print(dictionary)
            
            let SpaceXDictionary = dictionary["launches"]! as![[String:AnyObject]]
            
            for index in 0...SpaceXDictionary.count-1{
                let item = SpaceXDictionary[index]
                let Space = SpaceX()
                
                Space.ID = item["flight_number"] as! Int
                Space.MissionName = item["mission_name"] as! String
                Space.launchyear = item["launch_year"] as! String
                Space.missionpatch = item["links"]?["mission_patch_small"] as! String
                Space.launchsite = item["launch_site"]?["site_name_long"] as! String
                Space.articlelink = item["links"]?["article_link"] as! String
                Space.wikipedia = item["links"]?["wikipedia"] as! String
                
                //Launch details
                let launchdetails = item["details"] as? String
                
                if(launchdetails != nil){
                    Space.details = launchdetails!
                }
                else{
                    Space.details = "This spacecraft has no details entered. Please check the article or wikipedia for more details."
                }
                
                //Launch Success
                let launchsuccess = item["launch_success"] as! Bool
                
                if (launchsuccess != false){
                    Space.launchsuccess = "True"
                }
                else{
                    Space.launchsuccess = "False"
                }
                
                //Images
                let item2 = item["links"]?["flickr_images"] as! [AnyObject]
                
                if(item2.count != 0){
                    Space.flickrimg = item2[0] as! String
                }
                else{
                    Space.flickrimg = item["links"]?["mission_patch"] as! String
                }
                
                //Youtube Link
                //see if the link is available
                let item3 = item["links"]?["youtube_id"] as? String
                
                if (item3 != nil){
                    Space.youtubeid = item3!
                }
                else{
                    Space.youtubeid = ""
                }
                
                SpaceXArray.append(Space)
            }
              
          }
    }
    
    func ImgGetter(named:String)-> UIImage{
        let fullURL = named
        let url = URL(string: fullURL)
        let dataBytes = try? Data(contentsOf: url!)
        let img = UIImage(data: dataBytes!)
        
        return img!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        prepareJSONData()
        
        

    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = SpaceXArray[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                detailViewController = controller
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SpaceXArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let object = SpaceXArray[indexPath.row]
        cell.textLabel!.text = object.MissionName
        cell.detailTextLabel!.text = object.launchyear
        
        let imgpatch = ImgGetter(named: object.missionpatch)
        cell.imageView!.image = imgpatch
        
        return cell
    }


}

