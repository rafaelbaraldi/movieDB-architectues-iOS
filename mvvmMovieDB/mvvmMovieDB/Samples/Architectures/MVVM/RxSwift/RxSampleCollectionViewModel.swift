//
//  File.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 17/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RxSampleCollectionViewModel {
    
    // MARK: Properties
    var service: SampleServicerPotocol
    var movies: PublishSubject<[Movie]> = PublishSubject()
    
    // MARK: - Constructors
    init(service: SampleServicerPotocol) {
        self.service = service
    }
    
    func fetchMovies() {
        service.fetchMovies { (movies, error) in
            if let movies = movies {
                self.movies.onNext(movies)
            }
        }
    }
}
