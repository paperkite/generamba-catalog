//
//  BaseViewController.swift
//  
//
//  Created by Will Townsend on 15/10/15.
//  Copyright © 2015 PaperKite. All rights reserved.
//

import Foundation
import UIKit
import ReactiveCocoa

/// A public protocol for views that will be contained in a BaseViewController
public protocol RootView {
    func setupAutoLayoutContraints(_ parentViewController: UIViewController?)
}

open class BaseViewController<M: BaseViewModel, V: RootView>: UIViewController, ViewModelViewController where M: ViewModel, V: UIView {
        
    // MARK: Properties
    /// The viewModel that the controller will bind to
    open let viewModel: M
    
    /// A convenience accessor to the ViewControllers type. This avoids having to cast `self.view as? V` when there is a custom view.
    open var rootView: V! { return self.view as! V }
    
    // MARK: Initialisers
    
    required public init(viewModel: M) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.title = self.viewModel.title.value
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        Log.debug("deinit \(type(of: self))")
    }
    
    // MARK: View
    
    override open func loadView() {
        self.view = V()
        self.rootView.setupAutoLayoutContraints(self)
        self.setupBindings()
    }
        
    // MARK: - Functions
    
    /// Create and setup all the ReactiveCocoa bindings to the ViewModel. Subclasses should call `super.setupBindings()`
    open func setupBindings() {
        
        // Create the binding for the title
        self.viewModel.title.producer.skipNil().startWithValues { [weak self] (title) -> () in
            self?.setAttributedTitle(Theme.navigationTitle(title))
        }

    }
    
    /// Sets a `UILabel` as the `navigationItem` view if it's nil, then sets the attributed text and calls `sizeToFit()`
    open func setAttributedTitle(_ text: NSAttributedString) {
        
        if self.navigationItem.titleView == nil {
            self.navigationItem.titleView = UILabel()
        }
        
        if let label = self.navigationItem.titleView as? UILabel {
            label.attributedText = text
            label.sizeToFit()
        }
    }

}
