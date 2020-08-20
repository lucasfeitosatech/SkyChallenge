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
    var popUp = Modal()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        if(Helper.isInternetAvailable()) {
            loader.show(controller: self)
            APIManager.shared().getVideos { movieResponse in
                self.loader.dismiss()
                if let movies = movieResponse {
                    print(movies)
                    self.showPopUp(message: "Requisição concluída com sucesso!", systemImage: "checkmark", buttonText: "Fechar")
                } else {
                    
                }
            }
        } else {
            self.showPopUp(message: "Você não possui Internet no momento!", systemImage: "exclamationmark.circle", buttonText: "Fechar")
        }
        
    }
    
    func showPopUp(message:String,systemImage:String,buttonText:String){
        popUp = Modal()
        popUp.label.text = message
        popUp.image.image = UIImage(systemName: systemImage)
        popUp.button.setTitle(buttonText, for: .normal)
        popUp.button.addTarget(self.popUp, action: #selector(self.popUp.animateOut), for: .touchUpInside)
        self.view.addSubview(self.popUp)
    }
    
    
    
   


}

