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
    
    init(window: UIWindow?, repo: IRepository<Note>?) {
        self.window = window
        self.repo = repo
        super.init()
    }
    
    override func run() {
        super.run()
        let controller: UIViewController & SeeNotesView = SeeNotesViewController()
        let presenter = SeeNotesPresenter(repo: repo, view: controller, flowController: self)
        controller.setSeeNotesPresenter(presenter: presenter)
        navigationController = UINavigationController(rootViewController: controller)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    override func navigateToList() {
        print("IOS: NavigateToList")
    }
    
    override func navigateToAdd(itemToEdit id: Double?) {
        print("IOS: NavigateToAdd")
    }
}
