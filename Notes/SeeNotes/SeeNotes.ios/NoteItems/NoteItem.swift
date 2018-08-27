//
//  NoteItem.swift
//  Remember
//
//  Created by CPU12071 on 8/24/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import Foundation
protocol NoteItem {
    var note: Note { get set }
    var type: NoteItemType { get }
    var isImportant: Bool { get }
}

class NoteItemConverter {
    static func convert(from note: Note) -> NoteItem {
        let emptyTitle = note.title?.isEmpty ?? true
        let emptyBody = note.body?.isEmpty ?? true
        let emptyImagePath = note.imagePath?.isEmpty ?? true
        
        if emptyTitle || emptyBody {
            if emptyImagePath {
                return SimpleNoteItem(note: note)
            } else {
                return ImagedNoteItem(note: note)
            }
        }
        
        if emptyImagePath {
            return TitledNoteItem(note: note)
        } else  {
            return TitledImagedNoteItem(note: note)
        } 
    }
    
    static func convert(from notes: [Note]) -> [NoteItem] {
        return notes.map { it in
            return convert(from: it)
        }
    }
}

enum NoteItemType {
    case simple
    case titled
    case imaged
    case titledImaged
    case error
}
