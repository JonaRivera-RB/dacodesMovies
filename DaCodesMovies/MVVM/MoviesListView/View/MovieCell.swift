//
//  MovieCell.swift
//  DaCodesMovies
//
//  Created by Jonathan Rivera Misael on 15/10/20.
//  Copyright © 2020 Misael Rivera. All rights reserved.
//

import Foundation
import UIKit

class MovieCell: UICollectionViewCell {
    
    //MARK:-Properties
    var movieModel: MoviewModel? {
        didSet {
            configure()
        }
    }
    
    private lazy var movieImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        
        return image
    }()
    
    private var shadowView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return view
    }()
    
    private var movieNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 2
        return label
    }()
    
    private var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .white
        label.text = "20 enero 1998"
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 1
        return label
    }()
    
    private var raitingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .white
        label.text = "5.0"
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 1
        return label
    }()
    
    
    //MARK:- Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(movieImageView)
        
        movieImageView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingLeft: 5, paddingRight: 5)
        
        movieImageView.addSubview(shadowView)
        
        shadowView.anchor(left: movieImageView.leftAnchor, bottom: movieImageView.bottomAnchor, right: movieImageView.rightAnchor, height: 80)
        
        shadowView.addSubview(movieNameLabel)
        
        movieNameLabel.anchor(top: shadowView.topAnchor, left: shadowView.leftAnchor, right: shadowView.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingRight: 10)
        
        let stack = UIStackView(arrangedSubviews: [releaseDateLabel, raitingLabel])
        stack.axis = .horizontal
        stack.spacing = 2
        stack.distribution = .equalSpacing
        
        shadowView.addSubview(stack)
        stack.anchor(top: movieNameLabel.bottomAnchor, left: shadowView.leftAnchor, bottom: shadowView.bottomAnchor, right: shadowView.rightAnchor, paddingTop: 2, paddingLeft: 10, paddingBottom: 7, paddingRight: 10)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    private func configure() {
        guard let movieModel = movieModel else { return }
        
        let viewModel = MoviewViewModel(movieModel: movieModel)
        
        movieNameLabel.text = movieModel.title
        releaseDateLabel.text = movieModel.release_date
        raitingLabel.text = viewModel.voteAverageString
    }
}
