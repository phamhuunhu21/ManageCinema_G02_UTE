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
        let posterUrl = movieDetail?.getURLImage()
        self.downloadImage(url: URL(string: posterUrl!)!)
        
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
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    func downloadImage(url: URL) -> Void{
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { () -> Void in
                self.posterImg.image = UIImage(data: data)
                //return UIImage(data: data)
            }
        }
    }
    
}
