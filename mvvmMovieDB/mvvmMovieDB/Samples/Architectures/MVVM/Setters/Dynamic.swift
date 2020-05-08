//
//  Dynamic.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 07/05/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import Foundation

class Dynamic<T> {
    
    // MARK: Properties
    var bind :(T) -> () = { _ in }
    var value :T { didSet { bind(value) } }
    
    // MARK: - Constructor
    init(_ v :T) {
        value = v
    }
}
