//
//  IListNoteView.swift
//  Remember
//
//  Created by CPU12071 on 8/24/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import Foundation
protocol SeeNotesView {
    func setSeeNotesPresenter(presenter: ViewToSeeNotesPresenter?)
    func display(data: [Note])
    func displayError()
}
