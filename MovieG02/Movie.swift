//
//  Movie.swift
//  MovieG02
//
//  Created by Pham Huu Nhu on 6/8/17.
//  Copyright © 2017 Pham Huu Nhu. All rights reserved.
//

import Foundation
import UIKit

class Movie : NSObject {
    private var id : String?
    private var title : String?
    private var detail : String?
    private var director : String?
    private var actor : String?
    private var cinema : String?
    private var length : String?
    private var releaseDate : String?
    private var type : String?
    private var urlImage : String?
    private var category : String?
    
    init(title: String, type: String, urlImage: String, category: String) {
        self.title = title
        self.type = type
        self.urlImage = urlImage
        self.category = category
    }
    
    func getId () -> String {
        return id!
    }
    
    func getTitle () -> String {
        return title!
    }
    
    func getType () -> String {
        return type!
    }
    
    func getURLImage () -> String {
        return urlImage!
    }
    
    func getCategory() -> String {
        return category!
    }
}
