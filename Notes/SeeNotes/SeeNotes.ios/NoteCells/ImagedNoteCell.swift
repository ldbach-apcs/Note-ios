//
//  ImagedNoteCell.swift
//  Remember
//
//  Created by CPU12071 on 8/27/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import UIKit
class ImagedNoteCell : NoteCell {
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = false
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 2
        return label
    }()
    
    let photoImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        return iv
    }()
    
    override func bind(note: NoteItem) {
        if let n = note as? ImagedNoteItem {
            self.contentLabel.text = n.content
            bindImage(n.imagePath)
            super.bind(note: n)
        }
    }
    
    
    private func bindImage(_ imagePath: String) {
        let fullPath = getDocumentsDirectory().path + "/\(imagePath)"
        let image = UIImage(named: fullPath)
        photoImageView.image = image
    }
    
    override func setupViews() {
        addSubview(contentLabel)
        addSubview(photoImageView)
        
        let imgVerticalPad: CGFloat = (90 - 64) / 2
        let imageTop = NSLayoutConstraint(item: photoImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: imgVerticalPad)
        let imageLeft = NSLayoutConstraint(item: photoImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: NoteCell.paddingLeftForChild)
        
        let topConstraint = NSLayoutConstraint(item: contentLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: NoteCell.paddingTopForChild)
        let bottomConstraint = NSLayoutConstraint(item: contentLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: NoteCell.paddingBottomForChild)
        let leftConstraint = NSLayoutConstraint(item: contentLabel, attribute: .leading, relatedBy: .equal, toItem: photoImageView, attribute: .trailing, multiplier: 1, constant: 8)
        let rightConstraint = NSLayoutConstraint(item: contentLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -1.0 * NoteCell.paddingRightForChild)
        
        addConstraints([topConstraint, bottomConstraint, leftConstraint, rightConstraint, imageTop, imageLeft])
        layoutIfNeeded()
    }
}
