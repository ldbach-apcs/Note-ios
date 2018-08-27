//
//  TitledImagedNoteItem.swift
//  Remember
//
//  Created by CPU12071 on 8/27/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import Foundation

class TitledImagedNoteItem : NoteItem {
    var note: Note
    var type: NoteItemType
    var isImportant: Bool
    var imagePath: String
    var title: String
    var body: String
    
    init(note: Note) {
        self.title = note.title ?? ""
        self.body = note.body ?? ""
        self.imagePath = note.imagePath!
        self.note = note
        self.isImportant = note.isImportant
        self.type = .titledImaged
    }
}
