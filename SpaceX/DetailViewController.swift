//
//  DetailViewController.swift
//  SpaceX
//
//  Created by Jan Justyn Dela Cruz on 11/26/19.
//  Copyright © 2019 Jan Justyn Dela Cruz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var SpaceXImg: UIImageView!
    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var missionName: UILabel!
    @IBOutlet weak var launchyear: UILabel!
    @IBOutlet weak var launchsuccess: UILabel!
    
    var fullURL = ""
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.details
            }
            if let label2 = launchyear {
                label2.text = "Launch Year: \(detail.launchyear)"
            }
            if let label3 = launchsuccess {
                label3.text = "Launch Success: \(detail.launchsuccess)"
            }
            if let label4 = missionName {
                label4.text = "Mission Name: \(detail.MissionName)"
            }
            
            fullURL = "https://youtu.be/" + detail.youtubeid
            print(fullURL)
            
        }
        
        
    }
    
    @IBAction func VideoLink(_ sender: UIButton) {
            UIApplication.shared.open(URL(string: "\(fullURL)")! as URL, options: [:], completionHandler: nil)
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
        configureView()
        
        let ImageGetter = ImgGetter(named: detailItem!.flickrimg)
        
        SpaceXImg.image = ImageGetter
    }
    
    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SpaceXDetails" {

            let controller = segue.destination as! SubDetailViewController
            
            controller.SpaceXItem = detailItem!
            
        }
        
        if segue.identifier == "ShowVideo" {

            let controller = segue.destination as! VideoViewController
            
            controller.SpaceXItem = detailItem!
            
        }
        
    }
    
    var detailItem: SpaceX? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

