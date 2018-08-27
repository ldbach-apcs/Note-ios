//
//  IFlowController.swift
//  Remember
//
//  Created by CPU12071 on 8/24/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import Foundation
class IFlowController {
    func navigateToAdd(itemToEdit id: Int64?) {}
    func navigateToList(newNote: Note, toRemove: Int64?) {}
    func run() {}
    
    init() { run() }
}
