//
//  Loader.swift
//  SkyChallenge
//
//  Created by Lucas Feitosa on 19/08/20.
//  Copyright © 2020 lfeitosa.com. All rights reserved.
//

import UIKit

class Loader: UIView {
    
    
    var spinner = UIActivityIndicatorView(style: .large)
    
    let label:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 20)
        l.lineBreakMode = NSLineBreakMode.byWordWrapping
        l.numberOfLines = 0
        l.textAlignment = .left
        l.text = "Loading"
        l.textColor = UIColor.white
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("has not been implemented")
    }
    
    init() {
        super.init(frame: UIScreen.main.bounds)
    }
    
    func dismiss() {
        UIView.animate(withDuration: 0.2, animations: {
            self.removeFromSuperview()
        })
    }
    
    func show(controller:UIViewController) {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.frame = UIScreen.main.bounds
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        spinner.color = UIColor.white
        self.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.addSubview(label)
        label.topAnchor.constraint(equalTo: spinner.bottomAnchor, constant: 20).isActive = true
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        
        controller.view.addSubview(self)
    }
    
}
