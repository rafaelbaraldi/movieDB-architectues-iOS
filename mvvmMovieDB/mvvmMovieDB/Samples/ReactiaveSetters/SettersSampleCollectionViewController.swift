//
//  CallbackSampleCollectionViewController.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 17/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit

private let reuseIdentifier = "callbackSampleCollectionCell"

class SettersSampleCollectionViewController: UICollectionViewController {

    // MARK: Properties
    var viewModel: SettersSampleCollectionViewModel {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: - Contructors
    init() {
        let provider = SampleProvider()
        viewModel = SettersSampleCollectionViewModel(provider: provider)
        let flowLayout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: flowLayout)
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

        collectionView?.register(MovieCollectionViewCell.self,
                                 forCellWithReuseIdentifier: reuseIdentifier)
        
        viewModel.fetchMovies()
    }
}

extension SettersSampleCollectionViewController: UICollectionViewDelegateFlowLayout {

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as? MovieCollectionViewCell
    
        let movie = viewModel.movies[indexPath.row]
        cell?.setImagePath(movie.posterPath)
    
        return cell ?? UICollectionViewCell()
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 185, height: 277)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
