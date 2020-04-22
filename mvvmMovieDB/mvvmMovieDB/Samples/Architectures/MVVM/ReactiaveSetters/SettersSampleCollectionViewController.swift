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
    override init() {
        let provider = SampleProvider()
        viewModel = SettersSampleCollectionViewModel(provider: provider)
        super.init()
        title = "Reactiave Setters"
    }
    required init?(coder: NSCoder) {
        let provider = SampleProvider()
        viewModel = SettersSampleCollectionViewModel(provider: provider)
        super.init(coder: coder)
        title = "Reactiave Setters"
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
