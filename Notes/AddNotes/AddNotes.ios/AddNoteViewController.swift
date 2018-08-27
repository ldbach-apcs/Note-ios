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
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantButton: UIButton!
    @IBOutlet weak var bodyTextView: UITextView!
    
    
    func setAddNotePresenter(presenter: ViewToPresenterProtocol) {
        self.presenter = presenter
    }
    
    func displayNote(data: Note?) {
        titleTextField.text = data?.title ?? ""
        bodyTextView.text = data?.body ?? ""
        importantButton.isSelected = data?.isImportant ?? false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewReady()
        importantButton.setImage(#imageLiteral(resourceName: "highlightedStar"), for: .selected)
        navigationItem.title = "Add note"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(handleAdd))
    }
    
    @IBAction func importantButtonSelected(_ sender: Any) {
        importantButton.isSelected = !importantButton.isSelected
    }
    
    @objc func handleAdd() {
        let note = constructNoteToAdd()
        let addRequest = NoteRequest(type: .add, itemId: nil, item: note)
        presenter?.handleRequest(request: addRequest)
    }
    
    private func constructNoteToAdd() -> Note {
        let title = titleTextField.text?.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        let body = bodyTextView.text?.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        let important = importantButton.isSelected
        return Note(id: 12, isImportant: important, title: title, body: body)
    }
}
