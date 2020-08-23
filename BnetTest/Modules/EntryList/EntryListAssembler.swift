//
//  EntryListAssembler.swift
//  BnetTest
//
//  Created by Антон on 19.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class EntryListAssembler {
    static func createModule() -> UIViewController {
        let viewController = EntryListController()
        let interactor = EntryListInteractor()
        let router = EntryListRouter(viewController)
        let presenter = EntryListPresenter(interactor, router)
        let tableHandler = EntryListTableHandler()
        viewController.tableHandler = tableHandler
        viewController.presenter = presenter
        return viewController
    }
}
