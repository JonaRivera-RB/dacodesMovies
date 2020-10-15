//
//  MoviewViewModel.swift
//  DaCodesMovies
//
//  Created by Jonathan Rivera Misael on 15/10/20.
//

import Foundation

class MoviewViewModel {
    
    var movieModel: MoviewModel
    
    init(movieModel: MoviewModel) {
        self.movieModel = movieModel
    }
    
    var refreshData = { () -> () in }
    
    var moviesArray: MoviewModelResponse = MoviewModelResponse() {
        didSet {
            refreshData()
        }
    }
    
    func retriveDataList() {
        
        WebService.shared.load(resource: MoviewModel.allMoviews) { [weak self] result in
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
}
