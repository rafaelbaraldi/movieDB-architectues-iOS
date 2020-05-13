//
//  CallbackCoordinator.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 22/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit

class InterfaceInOutCoordinator: SampleCollectionCoordinator, Coordinator {
    func start(from originViewController: UIViewController) {
        
        let provider = SampleProvider.shared
        let service = SampleService(provider: provider)
        let viewModel = InterfaceInOutSampleCollectionViewModel(service: service)
        let viewController = InterfaceInOutSampleCollectionViewController(viewModel: viewModel)
        viewModel.output = viewController
        viewController.coordinatorDelegate = self
        
        originViewController.show(viewController, sender: self)
    }
}
