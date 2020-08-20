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
    let reuseIdentifier = "movieCell"
    var movies:Movie = []
    var selectedMovie:MovieElement?
    
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //moviesCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        requestMovies()
        self.moviesCollectionView.delegate = self
        self.moviesCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func requestMovies() {
        if(Helper.isInternetAvailable()) {
            loader.show(controller: self)
            APIManager.shared().getVideos { movieResponse in
                if let movies = movieResponse {
                    self.movies = movies
                    self.requestImages()
                
                } else {
                    self.showPopUp(message: "Não foi possível obter a lista de filmes no momento, tente novamente mais tarde!", systemImage: "exclamationmark.circle", buttonText: "Fechar")
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
    
    func requestImages() {
        let group = DispatchGroup() // initialize

        movies.forEach { movie in

            
            group.enter()
            getData(from: movie.coverURL) { data, response, error in
                guard let data = data, error == nil else { return }
                print("Download Finished")
                if let image = UIImage(data: data){
                    print(movie.coverURL)
                     movie.image = image
                }
                group.leave()
                
            }
            
        }

        group.notify(queue: .main) {
            self.loader.dismiss()
            self.moviesCollectionView.reloadData()
        }
        
        print("Terminou")
    }
    
    func getData(from coverUrl: String, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let url = URL(string: coverUrl)!
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            if let vc = segue.destination as? DetailViewController {
                vc.movie = self.selectedMovie
            }
        }
    }
    
}

extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 5;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = CGSize(width: (collectionView.bounds.width - (3 * 10))/2, height: 250)
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        let sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return sectionInset
    }
    
    //UICollectionViewDatasource methods
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? MovieCollectionViewCell {
            let movie = movies[indexPath.row]
            cell.configureWith(movie: movie)
            return cell
            
        } else {
            let cell = UICollectionViewCell()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedMovie = movies[indexPath.row]
        self.performSegue(withIdentifier: "detail", sender: self)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
    
}
