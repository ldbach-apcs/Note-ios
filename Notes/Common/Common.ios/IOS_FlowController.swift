//
//  IOS_FlowController.swift
//  Remember
//
//  Created by CPU12071 on 8/24/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import UIKit
class IOS_FlowController : IFlowController {
    private weak var window: UIWindow?
    private weak var repo: IRepository<Note>?
    private weak var navigationController: UINavigationController?
    
    private var seeNotesPresenter: SeeNotesPresenter?
    
    init(window: UIWindow?, repo: IRepository<Note>?) {
        self.window = window
        self.repo = repo
        super.init()
    }
    
    override func run() {
        super.run()
        let controller: UIViewController & SeeNotesView = SeeNotesViewController()
        seeNotesPresenter = SeeNotesPresenter(repo: repo, view: controller, flowController: self)
        controller.setSeeNotesPresenter(presenter: seeNotesPresenter!)
        navigationController = UINavigationController(rootViewController: controller)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    override func navigateToList(newNote: Note, toRemove: Int64?) {
        seeNotesPresenter?.onNewNoteAdded(added: newNote, toRemove: toRemove)
        navigationController?.popViewController(animated: true)
    }
    
    override func navigateToAdd(itemToEdit id: Int64?) {
        let controller: UIViewController & AddNoteView = AddNoteViewController()
        let presenter = AddNotesPresenter(repo: repo, view: controller, flowController: self, idToLoad: id)
        controller.setAddNotePresenter(presenter: presenter)
        navigationController?.pushViewController(controller, animated: true)
    }
}
