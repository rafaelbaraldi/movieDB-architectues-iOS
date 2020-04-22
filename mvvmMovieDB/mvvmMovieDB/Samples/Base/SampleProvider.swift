//
//  SampleProvider.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 22/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import Foundation
import SimpleConnector

// MARK: - Constants
let apiBaseURL        = "http://api.themoviedb.org/3/movie"

class SampleProvider: RESTConnector {
    
    // MARK: - Singleton
    static let shared = SampleProvider()
    
    // MARK: - Constructors
    override init(baseURL: String = apiBaseURL,
                  timeoutInterval: TimeInterval = 60.0,
                  pinningCertificates: [HTTPPinningCertificate] = []) {
        super.init(baseURL: baseURL,
                   timeoutInterval: timeoutInterval,
                   pinningCertificates: pinningCertificates)
    }
}
