//
//  MovieCollectionViewCell.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 18/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit
import SDWebImage

// MARK: - Constants
let moviePlaceholderImageName = "PosterPlaceholder"
let movieCoverBaseURL = "http://image.tmdb.org/t/p/original"

class MovieCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Views
    private lazy var movieImage: UIImageView = {
        let movieImage = UIImageView(image: UIImage(named: moviePlaceholderImageName))
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        return movieImage
    }()
    
    // MARK: - Initialization
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    // MARK: - Private functions
    private func setup() {
        pin(movieImage)
    }
    
    // MARK: - Internal functions
    func setImagePath(_ imagePath: String?) {
        setImagePath(imagePath, imageView: &movieImage)
    }
}
