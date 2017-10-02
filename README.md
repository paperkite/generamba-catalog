# PaperKite Generamba Templates

This repository contains our most common templates at PaperKite.

It's a shared catalog of templates for [Generamba](https://github.com/rambler-digital-solutions/Generamba) code generator.

**Generamba** is a code generator made for working with Xcode. It is quite easy to customize it for generation of any other classes (both in Objective-C and Swift).

The detailed information about a template structure is available in [Generamba Wiki](https://github.com/rambler-digital-solutions/Generamba/wiki/Template-Structure).

## How to use:
1. Install [Generamba](https://github.com/rambler-digital-solutions/Generamba) 
2. If the project has no a `Rambafile` type `generamba setup` and follow the setup
3. Modify the Rambafile with the following templates at the bottom. Pick the templates appropriate to the project
```
### Templates
catalogs:
- 'https://github.com/paperkite/generamba-catalog'

templates:
- {name: mvvm_ios}
- {name: mvvm_reactiveswift_tableview_ios}
- {name: mvvm_reactiveswift_collectionview_ios}
- {name: mvvm_rxswift_tableview_ios}
- {name: mvvm_rxswift_collectionview_ios}
- {name: viper_ios}
- {name: viper_tableview_ios}
- {name: viper_collectionview_ios}
```
4. Install the templates by running `generamba template install`
5. Finally run `generamba gen [MODULE_NAME] [TEMPLATE_NAME]` to generate your own module
6. Enjoy 🖖🏼

## Templates:
### MVVM iOS
A classic MVVM boilerplate without any third party libraries. The `ViewController.swift` is relying on a custom `BaseMVVMViewController.swift` file that can be found at the root of the repository.

### MVVM RxSwift / ReactiveSwift Tableview iOS
An MVVM boilerplate for any screen based on a tableview. We have two versions, one with RxSwift or ReactiveSwift. The common bindings are already made. The rest of the work will be to fetch the content from the ViewModel, and adding custom `UITableViewCell`

### MVVM RxSwift / ReactiveSwift CollectionView iOS
Very similar to the TableView. Only the view is different including the different datasource methods.

### VIPER iOS
The VIPER iOS is the blank canvas for any VIPER module. The `ViewController.swift` is relying on a custom `BaseVIPERViewController.swift` that can be found in every VIPER folder.

### VIPER TableView iOS
The VIPER TableView iOS is a good starter for any VIPER module including a tableview. You will find all the datasources and delegate methods hooked to the presenter. Additionally all the classes are already mocked and ready to be tested 🚀.

### VIPER CollectionView iOS
The VIPER CollectionView iOS is similar to the TableView one, except it embeds a `UICollectionView`.

## Improvements:
The RxSwift and ReactiveCocoa could probably need improvements with `Input` / `Outputs` style and better bindings. 