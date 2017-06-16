//
//  History.swift
//  MovieG02
//
//  Created by Pham Huu Nhu on 6/16/17.
//  Copyright © 2017 Pham Huu Nhu. All rights reserved.
//

import Foundation
import UIKit

class History : NSObject {
    private var title : String?
    private var cinema : String?
    private var date : String?
    private var time : String?
    private var chair : String?
    
    init (title: String, cinema: String, date: String, time: String, chair: String) {
        self.title = title
        self.cinema = cinema
        self.date = date
        self.time = time
        self.chair = chair
    }
    
    func getTitle () -> String {
        return title!
    }
    
    func getCinema () -> String {
        return cinema!
    }
    
    func getDate () -> String {
        return date!
    }
    
    func getTime () -> String {
        return time!
    }
    
    func getChair () -> String {
        return chair!
    }
}
