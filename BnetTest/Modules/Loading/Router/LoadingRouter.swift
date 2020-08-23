//
//  LoadingRouter.swift
//  BnetTest
//
//  Created by Антон on 23.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class LoadingRouter: LoadingRouting {
    
    private weak var viewController: SpinnerController?
    var error: (() -> ())?
    
    
    init(_ viewController: SpinnerController) {
        self.viewController = viewController
    }
    
    func presentList() {
        viewController?.removeSpinner()
        DispatchQueue.main.async {
            let vc = EntryListAssembler.createModule()
            let nc = UINavigationController(rootViewController: vc)
            nc.modalPresentationStyle = .fullScreen
            //  self.viewController?.present(nc, animated: true)
            UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController = nc
        }
    }
    
    func setError(error: (() -> ())?) {
        self.error = error
    }
    
    func showError(_ error: ApiErrors) {
        switch error {
        case .noInternet:
            DispatchQueue.main.async {
                let ac = UIAlertController(title: "Ошибка", message: "Нет соединения с сервером", preferredStyle: .alert)
                let refresh = UIAlertAction(title: "OK", style: .default, handler: {[weak self] action in
                    self?.error?()
                })
                ac.addAction(refresh)
                self.viewController?.present(ac, animated: true)
            }
        case .noData, .unknown:
            DispatchQueue.main.async {
                let ac = UIAlertController(title: "Ошибка", message: "Неизвестная ошибка", preferredStyle: .alert)
                let refresh = UIAlertAction(title: "OK", style: .default, handler: {[weak self] action in
                    self?.error?()
                })
                ac.addAction(refresh)
                self.viewController?.present(ac, animated: true)
            }
        }
    }
}

