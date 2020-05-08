//
//  UIView+Pin.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 07/05/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit

extension UIView {
    
    func pin(_ view: UIView) {
        addSubview(view)
        
        let leadingConstraint = view.leadingAnchor.constraint(equalTo: leadingAnchor)
        let trailingConstraint = view.trailingAnchor.constraint(equalTo: trailingAnchor)
        let topConstraint = view.topAnchor.constraint(equalTo: topAnchor)
        let bottomConstraint = view.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
    }
    
    func setImagePath(_ imagePath: String?, imageView: inout UIImageView) {
        guard let imagePath = imagePath else { return }
        let imageUrl = URL(string: "\(movieCoverBaseURL)\(imagePath)")
        let loadingView = LoadingView.start(in: self)
        imageView.sd_setImage(with: imageUrl) { (_, _, _, _) in
            loadingView.stop() }
    }
}
