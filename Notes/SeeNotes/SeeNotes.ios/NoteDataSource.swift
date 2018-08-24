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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    

}
