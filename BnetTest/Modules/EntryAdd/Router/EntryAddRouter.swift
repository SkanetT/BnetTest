//
//  EntryAddRouter.swift
//  BnetTest
//
//  Created by Антон on 20.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class EntryAddRouter: EntryAddRouting {
    
    private weak var viewController: UIViewController?
    var empty: (() -> ())?
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func dismiss() {
        DispatchQueue.main.async {
            self.viewController?.navigationController?.popViewController(animated: true)
        }
    }
    
    func showZeroAlert() {
        let ac = UIAlertController(title: "Ошибка", message: "Запись не может быть пустой", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: {[weak self] action in
            self?.empty?()
        })
        ac.addAction(ok)
        viewController?.present(ac, animated: true)
    }
    
    func noText(empty: (() -> ())?) {
        self.empty = empty
    }
    
    func showError(_ error: ApiErrors) {
        switch error {
        case .noInternet:
            DispatchQueue.main.async {
                let ac = UIAlertController(title: "Ошибка", message: "Нет соединения с сервером", preferredStyle: .alert)
                let refresh = UIAlertAction(title: "OK", style: .default, handler: {[weak self] action in
                    self?.dismiss()
                })
                ac.addAction(refresh)
                self.viewController?.present(ac, animated: true)
            }
        case .noData, .unknown:
            viewController?.showErrorMessage(errorText: "Неизвестная ошибка", actionText: "OK")
        }
    }
}

