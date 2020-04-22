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
        LoadingView.pin(subview: activityIndicator, at: self)
    }
    
    // MARK: - Public functions
    func stop() {
        removeFromSuperview()
    }
    
    // MARK: - Static Functions
    static func start(in view: UIView) -> LoadingView {
        let loadingView = LoadingView()
        LoadingView.pin(subview: loadingView, at: view)
        return loadingView
    }
    private static func pin(subview: UIView, at superview: UIView) {
        superview.addSubview(subview)
        
        let leadingConstraint = subview.leadingAnchor.constraint(equalTo: superview.leadingAnchor)
        let trailingConstraint = subview.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
        let topConstraint = subview.topAnchor.constraint(equalTo: superview.topAnchor)
        let bottomConstraint = subview.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        
        superview.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
    }
}
