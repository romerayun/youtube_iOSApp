//
//  ViewController.swift
//  youtube_iOSApp
//
//  Created by Роман Юн on 23.09.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        model.getVideos()
        
    }


}

