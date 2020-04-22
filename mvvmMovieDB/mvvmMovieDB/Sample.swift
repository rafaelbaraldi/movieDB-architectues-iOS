//
//  Sample.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 17/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit

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
    
    // MARK: - List
    static let list: [Sample] = [
        .init(name: "RxSwift", coordinator: RxCoordinator()),
        .init(name: "Reactiave Setters", coordinator: SettersCoordinator()),
        .init(name: "Callback", coordinator: CallbackCoordinator()),
        .init(name: "Interface", coordinator: InterfaceCoordinator()),
        .init(name: "SwiftUI+Combine")
    ]
}
