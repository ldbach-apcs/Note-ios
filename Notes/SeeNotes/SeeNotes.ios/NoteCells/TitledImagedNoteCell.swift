//
//  TitledImagedNoteCell.swift
//  Remember
//
//  Created by CPU12071 on 8/27/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//
import UIKit
class TitledImagedNoteCell : NoteCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = false
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let photoImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        return iv
    }()
    
    let bodyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = false
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 2
        return label
    }()
    
    override func bind(note: NoteItem) {
        if let titledNote = note as? TitledImagedNoteItem {
            self.titleLabel.text = titledNote.title
            self.bodyLabel.text = titledNote.body
            bindImage(titledNote.imagePath)
            super.bind(note: note)
        }
    }
    
    private func bindImage(_ imagePath: String) { 
        let fullPath = getDocumentsDirectory().path + "/\(imagePath)"
        let image = UIImage(named: fullPath)
        photoImageView.image = image
    }
    
    override func setupViews() {
        addSubview(titleLabel)
        addSubview(bodyLabel)
        addSubview(photoImageView)
        
        let imgVerticalPad: CGFloat = (90 - 64) / 2
        let imageTop = NSLayoutConstraint(item: photoImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: imgVerticalPad)
        let imageLeft = NSLayoutConstraint(item: photoImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: NoteCell.paddingLeftForChild)
        
        let titleTop = NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: NoteCell.paddingTopForChild)
        let titleLeft = NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: photoImageView, attribute: .trailing, multiplier: 1, constant: 8)
        let titleRight = NSLayoutConstraint(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -1.0 * NoteCell.paddingRightForChild)
        
        let bodyTop = NSLayoutConstraint(item: bodyLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 0)
        let bodyLeft = NSLayoutConstraint(item: bodyLabel, attribute: .leading, relatedBy: .equal, toItem: photoImageView, attribute: .trailing, multiplier: 1, constant: 8)
        let bodyRight = NSLayoutConstraint(item: bodyLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -1.0 * NoteCell.paddingRightForChild)
        
        addConstraints([bodyTop, bodyLeft, bodyRight, titleLeft, titleTop, titleRight, imageTop, imageLeft])
        layoutIfNeeded()
    }
}
