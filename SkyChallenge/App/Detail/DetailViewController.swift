//
//  DetailViewController.swift
//  SkyChallenge
//
//  Created by Lucas Feitosa on 20/08/20.
//  Copyright © 2020 lfeitosa.com. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var overviewLabel: UITextView!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    var movie:MovieElement?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadMovieInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func loadMovieInfo() {
        if let movie = self.movie {
            if let image = movie.image {
                coverImage.image = image
            } else {
                coverImage.image = UIImage(systemName: "square.and.arrow.up")
            }
            durationLabel.text = movie.duration
            overviewLabel.text = movie.overview
            yearLabel.text = movie.releaseYear
        }
    }
    
    @IBAction func playMovie(_ sender: Any) {
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
