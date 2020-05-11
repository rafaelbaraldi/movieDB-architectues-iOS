//
//  Sample.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 17/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit

struct Architecture {
    
    // MARK: - Properties
    var name: String
    var samples: [Sample]
    
    // MARK: - List
    static let list: [Architecture] = [
        .init(name: "MVVM", samples: Sample.mvvmList),
        .init(name: "Clean Swift", samples: Sample.vipList)
    ]
}

struct Sample {
    
    // MARK: - Properties
    var name: String
    var coordinator: (() -> Coordinator?)
    
    
    // MARK: - Constructors
    init(name: String,
         coordinator: @autoclosure @escaping (() -> Coordinator?) = nil) {
        self.name = name
        self.coordinator = coordinator
    }
    
    // MARK: - Lists
    static let mvvmList: [Sample] = [
        .init(name: "Interface", coordinator: InterfaceCoordinator()),
        .init(name: "InOut", coordinator: InOutCoordinator()),
        .init(name: "Callback", coordinator: CallbackCoordinator()),
        .init(name: "RxSwift", coordinator: RxCoordinator()),
        .init(name: "Setters", coordinator: SettersCoordinator()),
//        .init(name: "Combine")
    ]
    
    
    static let vipList: [Sample] = [
        .init(name: "VIP", coordinator: VIPRouter())
    ]
}
