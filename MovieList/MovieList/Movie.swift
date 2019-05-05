//
//  Movie.swift
//  MovieList
//
//  Created by JETS Mobile Lab-3 on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import Foundation
class Movie {
    var title : String!
    var image : String!
    var rating : Float!
    var releaseYear : Int!
    var genre : [String!]
    init() {
        title=""
        image=""
        rating=0.0
        releaseYear=0
        genre=[]
        
    }
}
