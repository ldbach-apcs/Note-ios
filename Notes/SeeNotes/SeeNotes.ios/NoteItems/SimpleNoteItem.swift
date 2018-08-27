//
//  SimpleNoteItem.swift
//  Remember
//
//  Created by CPU12071 on 8/27/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//


import Foundation
class SimpleNoteItem : NoteItem {
    var note: Note 
    var type: NoteItemType
    var isImportant: Bool
    var content: String
    
    init?(note: Note, isImportant: Bool) {
        if let sNote = note as? SimpleNote {
            self.content = sNote.content
            self.note = note
            self.isImportant = isImportant
            self.type = .simple
            }
        else {
            return nil
        }
    }
}
