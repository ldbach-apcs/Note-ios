//
//  NoteAdapter.swift
//  Remember
//
//  Created by CPU12071 on 8/24/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import Foundation
import UIKit
class NoteAdapter : NSObject, UITableViewDataSource, UITableViewDelegate {
    private let SIMPLE_NOTE_CELL = "SimpleNoteCell"
    private let TITLED_NOTE_CELL = "TitledNoteCell"
    private let ROW_HEIGHT: CGFloat = 90
    private var noteItems = [NoteItem]()
    private weak var noteTableView: UITableView?
    var eventHandler: SeeNotesViewController?
    
    func setSource(noteItems: [NoteItem]) {
        self.noteItems = noteItems
    }
    
    func addNote(added: NoteItem) {
        noteItems.insert(added, at: 0)
        uiAddNote()
    }
    
    func removeNote(_ id: Double?) {
        if id != nil {
            let index = noteItems.index { it in
                return it.note.id == id
            }
            if index != nil {
                uiDeleteRow(index: index!)
            }
        }
    }
    
    private func uiAddNote() {
        let insertPath = NSIndexPath(row: 0, section: 0)
        noteTableView?.insertRows(at: [insertPath as IndexPath], with: .automatic)
    }
    
    func registerCells(for tableView: UITableView?, bindTable: Bool) {
        tableView?.rowHeight = ROW_HEIGHT
        tableView?.register(SimpleNoteCell.self, forCellReuseIdentifier: SIMPLE_NOTE_CELL)
        tableView?.register(TitledNoteCell.self, forCellReuseIdentifier: TITLED_NOTE_CELL)
        
        
        if bindTable {
            self.noteTableView = tableView
            self.noteTableView?.delegate = self
            self.noteTableView?.dataSource = self
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ROW_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        let itemId = noteItems[index].note.id
        eventHandler?.navigateEdit(id: itemId)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            let index = indexPath.row
            eventHandler?.handleDelete(id: noteItems[index].note.id)
            uiDeleteRow(index: index)
        }
    }
    
    private func uiDeleteRow(index: Int) {
        if index < 0 || index >= noteItems.count {
            return
        }
        
        noteItems.remove(at: index)
        let removePath = NSIndexPath(row: index, section: 0)
        noteTableView?.deleteRows(at: [removePath as IndexPath], with: .automatic)
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let noteItem = noteItems[index]
        var cell: NoteCell?
        
        switch noteItem.type {
        case .simple:
            cell = tableView.dequeueReusableCell(withIdentifier: SIMPLE_NOTE_CELL) as? SimpleNoteCell
        default:
            cell = nil
        }
        
        cell?.bind(note: noteItem)
        return cell ?? UITableViewCell()
    } 
}
