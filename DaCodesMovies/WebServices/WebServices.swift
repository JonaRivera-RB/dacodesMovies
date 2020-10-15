//
//  WebServices.swift
//  DaCodesMovies
//
//  Created by Jonathan Rivera Misael on 15/10/20.
//

import Foundation

struct WebServices {
    static let shared = WebServices()
    
    let getRequest = GetDataHttp()
    
    func getAllMovies(page: Int?, _ completion: @escaping (_ moviewModelResponse: MoviewModelResponse?, _ error: Error?) -> () ) {
        getRequest.url = URL(string: "\(Constants.URL)?api_key=\(Constants.API_KEY)&language=es-MX&page=\(page ?? 1)")
        getRequest.header = false
        getRequest.forData { (data, error, success) in
            if success {
                if let data = data, let movieModelResponse = DataFetcher<MoviewModelResponse>().getData(data: data) {
                    completion(movieModelResponse, nil)
                    return
                }
            }else {
                completion(nil, error)
                return
            }
            completion(nil, error)
        }
    }
    
    func getDetailOfMoview(movieID: String, _ completion: @escaping (_ detailMovieModel: DetailMovieModel?, _ error: Error?) -> () ) {
        
        getRequest.url = URL(string: "\(Constants.URL_DETAIL)\(movieID)?api_key=\(Constants.API_KEY)&language=es-MX")
        getRequest.header = false
        getRequest.forData { (data, error, success) in
            if success {
                if let data = data, let detailMoviewModel = DataFetcher<DetailMovieModel>().getData(data: data) {
                    completion(detailMoviewModel, nil)
                    return
                }
            }else {
                completion(nil, error)
                return
            }
            completion(nil, error)
        }
        
    }
}
