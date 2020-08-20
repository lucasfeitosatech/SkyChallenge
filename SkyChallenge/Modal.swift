//
//  Modal.swift
//  SkyChallenge
//
//  Created by Lucas Feitosa on 19/08/20.
//  Copyright © 2020 lfeitosa.com. All rights reserved.
//

import UIKit

class Modal: UIView {
    
    
    let closeButton:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "xmark")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let image:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "checkmark")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let label:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 14)
        l.lineBreakMode = NSLineBreakMode.byWordWrapping
        l.numberOfLines = 0
        l.textAlignment = .left
        return l
    }()
    
    var button:UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = UIColor.systemBlue
        b.titleLabel?.textColor = UIColor.white
        b.layer.cornerRadius = 15
        b.setTitle("Fechar", for: .normal)
        return b
    }()
    
    let container:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.white
        v.layer.cornerRadius = 24
        return v
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("has not been implemented")
    }
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        setupContainer(withWidthPercent: 0.85, height: 285)
        setupcloseButton()
        setupImage()
        setupLabel()
        setupButton()
        container.addSubview(button)
        animateIn()
    }
    
    func setupContainer(withWidthPercent width:CGFloat,height:CGFloat){
        
        self.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.frame = UIScreen.main.bounds
        self.addSubview(container)
        
        container.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: width).isActive = true
        container.heightAnchor.constraint(equalToConstant: height).isActive = true
        
    }
    
    func setupcloseButton() {
        container.addSubview(closeButton)
        closeButton.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 15).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -15).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        closeButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateOut)))
        closeButton.isUserInteractionEnabled = true
    }
    
    func setupImage() {
        container.addSubview(image)
        image.topAnchor.constraint(equalTo: self.closeButton.bottomAnchor, constant: 10).isActive = true
        image.centerXAnchor.constraint(equalTo: self.container.centerXAnchor).isActive = true
        image.widthAnchor.constraint(equalTo: self.container.widthAnchor, multiplier: 0.5).isActive = true
        image.heightAnchor.constraint(equalTo: self.container.heightAnchor, multiplier: 0.25).isActive = true
    }
    
    func setupLabel() {
        container.addSubview(label)
        label.topAnchor.constraint(equalTo: self.image.bottomAnchor, constant: 30).isActive = true
        label.centerXAnchor.constraint(equalTo: self.container.centerXAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: self.container.widthAnchor, multiplier: 0.8).isActive = true
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        label.text = "Lorem ipsum de teste desse modal"
        label.textAlignment = .center
    }
    
    func setupButton() {
        container.addSubview(button)
        button.topAnchor.constraint(equalTo: self.label.bottomAnchor, constant: 30).isActive = true
        button.centerXAnchor.constraint(equalTo: self.container.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 0.5*UIScreen.main.bounds.width).isActive = true
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    @objc func animateOut() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
            self.alpha = 0
        }) { (complete) in
            if complete {
                self.removeFromSuperview()
            }
        }
        
    }
    
    @objc func animateIn() {
        self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
        self.alpha = 1
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.container.transform = .identity
            self.alpha = 1
        })
    }
    
}

