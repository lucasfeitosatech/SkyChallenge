//
//  MovieCollectionViewCell.swift
//  SkyChallenge
//
//  Created by Lucas Feitosa on 19/08/20.
//  Copyright © 2020 lfeitosa.com. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func configureWith(movie:MovieElement){
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 15.0
        if let image = movie.image {
            movieImage.image = image
        } 
        self.movieLabel.text = movie.title
    }
    
    
}
