//
//  CallbackSampleCollectionViewController.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 17/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit
import RxSwift

class RxSampleCollectionViewController: UICollectionViewController {

    // MARK: Properties
    var viewModel: RxSampleCollectionViewModel
    
    // MARK: - Contructors
    init(viewModel: RxSampleCollectionViewModel) {
        self.viewModel = viewModel
        let flowLayout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: flowLayout)
        title = "Reactiave Setters"
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViews()
    }
    
    // MARK: - Bind View
    func bindViews() {
        viewModel.movies
            .drive(collectionView.rx
                .items(cellIdentifier: moviePlaceholderImageName,
                       cellType: MovieCollectionViewCell.self)) { _, element, cell in
                        cell.setImagePath(element.posterPath)
        }.disposed(by: rx.disposeBag)
    }
}

private var disposeBagContext: UInt8 = 0

extension Reactive where Base: Any {
    func synchronizedBag<T>( _ action: () -> T) -> T {
        objc_sync_enter(self.base)
        let result = action()
        objc_sync_exit(self.base)
        return result
    }
}

public extension Reactive where Base: Any {
    
    /// a unique DisposeBag that is related to the Reactive.Base instance only for Reference type
    var disposeBag: DisposeBag {
        get {
            return synchronizedBag {
                if let disposeObject = objc_getAssociatedObject(base, &disposeBagContext) as? DisposeBag {
                    return disposeObject
                }
                let disposeObject = DisposeBag()
                objc_setAssociatedObject(base, &disposeBagContext, disposeObject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return disposeObject
            }
        }
        
        set {
            synchronizedBag {
                objc_setAssociatedObject(base, &disposeBagContext, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
}
