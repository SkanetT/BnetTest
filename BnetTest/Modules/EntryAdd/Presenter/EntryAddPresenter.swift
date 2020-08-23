//
//  EntryAddPresenter.swift
//  BnetTest
//
//  Created by Антон on 20.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class EntryAddPresenter: EntryAddPresenterInput {
    
    private weak var viewController: EntryAddPresenterOutput?
    private let interactor: EntryAddInteractorInput
    private let router: EntryAddRouting

    init(_ interactor: EntryAddInteractorInput , _ router: EntryAddRouting) {
        self.interactor = interactor
        self.router = router
    }
    
    func attach(_ viewController: EntryAddPresenterOutput) {
        self.viewController = viewController
        interactor.attach(self)
        router.noText() {[weak self] () in
            self?.viewController?.responder()
        }
    }
    func cancleButtonTap() {
        router.dismiss()
    }
    
    func saveButtonTap(text: String) {
        if text.isEmpty {
            router.showZeroAlert()
        } else {
            interactor.tryToSave(text)
        }
    }    
}

extension EntryAddPresenter: EntryAddInteractorOutput {
    func failuresave(_ error: ApiErrors) {
        router.showError(error)
    }
    
    func successSave() {
        router.dismiss()
    }
}
