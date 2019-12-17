//
//  SubDetailViewController.swift
//  SpaceX
//
//  Created by Jan Justyn Dela Cruz on 11/28/19.
//  Copyright © 2019 Jan Justyn Dela Cruz. All rights reserved.
//

import UIKit

class SubDetailViewController: UIViewController {

    @IBOutlet weak var ViewDetail: UILabel!
    @IBOutlet weak var BGview: UIView!
    
    @IBOutlet weak var articlebtn: UIButton!
    @IBOutlet weak var wikibtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ViewDetail.text = SpaceXItem.details
        ViewDetail.textColor = .white
        
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor(red:0.20, green:0.03, blue:0.40, alpha:1.0).cgColor, UIColor(red:0.19, green:0.81, blue:0.82, alpha:1.0).cgColor]
        layer.startPoint = CGPoint(x: 1,y: 0)
        layer.endPoint = CGPoint(x: 1,y: 1)
        BGview.layer.addSublayer(layer)
        
        articlebtn.layer.cornerRadius = 5
        articlebtn.clipsToBounds = true
        wikibtn.layer.cornerRadius = 5
        wikibtn.clipsToBounds = true
        
        
    }
    
    var SpaceXItem:SpaceX = SpaceX()
    
    @IBAction func didTapArticle(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "\(SpaceXItem.articlelink)")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func didTapWiki(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "\(SpaceXItem.wikipedia)")! as URL, options: [:], completionHandler: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
