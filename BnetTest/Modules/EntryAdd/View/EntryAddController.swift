//
//  EntryAddController.swift
//  BnetTest
//
//  Created by Антон on 20.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class EntryAddController: UIViewController, UITextViewDelegate {
    
    var presenter: EntryAddPresenterInput?
    var textView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attach(self)
        configureUI()
        setupTextView()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textView.becomeFirstResponder()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        textView.resignFirstResponder()
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty {
            navigationItem.rightBarButtonItem?.isEnabled = false
        } else {
            navigationItem.rightBarButtonItem?.isEnabled = true
        }
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
        textView.autocorrectionType = .no
        textView.backgroundColor = .white
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.delegate = self
    }
    
    private func setupNavigationBar() {
        title = "Добавление"
        navigationItem.leftBarButtonItem = .init(title: "Отменить", style: .plain, target: self, action: #selector(cancleTap))
        navigationItem.rightBarButtonItem = .init(title: "Сохранить", style: .plain, target: self, action: #selector(saveTap))
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    @objc
    private func saveTap() {
        view.endEditing(true)
        presenter?.saveButtonTap(text: textView.text)
    }
    
    @objc
    private func cancleTap() {
        presenter?.cancleButtonTap()
    }
}

extension EntryAddController: EntryAddPresenterOutput {
    func responder() {
        textView.becomeFirstResponder()
    }
}
