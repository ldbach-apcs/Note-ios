//
//  SimpleNoteCell.swift
//  Remember
//
//  Created by CPU12071 on 8/27/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import UIKit
class SimpleNoteCell : NoteCell {
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = false
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 2
        return label
    }()
    
    override func bind(note: NoteItem) {
        if let simpleNote = note as? SimpleNoteItem {
            self.contentLabel.text = simpleNote.content
            super.bind(note: note)
        }
    }
    
    
    override func setupViews() {
        addSubview(contentLabel)
        
        let topConstraint = NSLayoutConstraint(item: contentLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: NoteCell.paddingTopForChild)
        let bottomConstraint = NSLayoutConstraint(item: contentLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: NoteCell.paddingBottomForChild)
        let leftConstraint = NSLayoutConstraint(item: contentLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: NoteCell.paddingLeftForChild)
        let rightConstraint = NSLayoutConstraint(item: contentLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -1.0 * NoteCell.paddingRightForChild)
        
        addConstraints([topConstraint, bottomConstraint, leftConstraint, rightConstraint])
        layoutIfNeeded()
    }
}

