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
        notes.append(Note(id: 1, isImportant: false, title: "Title", body: nil, imagePath: "Demo1.png"))
        notes.append(Note(id: 2, isImportant: true, title: "Title", body: nil, imagePath: nil))
        notes.append(Note(id: 3, isImportant: false, title: nil, body: "Body", imagePath: "Demo2.png"))
        notes.append(Note(id: 4, isImportant: true, title: nil, body: "Body", imagePath: "Demo1.png"))
        notes.append(Note(id: 5, isImportant: true, title: nil, body: "Body", imagePath: nil))
        notes.append(Note(id: 6, isImportant: false, title: "Hi", body: "Hello", imagePath: nil))
        notes.append(Note(id: 7, isImportant: true, title: "Hi", body: "Hello", imagePath: "Demo2.png"))
        notes.append(Note(id: 8, isImportant: false, title: "Hi", body: "Hello", imagePath: nil))
        notes.append(Note(id: 9, isImportant: true, title: "Hi", body: "Hello", imagePath: "Demo2.png"))
        delegate.onDataLoaded(data: notes)
    }
    
    override func loadSingleAsync(delegate: RepositoryDelegate<Note>, itemId: Int64) {
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
    
    override func deleteAsync(itemId: Int64?) {
        let index = notes.index { it in
            return it.id == itemId
        }
        if (index != nil) {
            notes.remove(at: index!)
        }
    }
}
