//
//  InterfaceSampleCollectionViewController.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 22/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit

protocol VIPSampleCollectionViewControllerProtocol: class {
    func displayMovies(movies: [Movie])
    func displayError(error: Error)
    
    func displayLoading()
    func hideLoading()
}

class VIPSampleCollectionViewController: SampleCollectionViewController {

    // MARK: Properties
    var interactor: VIPSampleCollectionInteractorProtocol
    var viewModel: [Movie] = []
    
    // MARK: - Contructors
    init(interactor: VIPSampleCollectionInteractorProtocol) {
        self.interactor = interactor
        super.init()
        title = "Interface"
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.fetchMovies()
    }
    
    // MARK: - Override BaseSampleCollectionViewController
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return viewModel.count
    }
    override func collectionView(_ collectionView: UICollectionView,
                                 movieForItemAt indexPath: IndexPath) -> Movie? {
        return viewModel[indexPath.row]
    }
}

extension VIPSampleCollectionViewController: VIPSampleCollectionViewControllerProtocol {
    func displayMovies(movies: [Movie]) {
        viewModel = movies
        collectionView.reloadData()
    }
}
