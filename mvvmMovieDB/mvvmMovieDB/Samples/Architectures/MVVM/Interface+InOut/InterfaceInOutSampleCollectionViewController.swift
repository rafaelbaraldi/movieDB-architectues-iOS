//
//  InterfaceSampleCollectionViewController.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 22/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit

class InterfaceInOutSampleCollectionViewController: SampleCollectionViewController {

    // MARK: Properties
    var viewModel: InterfaceInOutSampleCollectionViewModelInput
    var moviesViewData: [Movie] = []
    
    // MARK: - Contructors
    init(viewModel: InterfaceInOutSampleCollectionViewModelInput) {
        self.viewModel = viewModel
        super.init()
        title = "Interface+InOut"
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchMovies()
    }
    
    
    // MARK: - Override BaseSampleCollectionViewController
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return moviesViewData.count
    }
    override func collectionView(_ collectionView: UICollectionView,
                                 movieForItemAt indexPath: IndexPath) -> Movie? {
        return moviesViewData[indexPath.row]
    }
}

extension InterfaceInOutSampleCollectionViewController: InterfaceInOutSampleCollectionViewModelOutput {
    func displayMovies(_ movies: [Movie]) {
        moviesViewData = movies
        collectionView.reloadData()
    }
}
