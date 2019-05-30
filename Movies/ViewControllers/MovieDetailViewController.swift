//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Krešimir Sabljo on 29/05/2019.
//  Copyright © 2019 Krešimir Sabljo. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
    
    
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!

    @IBOutlet weak var castCollectionView: UICollectionView!

    let castCollectionCellIdentifier = "castCollectionCellIdentifier"
    
    
    var movie: Movie?
    var casts = [Cast]()
    var castResult: CastResult?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.castCollectionView.delegate = self
        self.castCollectionView.dataSource = self
        
        
        setupUI()
        
        fetchCastData(movieID: movie!.id){ result  in
            DispatchQueue.main.async {
                self.castResult = result
                self.casts = result.cast
                self.castCollectionView.reloadData()
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return casts.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: castCollectionCellIdentifier, for: indexPath) as! CastCollectionViewCell
        let cast = casts[indexPath.row]

        cell.nameLabel.text = cast.name
        
        
        return cell
    }
    
    
    func setupUI() {
      
        
        if movie?.backdropPath != nil {
            backdropImageView?.af_setImage(withURL: movie!.backdropURL)
        }
        if movie?.posterPath != nil {
            posterImageView.af_setImage(withURL: movie!.posterURL)
        }
        if movie?.title != nil {
            titleLabel.text = movie?.title
        }
        if movie?.overview != nil {
            overviewLabel.text = movie?.overview
        }
        
        
        
    }
    
    



}
