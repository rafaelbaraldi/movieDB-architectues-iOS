//
//  InterfaceSampleCollectionViewModel.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 22/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import Foundation

protocol VIPSampleCollectionPresenterProtocol {
    func presentMovies(movies: [Movie])
    func presentError(error: Error)
    
    func presentLoading()
    func hideLoading()
}

class VIPSampleCollectionPresenter: VIPSampleCollectionPresenterProtocol {
    
    // MARK: - Properties
    weak var view: VIPSampleCollectionViewControllerProtocol?
    
    // MARK: - Implementation
    func presentMovies(movies: [Movie]) {
        view?.displayMovies(movies: movies)
    }
    
    func presentError(error: Error) {
        view?.displayError(error: error)
    }
    
    func presentLoading() {
        view?.displayLoading()
    }
    
    func hideLoading() {
        view?.hideLoading()
    }
}
