//
//  AddNotesPresenter.swift
//  Remember
//
//  Created by CPU12071 on 8/27/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import Foundation
class AddNotesPresenter : RepositoryDelegate<Note>, ViewToPresenterProtocol {
    let repo: IRepository<Note>?
    let view: AddNoteView?
    let flowController: IFlowController?
    let idToLoad: Double?
    
    init(repo: IRepository<Note>?, view: AddNoteView?, flowController: IFlowController?, idToLoad: Double?) {
        self.repo = repo
        self.view = view
        self.flowController = flowController
        self.idToLoad = idToLoad
    }

    func onViewReady() {
        if idToLoad != nil {
            repo?.loadSingleAsync(delegate: self, itemId: idToLoad!)
        } else {
            view?.displayNote(data: nil)
        }
    }
    
    override func onSingleDataLoaded(data: Note) {
        view?.displayNote(data: data)
    }
    
    override func onAddDone(added: Note) {
        flowController?.navigateToList(newNote: added, toRemove: idToLoad)
    }
    
    func handleRequest(request: NoteRequest) {
        if request.type == .add {
            if (request.item != nil) {
                repo?.addAsync(delegate: self, item: request.item!)
            }
        }
    }
}
