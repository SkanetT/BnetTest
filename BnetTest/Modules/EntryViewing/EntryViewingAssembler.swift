//
//  EntryViewingAssembler.swift
//  BnetTest
//
//  Created by Антон on 22.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class EntryViewingAssembler {
    static func createModule(_ body: String) -> UIViewController {
        let viewController = EntryViewingController()
        let interactor = EntryViewingInteractor(body)
        let presenter = EntryViewingPresenter(interactor)
        viewController.presenter = presenter
        return viewController
    }
}
