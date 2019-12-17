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
    
    @IBOutlet weak var detailbtn: UIButton!
    @IBOutlet weak var videobtn: UIButton!
    @IBOutlet weak var BGview: UIView!
    
    @IBOutlet weak var missionName: UILabel!
    @IBOutlet weak var launchyear: UILabel!
    @IBOutlet weak var launchsuccess: UILabel!
    @IBOutlet weak var launchsite: UILabel!
    
    var fullURL = ""
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.details
                label.textColor = .white
            }
            if let label2 = launchyear {
                label2.text = "Launch Year: \(detail.launchyear)"
                label2.textColor = .white
            }
            if let label3 = launchsuccess {
                label3.text = "Launch Success: \(detail.launchsuccess)"
                label3.textColor = .white
            }
            if let label4 = missionName {
                label4.text = "Mission Name: \(detail.MissionName)"
                label4.textColor = .white
            }
            if let label5 = launchsite {
                label5.text = "Launch Site: \(detail.launchsite)"
                label5.textColor = .white
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
        
        detailbtn.layer.cornerRadius = 5
        detailbtn.clipsToBounds = true
        videobtn.layer.cornerRadius = 5
        videobtn.clipsToBounds = true
        
        let ImageGetter = ImgGetter(named: detailItem!.flickrimg)
        
        SpaceXImg.image = ImageGetter
        
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor(red:0.20, green:0.03, blue:0.40, alpha:1.0).cgColor, UIColor(red:0.19, green:0.81, blue:0.82, alpha:1.0).cgColor]
        layer.startPoint = CGPoint(x: 1,y: 0)
        layer.endPoint = CGPoint(x: 1,y: 1)
        BGview.layer.addSublayer(layer)
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

