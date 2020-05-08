//
//  CallbackSampleCollectionViewController.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 17/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit

private let reuseIdentifier = "sampleCollectionCell"

class SampleCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    var loadingView: LoadingView?
    
    // MARK: - Contructors
    init() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 185, height: 277)
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        super.init(collectionViewLayout: flowLayout)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(MovieCollectionViewCell.self,
                                 forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    // MARK: - Loading
    func displayLoading() {
        loadingView = LoadingView.start(in: view)
    }
    func hideLoading() {
        loadingView?.stop()
    }
    
    // MARK: Custom Collection Item Datasource
    func collectionView(_ collectionView: UICollectionView,
                        movieForItemAt indexPath: IndexPath) -> Movie? {
        return nil
    }
}

extension SampleCollectionViewController: UICollectionViewDelegateFlowLayout {

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as? MovieCollectionViewCell
        
        if let movie = self.collectionView(collectionView, movieForItemAt: indexPath) {
           cell?.setImagePath(movie.posterPath)
        }
        
        return cell ?? UICollectionViewCell()
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }

}

// MARK: - Base Extension
extension UIViewController {
    func displayError(error: Error) {
        let alertController = UIAlertController(title: "Error",
                                                message: error.localizedDescription,
                                                preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(alertAction)
        
        present(alertController, animated: true)
    }
}
