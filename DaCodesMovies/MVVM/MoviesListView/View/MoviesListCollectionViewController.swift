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
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        configureNavigationController()
    }
    
    // initialized with a non-nil layout parameter
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
    
    private func configureNavigationController() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.title = "DaCodesMovies"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

//MARK: - DataSource
extension  MoviesListCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: REUSE_IDENTIFIER, for: indexPath) as? MovieCell else { fatalError() }
        
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension MoviesListCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let nbCol = 2
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let totalSpace = flowLayout.sectionInset.left + flowLayout.sectionInset.right + (flowLayout.minimumInteritemSpacing * CGFloat(nbCol - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(nbCol))
        return CGSize(width: size, height: 300)
    }
    
}

