//
//  MoviewViewModel.swift
//  DaCodesMovies
//
//  Created by Jonathan Rivera Misael on 15/10/20.
//

import Foundation

class MoviewViewModel {
    
    var movieModel: MovieModel
    
    init(movieModel: MovieModel) {
        self.movieModel = movieModel
    }
    
    var refreshData = { () -> () in }
    
    var moviesArray: MoviewModelResponse = MoviewModelResponse() {
        didSet {
            refreshData()
        }
    }
    
    func retriveDataList() {
        
        WebService.shared.load(resource: MovieModel.allMoviews) { [weak self] result in
            switch result {
            case .success(let response):
                self?.moviesArray = response
            case .failure(let error):
                print(error)
            }
        }
    }
    
    var voteAverageString: String {
        return "\(movieModel.vote_average ?? 0.0)"
    }
    
    var imageMoviewURL: URL? {
        return URL(string:  Constants.IMAGE_URL + movieModel.poster_path)
    }
}
