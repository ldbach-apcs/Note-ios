//
//  NoteListPresenter.swift
//  Remember
//
//  Created by CPU12071 on 8/24/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import Foundation
class ListNotePresenter : RepositoryDelegate<Note> {
    let repo: IRepository<Note>?
    let view: IListNoteView?
    init(repo: IRepository<Note>, view: IListNoteView?) {
        self.repo = repo
        self.view = view
    }
    
    func onViewReady() {
        repo?.loadAllAsync(delegate: self)
    }
    
    func navigateToAdd() {
        
    }
    
    func requestDelete(arg: Any?) {
        // For now make arg: Any?, later we will decide if 
    }
    
    override func onDataLoaded(data: [Note]) {
        print("Data loaded")
        view?.display(data: data)
    }
    
    override func onDataError() {
        print("Data error")
        view?.displayError()
    }
}
