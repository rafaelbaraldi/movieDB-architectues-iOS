//
//  SampleDetailViewController.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 07/05/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit

class SampleDetailViewController: UIViewController {
    
    // MARK: Views
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, imageView])
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.textColor = .white
        return title
    }()
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    // MARK: - Properties
    var movie: Movie
    
    // MARK: - Constructors
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    func setup() {
        setupViews()
        setupMovie()
    }
    func setupViews() {
        view.pin(stackView)
    }
    func setupMovie() {
        titleLabel.text = movie.title
        view.setImagePath(movie.posterPath, imageView: &imageView)
    }
}
