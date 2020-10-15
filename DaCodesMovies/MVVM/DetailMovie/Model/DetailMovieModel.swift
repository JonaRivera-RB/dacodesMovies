//
//  DetailMovieModel.swift
//  DaCodesMovies
//
//  Created by Jonathan Rivera Misael on 15/10/20.
//

import Foundation

struct DetailMovieModel: Codable {
    var backdrop_path: String?
    var original_title: String?
    var runtime: Int?
    var vote_average: Double?
    var genres: [Genres]?
    var overview: String?
    var release_date: String?
}

struct Genres: Codable {
    var id: Int?
    var name: String?
}
