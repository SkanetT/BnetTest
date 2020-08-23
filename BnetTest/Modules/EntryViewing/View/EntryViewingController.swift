//
//  EntryViewingController.swift
//  BnetTest
//
//  Created by Антон on 22.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class EntryViewingController: UIViewController {
    
    var presenter: EntryViewingPresenterInput?
    var textView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attach(self)
        presenter?.viewDidLoad()
        configureUI()
        setupTextView()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        textView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textView)
        textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    private func setupTextView() {
        textView.backgroundColor = .white
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.isEditable = false
        textView.isSelectable = false
    }
}

extension EntryViewingController: EntryViewingPresenterOutput {
    func setText(_ text: String) {
        textView.text = text
    }
}
