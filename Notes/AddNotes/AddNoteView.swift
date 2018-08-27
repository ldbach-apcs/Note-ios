//
//  AddNoteView.swift
//  Remember
//
//  Created by CPU12071 on 8/27/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import Foundation
protocol AddNoteView {
    func setAddNotePresenter(presenter: ViewToPresenterProtocol)
    func displayNote(data: Note?)
}
