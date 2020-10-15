//
//  MoviewViewModel.swift
//  DaCodesMovies
//
//  Created by Jonathan Rivera Misael on 15/10/20.
//

import Foundation

class MoviewViewModel {
    
    var movieModel: MovieModel
    var page: Int = 1
    
    init(movieModel: MovieModel) {
        self.movieModel = movieModel
    }
    
    var refreshData = { () -> () in }
    
    var moviesArray: MoviewModelResponse = MoviewModelResponse() {
        didSet {
            self.moviesArray.results += oldValue.results
            refreshData()
        }
    }
    
    func retriveDataList() {
        WebServices.shared.getAllMovies(page: page) { moviewModelResponse, _ in
            if let moviewModelResponse = moviewModelResponse {
                self.moviesArray = moviewModelResponse
            }
        }
    }
    
    var voteAverageString: String {
        return "\(movieModel.vote_average ?? 0.0)"
    }
    
    var imageMoviewURL: URL? {
        return URL(string:  Constants.IMAGE_URL + movieModel.poster_path)
    }
    
    var nextPageIsEnabled: Bool {
        var currentPage = page
        if currentPage < (moviesArray.total_pages ?? 0) + 1 {
            currentPage = currentPage + 1
            self.page = currentPage
            return true
        }
        return false
    }
    
}
