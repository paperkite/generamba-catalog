//
//  BaseViewModel.swift
//  
//
//  Created by Will Townsend on 15/10/15.
//  Copyright © 2015 PaperKite. All rights reserved.
//

import Foundation
import ReactiveCocoa
import ReactiveSwift

/// All ViewModels should implement this protocol. Provides common accessors for the views.
public protocol ViewModel {
    
    /// Required initialiser with the services to be used.
    init(services: Services)
    
    /// The Services that the viewModel will use
    var services: Services { get }
    
    /// Title of the view
    var title: MutableProperty<String?> { get }
}

open class BaseViewModel: ViewModel {
    
    // MARK: Properties
    
    /// A string that will be bound to the `UIViewController`s title
    open let title = MutableProperty<String?>(nil)
    
    /// The `Services` that this `ViewModel` should use for any external dependencies
    open let services: Services

    // MARK: Functions
    
    /// Instantiate the `ViewModel` with the `Services`
    required public init(services: Services) {
        self.services = services
    }
    
    deinit {
        print("deinit \(type(of: self))")
    }
}
