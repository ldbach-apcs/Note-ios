//
//  ImagedNoteItem.swift
//  Remember
//
//  Created by CPU12071 on 8/27/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import Foundation
class ImagedNoteItem : NoteItem {
    var note: Note
    var type: NoteItemType
    var isImportant: Bool
    var content: String
    var imagePath: String
    
    init(note: Note) {
        self.content = note.body ?? note.title ?? ""
        self.note = note
        self.isImportant = note.isImportant
        self.type = .imaged
        self.imagePath = note.imagePath!
    }
}
