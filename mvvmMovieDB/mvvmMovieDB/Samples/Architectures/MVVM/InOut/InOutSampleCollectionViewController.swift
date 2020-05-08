//
//  InterfaceSampleCollectionViewController.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 22/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit

class InOutSampleCollectionViewController: SampleCollectionViewController {

    // MARK: Properties
    var viewModel: InOutSampleCollectionViewModelProtocol
    
    // MARK: - Contructors
    init(viewModel: InOutSampleCollectionViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
        title = "InOut"
        bindViewModel()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.input.fetchMovies()
    }
}

// MARK: - Bind View Model
extension InOutSampleCollectionViewController {
    
    func bindViewModel() {
        viewModel.output.displayErrorMessage = displayError
        viewModel.output.displayMovies = displayMovies
    }
    func displayMovies(_ movies: [Movie]) {
        collectionView.reloadData()
    }
}

// MARK: - Override BaseSampleCollectionViewController
extension InOutSampleCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return viewModel.dataStore.movies.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView,
                                        cellForItemAt: indexPath) as? MovieCollectionViewCell
    
        let movie = viewModel.dataStore.movies[indexPath.row]
        cell?.setImagePath(movie.posterPath)
    
        return cell ?? UICollectionViewCell()
    }
}
