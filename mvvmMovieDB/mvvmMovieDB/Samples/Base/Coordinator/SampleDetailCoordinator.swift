//
//  SampleDetailCoordinator.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 07/05/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit

struct SampleDetailCoordinator: Coordinator {
    
    // MARK: - Properties
    var movie: Movie
    
    // MARK: - Coordinator
    func start(from originViewController: UIViewController) {
        
        let viewController = SampleDetailViewController(movie: movie)
        originViewController.show(viewController, sender: self)
    }
}
