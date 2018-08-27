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
        notes.append(Note(id: 1, isImportant: true, title: "Yah", body: nil, imagePath: nil))
        notes.append(Note(id: 3, isImportant: false, title: "Title", body: "Body", imagePath: nil))
        notes.append(Note(id: 4, isImportant: false, title: nil, body: "Hello", imagePath: nil))
        notes.append(Note(id: 2, isImportant: true, title: nil, body: nil, imagePath: nil))
        delegate.onDataLoaded(data: notes)
    }
    
    override func loadSingleAsync(delegate: RepositoryDelegate<Note>, itemId: Double) {
        let index = notes.index { it in
            return it.id == itemId
        }
        
        if index != nil {
            delegate.onSingleDataLoaded(data: notes[index!])
        } else {
            delegate.onSingleDataLoaded(data: Note(id: -1, isImportant: false, title: nil, body: nil, imagePath: nil))
        }
    }
    
    override func addAsync(delegate: RepositoryDelegate<Note>, item: Note) {
        notes.insert(item, at: 0)
        delegate.onAddDone(added: item)
    }
    
    override func deleteAsync(itemId: Double?) {
        let index = notes.index { it in
            return it.id == itemId
        }
        if (index != nil) {
            notes.remove(at: index!)
        }
    }
}
