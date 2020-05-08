//
//  SampleCollectionCoordinator.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 07/05/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit

class SampleCollectionCoordinator: SampleCollectionViewControllerDelegate {
    func showMovieDetails(_ viewController: SampleCollectionViewController, movie: Movie) {
        let coordinator = SampleDetailCoordinator(movie: movie)
        coordinator.start(from: viewController)
    }
}
