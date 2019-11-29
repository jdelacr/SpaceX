//
//  VideoViewController.swift
//  SpaceX
//
//  Created by Jan Justyn Dela Cruz on 11/29/19.
//  Copyright © 2019 Jan Justyn Dela Cruz. All rights reserved.
//

import UIKit
import WebKit

class VideoViewController: UIViewController, UIWebViewDelegate {

    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self as? WKUIDelegate
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let youtubeURL = "https://youtube.com/embed/\(SpaceXItem.youtubeid)/?rel=0&amp;autoplay=1;fs=0;autohide=0;hd=0"
        
        let myURL = URL(string: youtubeURL)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
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
