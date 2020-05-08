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
            bindViewModel()
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
        bindViewModel()
        viewModel.fetchMovies()
    }
    
    // MARK: - Bind View Model
    func bindViewModel() {
        viewModel.movies.bind = { [weak self] _ in
            self?.collectionView.reloadData()
        }
        viewModel.error.bind = { [weak self] error in
            self?.displayError(error: error!)
        }
    }

    // MARK: - Override BaseSampleCollectionViewController
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return viewModel.movies.value.count
    }
    override func collectionView(_ collectionView: UICollectionView,
                                 movieForItemAt indexPath: IndexPath) -> Movie? {
        return viewModel.movies.value[indexPath.row]
    }
}
