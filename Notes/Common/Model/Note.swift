//
//  Note.swift
//  Remember
//
//  Created by CPU12071 on 8/24/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import Foundation
class Note {
    let id : Double
    let isImportant: Bool
    let title: String?
    let body: String?
    let imagePath: String?
    
    init(id: Double, isImportant: Bool, title: String?, body: String?, imagePath: String?) {
        self.id = id
        self.isImportant = isImportant
        if (title?.isEmpty ?? true) {
            self.title = nil
        } else {
            self.title = title
        }
        
        if (body?.isEmpty ?? true) {
            self.body = nil
        } else {
            self.body = body
        }
        
        self.imagePath = imagePath
    }
}
