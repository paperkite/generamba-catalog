//
//  ViewModel.swift
//  
//
//  Created by Walig Castain on 18/08/16.
//  Copyright © 2016 Hell. All rights reserved.
//

import Foundation
import RxSwift

/// All ViewModels should implement this protocol. Provides common accessors for the views.
protocol ViewModel {
    
    /// Required initialiser with the services to be used.
    init(services: Services)
    
    /// The Services that the viewModel will use
    var services: Services { get }
    
    /// Title of the view
    var title: String { get }

}

class BaseViewModel: ViewModel {
    
    // MARK: Properties
    
    /// A string that will be bound to the `UIViewController`s title
    var title: String = ""
    
    /// The `Services` that this `ViewModel` should use for any external dependencies
    let services: Services
    
    /// The RxSwift disposable bag
    let disposeBag = DisposeBag()

    // MARK: Functions
    
    /// Instantiate the `ViewModel` with the `Services`
    required init(services: Services) {
        self.services = services
    }
    
    deinit {
        print("deinit \(type(of: self))")
    }
}
