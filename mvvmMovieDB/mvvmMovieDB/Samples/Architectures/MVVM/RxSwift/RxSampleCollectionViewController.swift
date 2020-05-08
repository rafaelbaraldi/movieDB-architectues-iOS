//
//  CallbackSampleCollectionViewController.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 17/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

private let reuseIdentifier = "RxSampleCollectionCell"

class RxSampleCollectionViewController: SampleCollectionViewController {

    // MARK: Properties
    var viewModel: RxSampleCollectionViewModel
    private let bag = DisposeBag()
    
    // MARK: - Contructors
    init(viewModel: RxSampleCollectionViewModel) {
        self.viewModel = viewModel
        super.init()
        title = "RxSwift"
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = nil
        collectionView.dataSource = nil
        collectionView?.register(MovieCollectionViewCell.self,
                                 forCellWithReuseIdentifier: reuseIdentifier)
        
        bindViews()
        viewModel.fetchMovies()
    }
    
    // MARK: - Bind View
    func bindViews() {
        viewModel.movies.bind(to: collectionView.rx.items(cellIdentifier: reuseIdentifier,
                                                          cellType: MovieCollectionViewCell.self)) { (_, element, cell) in
                                                            cell.setImagePath(element.posterPath)
        }.disposed(by: bag)
    }
}
