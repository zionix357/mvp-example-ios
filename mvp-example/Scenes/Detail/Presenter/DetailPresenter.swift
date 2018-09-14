//
//  DetailPresenter.swift
//  mvp-example
//
//  Created by Arthur Rocha on 13/09/2018.
//

import UIKit

class DetailPresenter {
    
    private(set) weak var view: DetailPresenterView?
    private(set) var router : DetailPresenterRouter
    
    var list : ListMock?
    
    init(view: DetailPresenterView, router: DetailPresenterRouter) {
        self.view = view
        self.router = router
    }
    
    func viewDidLoad(){
        guard let list = list else {
            print("Alert Error...")
            return
        }
        view?.displayView(image: list.image)
        view?.displayView(name: list.name)
        view?.displayView(description: list.description)
    }
    
    // MARK: - Navigation
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.prepare(for: segue, sender: sender)
    }
}
