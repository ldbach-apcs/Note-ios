//
//  ViewToSeeNotesPresenter.swift
//  Remember
//
//  Created by CPU12071 on 8/24/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

protocol ViewToSeeNotesPresenter {
    func onViewReady()
    func handleRequest(request: NoteRequest)
}
