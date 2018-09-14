//
//  CreatePresenterRouter.swift
//  mvp-example
//
//  Created by Arthur Rocha on 13/09/2018.
//

import UIKit

class CreatePresenterRouter {
    
    private weak var viewController: CreateController?
    
    init(viewController: CreateController) {
        self.viewController = viewController
    }
    
    func dismiss(){
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Navigation
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {}
}
