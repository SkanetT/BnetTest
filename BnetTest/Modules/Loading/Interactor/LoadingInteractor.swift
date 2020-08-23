//
//  LoadingInteractor.swift
//  BnetTest
//
//  Created by Антон on 23.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class LoadingInteractor: LoadingInteractorInput {
    
    weak var output: LoadingInteractorOutput?
    
    func attach(_ output: LoadingInteractorOutput) {
        self.output = output
    }
    
    func isFirstRunning() {
        let defaults = UserDefaults.standard
        
        guard Reachability.shared.isConnectedToNetwork() else {
            output?.failure(.noInternet)
            return
        }
        let sessionId = defaults.string(forKey: "session")

        if sessionId != nil {
            output?.success()
        } else {
            NetworkAPI.shared.newSession() {[weak self] result in
                switch result {
                case .success(let id):
                    defaults.set(id, forKey: "session")
                    self?.output?.success()
                case .failure(let error):
                    self?.output?.failure(error)
                }
            }
        }
    }
}
