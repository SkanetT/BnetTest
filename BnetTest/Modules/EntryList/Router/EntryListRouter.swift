//
//  EntryListRouter.swift
//  BnetTest
//
//  Created by Антон on 20.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class EntryListRouter: EntryListRouting {
    private weak var viewController: UIViewController?
    var refresh: (() -> ())?
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func presentEntryAdd() {
        let vc = EntryAddAssembler.createModule()
        vc.modalPresentationStyle = .fullScreen
        viewController?.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func presentEntryViewing(_ body: String) {
        let vc = EntryViewingAssembler.createModule(body)
        vc.modalPresentationStyle = .fullScreen
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showError(_ error: ApiErrors) {
        switch error {
        case .noInternet:
            DispatchQueue.main.async {
                let ac = UIAlertController(title: "Ошибка", message: "Нет соединения с сервером", preferredStyle: .alert)
                let refresh = UIAlertAction(title: "Обновить данные", style: .default, handler: {[weak self] action in
                    self?.refresh?()
                })
                ac.addAction(refresh)
                self.viewController?.present(ac, animated: true)
            }
            
        case .noData, .unknown:
            viewController?.showErrorMessage(errorText: "Неизвестная ошибка", actionText: "OK")
        }
    }
    
    func noNet(refresh: (() -> ())?) {
        self.refresh = refresh
    }
}
