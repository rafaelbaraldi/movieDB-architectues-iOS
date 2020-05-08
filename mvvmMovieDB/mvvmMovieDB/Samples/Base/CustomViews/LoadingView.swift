//
//  LoadingView.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 22/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    // MARK: - Views
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView.init(style: .white)
        activity.hidesWhenStopped = true
        activity.startAnimating()
        activity.translatesAutoresizingMaskIntoConstraints = false
        return activity
    }()
    
    // MARK: - Initialization
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    // MARK: - Private functions
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.init(white: 0.5, alpha: 0.5)
        pin(activityIndicator)
    }
    
    // MARK: - Public functions
    func stop() {
        removeFromSuperview()
    }
    
    // MARK: - Static Functions
    static func start(in view: UIView) -> LoadingView {
        let loadingView = LoadingView()
        view.pin(loadingView)
        return loadingView
    }
}
