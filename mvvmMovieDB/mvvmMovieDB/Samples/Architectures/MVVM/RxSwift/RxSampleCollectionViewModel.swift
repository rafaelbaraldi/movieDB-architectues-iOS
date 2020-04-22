//
//  File.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 17/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit
import RxCocoa

class RxSampleCollectionViewModel {
    
    // MARK: Properties
    var service: SampleServicerPotocol
    var movies: Driver<[Movie]>
    
    // MARK: - Constructors
    init(service: SampleServicerPotocol) {
        self.service = service
        movies = Driver.from([])
    }
    
    
}
