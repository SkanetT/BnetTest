//
//  LoadingPresenter.swift
//  BnetTest
//
//  Created by Антон on 23.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class LoadingPresenter: LoadingPresenterInput {
    
    
    private let interactor: LoadingInteractorInput
    private let router: LoadingRouting

    init(_ interactor: LoadingInteractorInput, _ router: LoadingRouting) {
        self.interactor = interactor
        self.router = router
    }
    
    func attach() {
        interactor.attach(self)
    }
    
    func viewDidAppear() {
        interactor.isFirstRunning()
        router.setError() {[weak self] () in
            self?.interactor.isFirstRunning()
        }
    }
}

extension LoadingPresenter: LoadingInteractorOutput {
    func success() {
        router.presentList()
    }
    
    func failure(_ error: ApiErrors) {
        router.showError(error)
    }
}
