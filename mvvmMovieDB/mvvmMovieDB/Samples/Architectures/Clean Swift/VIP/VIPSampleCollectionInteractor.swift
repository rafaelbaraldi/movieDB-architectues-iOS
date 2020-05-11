//
//  InterfaceSampleCollectionViewModel.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 22/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import Foundation

protocol VIPSampleCollectionInteractorProtocol {
    func fetchMovies()
}

class VIPSampleCollectionInteractor: VIPSampleCollectionInteractorProtocol {
    
    // MARK: - Properties
    var presenter: VIPSampleCollectionPresenterProtocol?
    var service: SampleServicerPotocol
    
    // MARK: - Constructors
    init(service: SampleServicerPotocol,
         presenter: VIPSampleCollectionPresenterProtocol) {
        self.service = service
        self.presenter = presenter
    }
    
    // MARK: - Implementation
    func fetchMovies() {
        presenter?.presentLoading()
        service.fetchMovies { [weak self] (movies, error) in
            self?.presenter?.hideLoading()
            if let error = error {
                self?.presenter?.presentError(error: error)
                return
            }
            if let movies = movies {
                self?.presenter?.presentMovies(movies: movies)
            }
        }
    }
}
