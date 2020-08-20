//
//  ViewController.swift
//  SkyChallenge
//
//  Created by Lucas Feitosa on 19/08/20.
//  Copyright © 2020 lfeitosa.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let loader = Loader()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        if(Helper.isInternetAvailable()) {
            loader.show(controller: self)
            APIManager.shared().getVideos { movieResponse in
                self.loader.dismiss()
                if let movies = movieResponse {
                    print(movies)
                } else {
                    
                }
            }
        } else {
            
        }
        
    }
    
   


}

