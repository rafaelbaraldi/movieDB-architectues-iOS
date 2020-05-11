//
//  SettersCoordinator.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 22/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit

class VIPRouter: SampleCollectionCoordinator, Coordinator {
    func start(from originViewController: UIViewController) {
        
        let presenter = VIPSampleCollectionPresenter()
        let provider = SampleProvider.shared
        let service = SampleService(provider: provider)
        let interactor = VIPSampleCollectionInteractor(service: service, presenter: presenter)
        let viewController = VIPSampleCollectionViewController(interactor: interactor)
        presenter.view = viewController
        viewController.coordinatorDelegate = self
        
        originViewController.show(viewController, sender: self)
    }
}
