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

class RxSampleCollectionViewController: UICollectionViewController {

    // MARK: Properties
    var viewModel: RxSampleCollectionViewModel
    private let bag = DisposeBag()
    
    // MARK: - Contructors
    init(viewModel: RxSampleCollectionViewModel) {
        self.viewModel = viewModel
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 185, height: 277)
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        super.init(collectionViewLayout: flowLayout)
        title = "Reactiave Setters"
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
