//
//  IListNoteView.swift
//  Remember
//
//  Created by CPU12071 on 8/24/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import Foundation
protocol SeeNotesView {
    func addNote(added: Note)
    func removeNote(id: Double?)
    func setSeeNotesPresenter(presenter: ViewToPresenterProtocol?)
    func display(data: [Note])
    func displayError()
}
