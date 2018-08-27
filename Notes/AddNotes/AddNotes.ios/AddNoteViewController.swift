//
//  AddNoteViewController.swift
//  Remember
//
//  Created by CPU12071 on 8/27/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController, AddNoteView {
    private var presenter: ViewToPresenterProtocol?

    
    func setAddNotePresenter(presenter: ViewToPresenterProtocol) {
        self.presenter = presenter
    }
    
    func displayNote(data: Note) {
        // Switch Note type and fill the spaces
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewReady()
        navigationItem.title = "Add note"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(handleAdd))
    }
    
    @objc func handleAdd() {
        let note = constructNoteToAdd()
        let addRequest = NoteRequest(type: .add, itemId: nil, item: note)
        presenter?.handleRequest(request: addRequest)
    }
    
    private func constructNoteToAdd() -> Note {
       return SimpleNote(id: 42, content: "Newly added", isImportant: true)
    }
}
