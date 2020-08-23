//
//  LoadingViewController.swift
//  BnetTest
//
//  Created by Антон on 23.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class LoadingController: SpinnerController {
    
    var presenter: LoadingPresenterInput?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attach(self)
        presenter?.viewDidLoad()
        showSpinner()
    }

}

extension LoadingController: LoadingPresenterOutput {
    
}
