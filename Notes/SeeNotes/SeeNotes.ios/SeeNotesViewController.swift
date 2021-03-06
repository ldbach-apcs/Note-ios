//
//  SeeNotesViewController.swift
//  Remember
//
//  Created by CPU12071 on 8/24/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import UIKit

class SeeNotesViewController: UIViewController, SeeNotesView {
    var presenter: ViewToPresenterProtocol?
    private let noteAdapter = NoteAdapter()
    private var noteTableView: UITableView!

    func setSeeNotesPresenter(presenter: ViewToPresenterProtocol?) {
        self.presenter = presenter
    }

    func display(data: [Note]) {
        let convertedData = NoteItemConverter.convert(from: data)
        noteAdapter.setSource(noteItems: convertedData)
    }
    
    func displayError() {
        print("SeeNotesView: Error")
        // convertedData = ErrorNoteItem() // This noteItem corespond to error message
        // noteDatasource.setData([convertedData]) 
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupTableView()
        presenter?.onViewReady()
    }
    

    func addNote(added: Note) {
        let convertedNote = NoteItemConverter.convert(from: added)
        noteAdapter.addNote(added: convertedNote)
    }
    
    func removeNote(id: Int64?) {
        noteAdapter.removeNote(id)
    }
    
    private func setupNavBar() {
        navigationItem.title = "Your notes"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(navigateAdd))
    }
    
    @objc func navigateAdd() {
        // Since Add is clicked, no itemId is sent with the request
        let request = NoteRequest(type: .edit, itemId: nil, item: nil)
        presenter?.handleRequest(request: request)
    }
    
    func navigateEdit(id itemId: Int64) {
        let request = NoteRequest(type: .edit, itemId: itemId, item: nil)
        presenter?.handleRequest(request: request)
    }
    
    func handleDelete(id itemId: Int64) {
        let request = NoteRequest(type: .delete, itemId: itemId, item: nil)
        presenter?.handleRequest(request: request)
    }
    
    private func setupTableView() {
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        noteTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        noteAdapter.eventHandler = self
        noteAdapter.registerCells(for: noteTableView, bindTable: true)
        self.view.addSubview(noteTableView)
    }
}
