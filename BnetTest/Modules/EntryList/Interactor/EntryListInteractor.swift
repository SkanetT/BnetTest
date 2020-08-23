//
//  EntryListInteractor.swift
//  BnetTest
//
//  Created by Антон on 19.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class EntryListInteractor: EntryListInteractorInput {
    
    weak var output: EntryListInteractorOutput?
    
    func attach(_ output: EntryListInteractorOutput) {
        self.output = output
    }
    
    func fetchEntryData() {
        NetworkAPI.shared.getEntries() {[weak self] result in
            switch result {
            case.success(let data):
                self?.output?.entryDataSuccess(data)
            case .failure(let error):
                self?.output?.entryDataFailure(error)
            }
        }
    }
}
