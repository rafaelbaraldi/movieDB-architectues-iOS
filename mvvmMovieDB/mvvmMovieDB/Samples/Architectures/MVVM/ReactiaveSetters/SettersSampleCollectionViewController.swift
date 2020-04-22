//
//  CallbackSampleCollectionViewController.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 17/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit

class SettersSampleCollectionViewController: SampleCollectionViewController {

    // MARK: Properties
    var viewModel: SettersSampleCollectionViewModel {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: - Contructors
    init(viewModel: SettersSampleCollectionViewModel) {
        self.viewModel = viewModel
        super.init()
        title = "Reactiave Setters"
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchMovies()
    }
}

// MARK: - Override BaseSampleCollectionViewController
extension SettersSampleCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView,
                                        cellForItemAt: indexPath) as? MovieCollectionViewCell
    
        let movie = viewModel.movies[indexPath.row]
        cell?.setImagePath(movie.posterPath)
    
        return cell ?? UICollectionViewCell()
    }
}
