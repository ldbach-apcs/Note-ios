//
//  NoteRepository.swift
//  Remember
//
//  Created by CPU12071 on 8/24/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import Foundation
class NoteRepository : IRepository<Note> {
    override func loadAllAsync(delegate: RepositoryDelegate<Note>) {
        // TODO: Make this async?
        var notes = [Note]()
        notes.append(SimpleNote(id: 1, content: "Hi", isImportant: false))
        notes.append(SimpleNote(id: 2, content: "Hello", isImportant: true))
        notes.append(SimpleNote(id: 3, content: "World", isImportant: true))
        notes.append(SimpleNote(id: 4, content: "Sigh", isImportant: false))
        delegate.onDataLoaded(data: notes)
    }
    
    override func addAsync(delegate: RepositoryDelegate<Note>, item: Note) {
        print("Add called")
        delegate.onAddDone(added: item)
    }
    
    override func deleteAsync(itemId: Double?) {
        print("Delete called")
    }
}
