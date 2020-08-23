//
//  LoadingAssembler.swift
//  BnetTest
//
//  Created by Антон on 23.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class LoadingAssembler {
    static func createModule() -> UIViewController {
        let viewController = LoadingController()
        let interactor = LoadingInteractor()
        let router = LoadingRouter(viewController)
        let presenter = LoadingPresenter(interactor, router)
        viewController.presenter = presenter
        return viewController
    }
}
