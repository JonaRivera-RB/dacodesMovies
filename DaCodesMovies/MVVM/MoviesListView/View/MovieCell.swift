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
    private lazy var moviewImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        
        return image
    }()
    
    private var shadowView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        return view
    }()
    
    private var moviewNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.text = "Terminator destino oscuro"
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
        
        addSubview(moviewImageView)
        
        moviewImageView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingLeft: 5, paddingRight: 5)
        
        moviewImageView.addSubview(shadowView)
        
        shadowView.anchor(left: moviewImageView.leftAnchor, bottom: moviewImageView.bottomAnchor, right: moviewImageView.rightAnchor, height: 80)
        
        shadowView.addSubview(moviewNameLabel)
        
        moviewNameLabel.anchor(top: shadowView.topAnchor, left: shadowView.leftAnchor, right: shadowView.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingRight: 10)
        
        let stack = UIStackView(arrangedSubviews: [releaseDateLabel, raitingLabel])
        stack.axis = .horizontal
        stack.spacing = 2
        stack.distribution = .equalSpacing
        
        shadowView.addSubview(stack)
        stack.anchor(top: moviewNameLabel.bottomAnchor, left: shadowView.leftAnchor, bottom: shadowView.bottomAnchor, right: shadowView.rightAnchor, paddingTop: 2, paddingLeft: 10, paddingBottom: 7, paddingRight: 10)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
