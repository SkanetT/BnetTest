//
//  EntryViewingPresenter.swift
//  BnetTest
//
//  Created by Антон on 22.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class EntryViewingPresenter: EntryViewingPresenterInput {
    
    private weak var viewController: EntryViewingPresenterOutput?
    private let interactor: EntryViewingInteractorInput

    init(_ interactor: EntryViewingInteractorInput) {
        self.interactor = interactor
    }
    
    func attach(_ viewController: EntryViewingPresenterOutput) {
        self.viewController = viewController
        interactor.attach(self)
    }
    
    func viewDidLoad() {
        interactor.fetchStringForBody()
    }
}

extension EntryViewingPresenter: EntryViewingInteractorOutput {
    func bodyDidReceive(_ body: String) {
        viewController?.setText(body)
    }
}
