//
//  NoteCell.swift
//  Remember
//
//  Created by CPU12071 on 8/24/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import UIKit
class NoteCell : UITableViewCell {
    
    static var paddingTopForChild: CGFloat = 16
    static var paddingBottomForChild: CGFloat = 8
    static var paddingLeftForChild: CGFloat = 16
    static var paddingRightForChild: CGFloat = 0
    static let btnSize = CGSize(width: 32, height: 32)
    static let cellHeight: CGFloat = 90
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    let starButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "emptyStar"), for: .normal)
        button.setImage(#imageLiteral(resourceName: "highlightedStar"), for: .selected)
        button.isUserInteractionEnabled = false
        button.heightAnchor.constraint(equalToConstant: NoteCell.btnSize.height).isActive = true
        button.widthAnchor.constraint(equalToConstant: NoteCell.btnSize.width).isActive = true
        return button
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier resueIdentifier: String?) {
        super.init(style: style, reuseIdentifier: resueIdentifier)
        setupSuper()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not implemented")
    }
    
    // Will set up the `star`
    private func setupSuper() {
        let pad = (NoteCell.cellHeight - NoteCell.btnSize.height) / 2
        addSubview(starButton)
        
        let topConstraint = NSLayoutConstraint(item: starButton, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: pad)
        let rightConstraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: starButton, attribute: .trailing, multiplier: 1, constant: 16)
        NoteCell.paddingRightForChild = 2 * 16 + NoteCell.btnSize.width
        
        addConstraints([topConstraint, rightConstraint])
    }
    
    func setupViews() { }
    
    func bind(note: NoteItem) {
        starButton.isSelected = note.isImportant
    }
}
