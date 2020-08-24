//
//  EntryListController.swift
//  BnetTest
//
//  Created by Антон on 19.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class EntryListController: SpinnerController {
    
    var presenter: EntryListPresenterInput?
    var tableHandler: EntryListTableHandlerProtocol?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        presenter?.attach(self)
        presenter?.viewDidLoad()
        tableHandler?.attach(tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
        showSpinner()
    }
    
    private func setupNavigationBar() {
        title = "Записи"
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .add, target: self, action: #selector(addTap))
    }
    
    @objc
    private func addTap() {
        presenter?.addEntryTap()
    }
    
}

extension EntryListController: EntryListPresenterOutput {
    func setActionForCell(_ userSelect: ((String) -> ())?) {
        tableHandler?.setAction(userSelect: userSelect)
    }
    
    func dataDidReceive(_ data: [EntryData]) {
        tableHandler?.setData(data)
        removeSpinner()
    }
}
