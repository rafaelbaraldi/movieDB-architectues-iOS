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
}

class InterfaceSampleCollectionViewController: SampleCollectionViewController {

    // MARK: Properties
    var viewModel: InterfaceSampleCollectionViewModelProtocol
    
    // MARK: - Contructors
    override init() {
        let provider = SampleProvider()
        viewModel = InterfaceSampleCollectionViewModel(view: self, provider: provider)
        super.init()
        title = "Reactiave Setters"
    }
    required init?(coder: NSCoder) {
        let provider = SampleProvider()
        viewModel = InterfaceSampleCollectionViewModel(view: self, provider: provider)
        super.init(coder: coder)
        title = "Reactiave Setters"
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
