//
//  TitledNoteItem.swift
//  Remember
//
//  Created by CPU12071 on 8/27/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

class TitledNoteItem : NoteItem {
    var note: Note
    var type: NoteItemType
    var isImportant: Bool
    
    var title: String
    var body: String
    
    init(note: Note) {
        self.title = note.title ?? ""
        self.body = note.body ?? ""
        self.note = note
        self.isImportant = note.isImportant
        self.type = .simple
    }
}
