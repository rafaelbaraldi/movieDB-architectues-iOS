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
    var controller: (() -> UIViewController)
    
    
    // MARK: - Constructors
    init(name: String,
         controller: @autoclosure @escaping (() -> UIViewController)) {
        self.name = name
        self.controller = controller
    }
    
    // MARK: - List
    static let list: [Sample] = [
        .init(name: "RxSwift", controller: UIViewController()),
        .init(name: "Reactiave Setters", controller: SettersSampleCollectionViewController()),
        .init(name: "Callback", controller: UIViewController()),
        .init(name: "Interface", controller: UIViewController()),
        .init(name: "SwiftUI+Combine", controller: UIViewController())
    ]
}
