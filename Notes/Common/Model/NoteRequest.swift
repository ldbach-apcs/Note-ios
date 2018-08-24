//
//  NoteRequest.swift
//  Remember
//
//  Created by CPU12071 on 8/24/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

class NoteRequest {
    let type: NoteRequestType
    let itemId: Double?
    
    init(type: NoteRequestType, itemId: Double?) {
        self.type = type
        self.itemId = itemId
    }
}

enum NoteRequestType {
    case edit
    case delete
}
