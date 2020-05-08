//
//  CallbackCoordinator.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 22/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit

class InOutCoordinator: Coordinator {
    func start(from originViewController: UIViewController) {
        
        let provider = SampleProvider.shared
        let service = SampleService(provider: provider)
        let viewModel = InOutSampleCollectionViewModel(service: service)
        let viewController = InOutSampleCollectionViewController(viewModel: viewModel)
        
        originViewController.show(viewController, sender: self)
    }
}
