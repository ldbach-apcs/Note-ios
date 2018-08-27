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
        if let n = note as? SimpleNote {
            return SimpleNoteItem(note: n, isImportant: n.isImportant)!
        } else {
            fatalError("Unsupported Note type")
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
    case error
}
