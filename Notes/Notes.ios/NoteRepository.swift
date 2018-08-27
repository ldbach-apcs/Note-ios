//
//  NoteRepository.swift
//  Remember
//
//  Created by CPU12071 on 8/24/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import Foundation
class NoteRepository : IRepository<Note> {
    var notes = [Note]()
    override func loadAllAsync(delegate: RepositoryDelegate<Note>) {
        // TODO: Make this async?
        notes.append(Note(id: 1, isImportant: true, title: "Yah", body: nil))
        notes.append(Note(id: 3, isImportant: true, title: nil, body: "Hel"))
        notes.append(Note(id: 4, isImportant: false, title: nil, body: "Hello"))
        notes.append(Note(id: 2, isImportant: true, title: nil, body: nil))
        delegate.onDataLoaded(data: notes)
    }
    
    override func loadSingleAsync(delegate: RepositoryDelegate<Note>, itemId: Double) {
        let index = notes.index { it in
            return it.id == itemId
        }
        if index != nil {
            delegate.onSingleDataLoaded(data: notes[index!])
        }
    }
    
    override func addAsync(delegate: RepositoryDelegate<Note>, item: Note) {
        delegate.onAddDone(added: item)
    }
    
    override func deleteAsync(itemId: Double?) {
        print("Delete called")
    }
}
