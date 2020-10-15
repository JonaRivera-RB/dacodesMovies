//
//  MoviewModel.swift
//  DaCodesMovies
//
//  Created by Jonathan Rivera Misael on 15/10/20.
//

import Foundation

struct MoviewModelResponse: Codable {
    var results = [MovieModel]()
    var page: Int?
    var total_pages: Int?
    var total_results: Int?
}

struct MovieModel: Codable {
    var id: Int = 0
    var title: String = ""
    var vote_average: Double?
    var release_date: String?
    var poster_path: String = ""
}
