//
//  EntryAddAssembler.swift
//  BnetTest
//
//  Created by Антон on 20.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class EntryAddAssembler {
    static func createModule() -> UIViewController {
        let viewController = EntryAddController()
        let interactor = EntryAddInteractor()
        let router = EntryAddRouter(viewController)
        let presenter = EntryAddPresenter(interactor, router)
        viewController.presenter = presenter
        return viewController
    }
}
