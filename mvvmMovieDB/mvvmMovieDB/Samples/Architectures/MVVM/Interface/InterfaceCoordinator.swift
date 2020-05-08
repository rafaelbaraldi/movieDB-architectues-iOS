//
//  SettersCoordinator.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 22/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit

class InterfaceCoordinator: SampleCollectionCoordinator, Coordinator {
    func start(from originViewController: UIViewController) {
        
        let provider = SampleProvider.shared
        let service = SampleService(provider: provider)
        let viewModel = InterfaceSampleCollectionViewModel(service: service)
        let viewController = InterfaceSampleCollectionViewController(viewModel: viewModel)
        viewModel.view = viewController
        viewController.coordinatorDelegate = self
        
        originViewController.show(viewController, sender: self)
    }
}
