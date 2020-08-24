//
//  EntryListPresenter.swift
//  BnetTest
//
//  Created by Антон on 19.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class EntryListPresenter: EntryListPresenterInput {
    
    private weak var viewController: EntryListPresenterOutput?
    private let interactor: EntryListInteractorInput
    private let router: EntryListRouting

    init(_ interactor: EntryListInteractorInput, _ router: EntryListRouting) {
        self.interactor = interactor
        self.router = router
    }
    
    func attach(_ viewController: EntryListPresenterOutput) {
        self.viewController = viewController
        interactor.attach(self)
    }
    
    func viewDidLoad() {
        interactor.fetchEntryData()
        viewController?.setActionForCell() {[weak self] body in
            self?.router.presentEntryViewing(body)
        }
        router.noNet() { [weak self] () in
            self?.interactor.fetchEntryData()
        }
    }
    
    func viewWillAppear() {
        interactor.fetchEntryData()
    }
    
    func addEntryTap() {
        router.presentEntryAdd()
    }
}

extension EntryListPresenter: EntryListInteractorOutput {
    func entryDataSuccess(_ data: [EntryData]) {
        viewController?.dataDidReceive(data)
    }
    func entryDataFailure(_ error: ApiErrors) {
        router.showError(error)    
    }
}
