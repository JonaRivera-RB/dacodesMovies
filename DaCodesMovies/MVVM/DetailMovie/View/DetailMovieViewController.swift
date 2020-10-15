//
//  DetailMovieViewController.swift
//  DaCodesMovies
//
//  Created by Jonathan Rivera Misael on 15/10/20.
//

import Foundation
import UIKit

class DetailMovieViewController: UIViewController {
    
    //MARK: - Properties
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        
        return scrollView
    }()
    
    private var movieImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        return image
    }()
    
    private var movieNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.text = "Cargando..."
        return label
    }()
    
    private var durationMovieLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 2
        label.text = "Duración:"
        return label
    }()
    
    private var durationMovieMinutesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 2
        label.text = "Cargando..."
        return label
    }()
    
    private var dateMovieLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 2
        label.text = "Fecha de estreno:"
        return label
    }()
    
    private var dateMovieTwoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 2
        label.text = "Cargando..."
        return label
    }()
    
    private var raitingMovieLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 2
        label.text = "Calificación:"
        return label
    }()
    
    private var raitingMovieTwoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 2
        label.text = "Cargando..."
        return label
    }()
    private var genresMovieLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 2
        label.text = "Género"
        return label
    }()
    
    private var genresMovieTwoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 2
        label.text = "Cargando..."
        return label
    }()
    
    private var descriptionMovieLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 2
        label.text = "Descripción:"
        return label
    }()
    
    private var descriptionMovieTwoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 20
        label.text = "Cargando..."
        return label
    }()
    
    private var detailMovieViewModel: DetaiMovielViewModel? {
        didSet {
            detailMovieViewModel?.id = movieID
            detailMovieViewModel?.retriveDataList()
            bind()
        }
    }
    
    private var movieID: String
    
    
    //MARK: - Lifecycle
    init(movieID: String) {
        self.movieID = movieID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        configureNavigationBarInViewController(largeTitleColor: .blue, backgoundColor: .white, tintColor: .blue, title: "Descripción", preferredLargeTitle: true)
        
        detailMovieViewModel = DetaiMovielViewModel(detailMovieModel: DetailMovieModel())
    }
    
    private func setupUI() {
        
        view.addSubview(scrollView)
        scrollView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        scrollView.addSubview(movieImageView)
        movieImageView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, right: scrollView.rightAnchor, width: UIScreen.main.bounds.size.width, height: 250)
        
        scrollView.addSubview(movieNameLabel)
        movieNameLabel.anchor(top: movieImageView.bottomAnchor, left: movieImageView.leftAnchor, right: movieNameLabel.rightAnchor, paddingTop: 20, paddingLeft: 10, paddingRight: 10)
        
        let stackDuration = UIStackView(arrangedSubviews: [durationMovieLabel, durationMovieMinutesLabel])
        stackDuration.axis = .vertical
        stackDuration.spacing = 2
        stackDuration.distribution = .equalSpacing
        
        let stackPremiere = UIStackView(arrangedSubviews: [dateMovieLabel, dateMovieTwoLabel])
        stackPremiere.axis = .vertical
        stackPremiere.spacing = 2
        stackPremiere.distribution = .equalSpacing
        
        let stackRaiting = UIStackView(arrangedSubviews: [raitingMovieLabel, raitingMovieTwoLabel])
        stackRaiting.axis = .vertical
        stackRaiting.spacing = 2
        stackRaiting.distribution = .equalSpacing
        
        let stackGenres = UIStackView(arrangedSubviews: [genresMovieLabel, genresMovieTwoLabel])
        stackGenres.axis = .vertical
        stackGenres.spacing = 2
        stackGenres.distribution = .equalSpacing
        
        let stackDescription = UIStackView(arrangedSubviews: [descriptionMovieLabel, descriptionMovieTwoLabel])
        stackDescription.axis = .vertical
        stackDescription.spacing = 2
        stackDescription.distribution = .equalSpacing
        
        let mainStack = UIStackView(arrangedSubviews: [stackDuration, stackPremiere, stackRaiting, stackGenres, stackDescription])
        mainStack.axis = .vertical
        mainStack.spacing = 20
        mainStack.distribution = .equalSpacing
        
        scrollView.addSubview(mainStack)
        mainStack.anchor(top: movieNameLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, paddingTop: 2, paddingLeft: 10, paddingRight: 10)
    }
    
    //MARK: - Helpers
    private func bind() {
        
        detailMovieViewModel?.refreshData = { [weak self] () in
            DispatchQueue.main.async {
                self?.setupLabels()
            }
        }
    }
    
    private func setupLabels() {
        guard let viewModel = detailMovieViewModel else { return }
        
        movieImageView.sd_setImage(with: viewModel.urlImage, completed: nil)
        movieNameLabel.text = viewModel.movieName
        durationMovieMinutesLabel.text = viewModel.runtime
        dateMovieTwoLabel.text = viewModel.release_date
        raitingMovieTwoLabel.text = viewModel.vote_average
        genresMovieTwoLabel.text = viewModel.genres
        descriptionMovieTwoLabel.text = viewModel.overview
    }
}
