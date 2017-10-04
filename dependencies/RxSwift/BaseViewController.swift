//
//  ViewController.swift
//  
//
//  Created by Walig Castain on 18/08/16.
//  Copyright © 2016 Hell. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

/// A protocol for views that will be contained in a BaseViewController
protocol RootView {
    func setupAutoLayoutContraints(_ parentViewController: UIViewController?)
}

extension RootView {
    func setupAutoLayoutContraints(_ parentViewController: UIViewController?) { }
}

/// Defines a protocol for all the view controllers to follow
protocol ViewControllerWithViewModel {
    
    associatedtype T: ViewModel
    
    var viewModel: T { get }
    
    init(viewModel: T)
    
    func setupBindings()
}

class BaseViewController<M: ViewModel, V: RootView>: UIViewController, ViewControllerWithViewModel where V: UIView {
        
    // MARK: - Properties
    
    /// The viewModel that the controller will bind to
    let viewModel: M
    
    /// A convenience accessor to the ViewControllers type. This avoids having to cast `self.view as? V` when there is a custom view.
    var rootView: V! { return self.view as! V }
    
    /// The RxSwift disposable bag
    let disposeBag = DisposeBag()

    // MARK: - Initialisers
    
    required init(viewModel: M) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.title = self.viewModel.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("deinit \(type(of: self))")
    }
    
    // MARK: - View
    
    override func loadView() {
        self.view = V()
        self.rootView.setupAutoLayoutContraints(self)
        self.setupBindings()
    }

    // MARK: - Functions
    
    /// Setup the default bindings
    func setupBindings() {
    
    }

}
