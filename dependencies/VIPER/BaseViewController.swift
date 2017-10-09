//
//  BaseViewController.swift
//  
//
//  Created by Walig Castain on 16/03/17.
//  Copyright © 2017 PaperKite. All rights reserved.
//

import Foundation
import UIKit

/// A public protocol for views that will be contained in a BaseViewController
public protocol RootView {
    func setupAutoLayoutContraints(_ parentViewController: UIViewController?)
}

open class BaseViewController<V: RootView>: UIViewController where V: UIView {
    
    // MARK: Properties
    
    /// A convenience accessor to the ViewControllers type. This avoids having to cast `self.view as? V` when there is a custom view.
    open var rootView: V! { return self.view as! V }
    
    // MARK: Initialisers
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View
    
    override open func loadView() {
        self.view = V()
        self.rootView.setupAutoLayoutContraints(self)
    }

}
