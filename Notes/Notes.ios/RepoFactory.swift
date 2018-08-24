//
//  RepoFactory.swift
//  Remember
//
//  Created by CPU12071 on 8/24/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import Foundation
class RepoFactory {
    
    // TODO: Make NoteRepository singleton? Is this needed?
    // Intended Database is SQLite Database, on iOS environment
    // Will SQLite Database requires singleton? Memory consumption?
    // Will we use this func more than once?
    static func getNoteRepo() -> IRepository<Note> {
        return NoteRepository()
    }
}
