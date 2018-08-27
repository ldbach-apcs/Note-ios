//
//  SimpleNote.swift
//  Remember
//
//  Created by CPU12071 on 8/27/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import Foundation
class SimpleNote: Note {
    let content: String
    
    init(id: Double, content: String, isImportant: Bool) {
        self.content = content
        super.init(id: id, isImportant: isImportant)
    }
}
