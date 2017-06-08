//
//  HomeViewController.swift
//  MovieG02
//
//  Created by Pham Huu Nhu on 6/8/17.
//  Copyright © 2017 Pham Huu Nhu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var movie = [Movie]()
    var filteredMovie = [Movie]()
    var ref: DatabaseReference!
    var refHandler: UInt!
    let loadingImage: String = "https://www.galaxycine.vn/media/3/0/300_45.jpg"
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.scopeButtonTitles = ["All", "Now Showing", "Coming Soon"]
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self as UISearchResultsUpdating
        searchController.dimsBackgroundDuringPresentation = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadDataMovie()
    }
    
    func loadDataMovie() {
        self.movie = [Movie]()
        refHandler = ref.child("Movie").observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject]{
                let type_Snap = dictionary["type"] as? String
                let title_Snap = dictionary["title"] as? String
                let url_Image = dictionary["urlImage"] as? String
                let caTeGoRy = dictionary["category"] as? String
                self.movie.append(Movie(title: title_Snap!, type: type_Snap!, urlImage: url_Image!, category: caTeGoRy!))
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        })
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredMovie.count
        }
        
        return movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HomeTableViewCell
        
        var mv: Movie
        //mv = movie[indexPath.row]
        
        if searchController.isActive && searchController.searchBar.text != "" {
            mv = filteredMovie[indexPath.row]
        }
        else {
            mv = movie[indexPath.row]
        }
        
        //if let url = Downloader.DownloadImageURL("\(self.loadingImage)\(mv.getURLImage())") {
        cell.titleLabel.text = mv.getTitle()
        cell.typeLabel.text = mv.getType()
        // cell.posterImage.image = url
        
        //let posterUrl: String = mv.getURLImage()
        let posterUrl: String = loadingImage
        Downloader.downloadImage(url: URL(string: posterUrl)!, cell: cell)
        
        
        return cell
    }

    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredMovie = movie.filter { mv in
            let categoryMatch = (scope == "All") || (mv.getCategory() == scope)
            return categoryMatch && mv.getTitle().lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }
}

class Downloader {
    
    class func downloadImageWithURL(_ url:String) -> UIImage! {
        
        let data = try? Data(contentsOf: URL(string: url)!)
        return UIImage(data: data!)
    }
    
    class func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    class func downloadImage(url: URL, cell: HomeTableViewCell) -> Void{
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            DispatchQueue.main.async() { () -> Void in
                cell.posterImage.image = UIImage(data: data)
            }
        }
    }
}

extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchText: searchController.searchBar.text!, scope: scope)
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchText: searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

