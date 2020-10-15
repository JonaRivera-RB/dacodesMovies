//
//  ViewController.swift
//  DaCodesMovies
//
//  Created by Jonathan Rivera Misael on 15/10/20.
//  Copyright © 2020 Misael Rivera. All rights reserved.
//

import UIKit

private let REUSE_IDENTIFIER = "moviewIdentifier"
class MoviesListCollectionViewController: UICollectionViewController {
    
    //MARK: -Properties
    private var moviesViewModel = MoviewViewModel(movieModel: MovieModel())
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        
        configureNavigationBar(largeTitleColor: .blue, backgoundColor: .white, tintColor: .blue, title: AppConstants.navigationTitleHome, preferredLargeTitle: true)
        
        moviesViewModel.retriveDataList()
        bind()
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    private func configureCollectionView() {
        view.backgroundColor = .white
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: REUSE_IDENTIFIER)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func bind() {
        moviesViewModel.refreshData = { [weak self] () in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
}

//MARK: - DataSource
extension  MoviesListCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesViewModel.moviesArray.results.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: REUSE_IDENTIFIER, for: indexPath) as? MovieCell else { fatalError() }
        
        cell.movieModel = moviesViewModel.moviesArray.results[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = DetailMovieViewController(movieID: String(moviesViewModel.moviesArray.results[indexPath.row].id))
        navigationController?.pushViewController(controller, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if indexPath.row == moviesViewModel.moviesArray.results.count - 1 &&  moviesViewModel.moviesArray.results.count < moviesViewModel.moviesArray.total_results ?? 0 {
            if moviesViewModel.nextPageIsEnabled {
                moviesViewModel.retriveDataList()
                bind()
            }
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension MoviesListCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columns = 2
        
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { fatalError() }
        
        let totalSpace = flowLayout.sectionInset.left + flowLayout.sectionInset.right + (flowLayout.minimumInteritemSpacing * CGFloat(columns - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(columns))
        
        return CGSize(width: size, height: 300)
    }
    
}

