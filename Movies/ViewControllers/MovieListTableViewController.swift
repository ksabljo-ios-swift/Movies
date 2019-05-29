//
//  MovieListTableViewController.swift
//  Movies
//
//  Created by Krešimir Sabljo on 29/05/2019.
//  Copyright © 2019 Krešimir Sabljo. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieListTableViewController: UITableViewController {

    let movieListCellIdentifier = "movieListCellIdentifier"
    var movies = [Movie]()
    var movieResult: MovieResult?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchMovieData(page: 1){ result in
            DispatchQueue.main.async {
                self.movieResult = result
                self.movies = result.movie
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: movieListCellIdentifier, for: indexPath) as! MovieListTableViewCell
        let movie = movies[indexPath.row]
        
        cell.titleLabel?.text = movie.title
        cell.posterImageView?.af_setImage(withURL: movie.posterURL)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        navigationController?.pushViewController(detailVC, animated: true)
        let movie = movies[indexPath.row]
        
        detailVC.movie = movie
    }
}
