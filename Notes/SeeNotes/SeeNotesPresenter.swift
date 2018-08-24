//
//  NoteListPresenter.swift
//  Remember
//
//  Created by CPU12071 on 8/24/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

class SeeNotesPresenter : RepositoryDelegate<Note> { 
    let repo: IRepository<Note>?
    let view: SeeNotesView?
    let flowController: IFlowController?
    
    init(repo: IRepository<Note>?, view: SeeNotesView?, flowController: IFlowController?) {
        self.repo = repo
        self.view = view
        self.flowController = flowController
    }
    
    func onViewReady() {
        repo?.loadAllAsync(delegate: self)
    }
    
    func handleRequest(request: NoteRequest) {
        let requestType = request.type
        let itemId = request.itemId
        switch requestType {
        case .delete:
            repo?.deleteAsync(itemId: itemId)
            break
        case .edit:
            flowController?.navigateToAdd(itemToEdit: itemId)
            break
        }
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
