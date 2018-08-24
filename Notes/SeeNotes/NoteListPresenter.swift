//
//  NoteListPresenter.swift
//  Remember
//
//  Created by CPU12071 on 8/24/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

class ListNotePresenter : RepositoryDelegate<Note> {
    typealias idType = String
    
    let repo: IRepository<Note, idType>?
    let view: IListNoteView?
    let flowController: IFlowController<idType>?
    
    init(repo: IRepository<Note, idType>?, view: IListNoteView?, flowController: IFlowController<idType>?) {
        self.repo = repo
        self.view = view
        self.flowController = flowController
    }
    
    func onViewReady() {
        repo?.loadAllAsync(delegate: self)
    }
    
    func handleRequest(request: NoteRequest<idType>) {
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
