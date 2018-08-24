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
    static func conert(from note: Note) -> NoteItem {
        fatalError("Not implemented")
    }
}

enum NoteItemType {
    case simple
    case titled
}
