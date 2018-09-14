//
//  DetailPresenterRouter.swift
//  mvp-example
//
//  Created by Arthur Rocha on 13/09/2018.
//

import UIKit

class DetailPresenterRouter {
    
    private weak var viewController: DetailController?
    
    init(viewController: DetailController) {
        self.viewController = viewController
    }
    
    // MARK: - Navigation
    func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
}
