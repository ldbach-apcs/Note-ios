//
//  SeeNotesViewController.swift
//  Remember
//
//  Created by CPU12071 on 8/24/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import UIKit

class SeeNotesViewController: UIViewController, SeeNotesView {
    var presenter: SeeNotesPresenter?
    
    func setSeeNotesPresenter(presenter: SeeNotesPresenter) {
        self.presenter = presenter
    }

    func display(data: [Note]) {
        print("SeeNotesView: \(data)")
    }
    
    func displayError() {
        print("SeeNotesView: Error")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello world!")
    }

}
