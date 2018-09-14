//
//  ListPresenterRouter.swift
//  mvp-example
//
//  Created by Arthur Rocha on 13/09/2018.
//

import UIKit

let createSegue = "CreateSegue"
let detailSegue = "DetailSegue"

class ListPresenterRouter {
    
    private weak var viewController : ListController?
    
    init(viewController: ListController) {
        self.viewController = viewController
    }
    
    func presentCreateScreen(){
        viewController?.performSegue(withIdentifier: createSegue, sender: nil)
    }
    
    func presentDetailScreen(list: ListMock){
        viewController?.performSegue(withIdentifier: detailSegue, sender: list)
    }
    
    // MARK: - Navigation
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailController {
            detailVC.presenter.list = sender as? ListMock
        }
    }
}
