//
//  NoteDataSource.swift
//  Remember
//
//  Created by CPU12071 on 8/24/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import Foundation
import UIKit
class NoteDataSource : NSObject, UITableViewDataSource {
    private var noteItems = [NoteItem]()
    
    func setSource(noteItems: [NoteItem]) {
        self.noteItems = noteItems
    }
    
    func registerCells(for tableView: UITableView?) {
        // TODO: call tableView.register() for dequeue later
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: Get item from noteItems[]
        // Switch item.type
        // Dequeue, and bind
        return UITableViewCell()
    }
    

}
