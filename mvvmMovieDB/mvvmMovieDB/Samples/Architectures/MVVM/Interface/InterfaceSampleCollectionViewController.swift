//
//  InterfaceSampleCollectionViewController.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 22/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit

protocol InterfaceSampleCollectionViewControllerProtocol: class {
    func displayMovies(movies: [Movie])
    func displayError(error: Error)
    
    func displayLoading()
    func hideLoading()
}

class InterfaceSampleCollectionViewController: SampleCollectionViewController {

    // MARK: Properties
    var viewModel: InterfaceSampleCollectionViewModelProtocol
    
    // MARK: - Contructors
    init(viewModel: InterfaceSampleCollectionViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
        title = "Interface"
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

extension InterfaceSampleCollectionViewController: InterfaceSampleCollectionViewControllerProtocol {
    func displayMovies(movies: [Movie]) {
        collectionView.reloadData()
    }
}

// MARK: - Override BaseSampleCollectionViewController
extension InterfaceSampleCollectionViewController {
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
