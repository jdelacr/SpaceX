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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ViewDetail.text = SpaceXItem.details
    }
    
    var SpaceXItem:SpaceX = SpaceX()
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
