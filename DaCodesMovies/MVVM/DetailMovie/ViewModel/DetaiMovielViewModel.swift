//
//  DetaiMovielViewModel.swift
//  DaCodesMovies
//
//  Created by Jonathan Rivera Misael on 15/10/20.
//

import Foundation

class DetaiMovielViewModel {
    var detailMovieModel: DetailMovieModel
    var id = ""
    
    init(detailMovieModel: DetailMovieModel) {
        self.detailMovieModel = detailMovieModel
    }
    
    var refreshData = { () -> () in }
    
    var movieDetail = DetailMovieModel() {
        didSet {
            refreshData()
        }
    }
    
    func retriveDataList() {
        WebServices.shared.getDetailOfMoview(movieID: id) { (detailMovieModel, _) in
            if let detailMovieModel = detailMovieModel {
                self.movieDetail = detailMovieModel
            }
        }
    }
    
    var movieName: String {
        return movieDetail.original_title ?? ""
    }
    
    var runtime: String {
        return "\(movieDetail.runtime ?? 0) min"
    }
    
    var vote_average: String {
        return "\(movieDetail.vote_average ?? 0.0)"
    }
    
    var genres: String {
        var genres = ""
        
        guard let genresArray = movieDetail.genres else { return "Sin Género" }
        
        for index in genresArray {
            genres += "\(index.name ?? "") "
        }
        
        return genres
    }
    
    var overview: String {
        return movieDetail.overview ?? "Sin descripción"
    }
    
    var urlImage: URL? {
        let urlImage = movieDetail.backdrop_path ?? ""
        return URL(string: Constants.IMAGE_URL + urlImage)
    }
    
    var release_date: String {
        guard let dateString = movieDetail.release_date else { return "" }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = dateFormatter.date(from: dateString) else { return "" }
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd MMM yyyy"
        
        return dateFormatterPrint.string(from: date)
        
    }
}
