//
//  NoteCell.swift
//  Remember
//
//  Created by CPU12071 on 8/24/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import UIKit
class NoteCell : UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier resueIdentifier: String?) {
        super.init(style: style, reuseIdentifier: resueIdentifier)
        setupSuper()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not implemented")
    }
    
    // Will set up the `star`
    func setupSuper() {
        
    }
    
    func setupViews() {
        fatalError("NoteCell is abstract. Please subclass")
    }
    
    func bind(note: NoteItem) {
        fatalError("NoteCell is abstract. Please subclass")
    }
}
