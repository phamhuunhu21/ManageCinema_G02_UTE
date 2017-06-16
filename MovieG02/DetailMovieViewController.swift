//
//  DetailMovieViewController.swift
//  MovieG02
//
//  Created by Pham Huu Nhu on 6/9/17.
//  Copyright © 2017 Pham Huu Nhu. All rights reserved.
//

import UIKit
import Firebase

class DetailMovieViewController: UIViewController {
    
    @IBOutlet weak var posterImg: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var actorLabel: UILabel!
    @IBOutlet weak var cinemaLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    
    var movieDetail : Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = movieDetail?.getTitle()
        releaseDateLabel.text = movieDetail?.getReleaseDate()
        typeLbl.text = movieDetail?.getType()
        lengthLabel.text = movieDetail?.getLength()
        directorLabel.text = movieDetail?.getDirector()
        actorLabel.text = movieDetail?.getActor()
        cinemaLabel.text = movieDetail?.getCinema()
        detailTextView.text = movieDetail?.getDetail()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func bookMovieButtonTapped(_ sender: Any) {
        //let idMovie = movieDetail?.getId()
        performSegue(withIdentifier: "showTimeBook", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTimeBook" {
            if let destination = segue.destination as? ShowTimeBookViewController {
                //destination.passedData = sender as? String
                destination.passedData = self.movieDetail?.getId()
            }
        }
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
