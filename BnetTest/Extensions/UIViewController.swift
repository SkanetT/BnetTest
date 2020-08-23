//
//  UIViewController.swift
//  BnetTest
//
//  Created by Антон on 23.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

extension UIViewController {
    func showErrorMessage(errorText: String, actionText: String) {
        DispatchQueue.main.async {
            let ac = UIAlertController(title: "Ошибка", message: errorText, preferredStyle: .alert)
            let action = UIAlertAction(title: actionText, style: .default, handler: nil)
            ac.addAction(action)
            self.present(ac, animated: true, completion: nil)
        }
    }
}
