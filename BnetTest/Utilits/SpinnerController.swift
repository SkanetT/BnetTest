//
//  SpinnerController.swift
//  BnetTest
//
//  Created by Антон on 22.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class SpinnerController: UIViewController {
    
    let aView = UIView()
    let smallView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        aView.translatesAutoresizingMaskIntoConstraints = false
        aView.backgroundColor = .white
        view.addSubview(aView)
        
        aView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        aView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        aView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        aView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        aView.isHidden = true
        
        let size = UIScreen.main.bounds.height / 8.5

        smallView.translatesAutoresizingMaskIntoConstraints = false
        smallView.backgroundColor = .lightGray
        smallView.clipsToBounds = true
        smallView.layer.cornerRadius = size / 4
        aView.addSubview(smallView)
        smallView.centerYAnchor.constraint(equalTo: aView.centerYAnchor).isActive = true
        smallView.centerXAnchor.constraint(equalTo: aView.centerXAnchor).isActive = true
        
        smallView.heightAnchor.constraint(equalToConstant: size).isActive = true
        smallView.widthAnchor.constraint(equalToConstant: size).isActive = true
        
        let ai = UIActivityIndicatorView(style: .white)
        ai.translatesAutoresizingMaskIntoConstraints = false
        smallView.addSubview(ai)
        
        ai.isHidden = false
        
        ai.centerYAnchor.constraint(equalTo: smallView.centerYAnchor).isActive = true
        ai.centerXAnchor.constraint(equalTo: smallView.centerXAnchor).isActive = true
        
        ai.startAnimating()
    }
    func showSpinner() {
        DispatchQueue.main.async {
            self.view.bringSubviewToFront(self.aView)
            self.aView.isHidden = false
        }
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            self.aView.isHidden = true
        }
    }
}

