//
//  MoviewModel.swift
//  DaCodesMovies
//
//  Created by Jonathan Rivera Misael on 15/10/20.
//

import Foundation

struct MoviewModelResponse: Codable {
    var results = [MoviewModel]()
    var page: Int?
}

struct MoviewModel: Codable {
    var title: String = ""
    var vote_average: Double?
    var release_date: String?
}

struct DatesResponse: Codable{
    var maximum: String?
    var minimum: String?
}

extension MoviewModel {
    static var allMoviews: Resource<MoviewModelResponse> = {
        
        var page = 1
        guard let url = URL(string: "\(Constants.URL)?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {
            fatalError("URL was incorrect")
        }
        
        return Resource<MoviewModelResponse>(url: url)
    }()
    
}
