//
//  InterfaceSampleCollectionViewController.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 22/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit

protocol CallbackSampleCollectionViewControllerProtocol: class {
    func displayMovies(movies: [Movie])
    func displayError(error: Error)
    
    func displayLoading()
    func hideLoading()
}

class CallbackSampleCollectionViewController: SampleCollectionViewController {

    // MARK: Properties
    var viewModel: CallbackSampleCollectionViewModelProtocol
    
    // MARK: - Contructors
    init(viewModel: CallbackSampleCollectionViewModelProtocol) {
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
        
        displayLoading()
        viewModel.fetchMovies(
            success: { [weak self] _ in
                self?.hideLoading()
                self?.collectionView.reloadData()
            },
            failure: { [weak self] error in
                self?.hideLoading()
                self?.displayError(error: error)
            })
    }
}

// MARK: - Override BaseSampleCollectionViewController
extension CallbackSampleCollectionViewController {
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
