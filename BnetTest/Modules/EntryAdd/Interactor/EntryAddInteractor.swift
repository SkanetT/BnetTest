//
//  EntryAddInteractor.swift
//  BnetTest
//
//  Created by Антон on 20.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class EntryAddInteractor: EntryAddInteractorInput {
    
    weak var output: EntryAddInteractorOutput?
    
    func attach(_ output: EntryAddInteractorOutput) {
        self.output = output
    }
    
    func tryToSave(_ text: String) {
        NetworkAPI.shared.addEntry(body: text) {[weak self] result in
            switch result {
            case .success(()):
                self?.output?.successSave()
            case .failure(let error):
                self?.output?.failuresave(error)
            }
        }
    }
}
