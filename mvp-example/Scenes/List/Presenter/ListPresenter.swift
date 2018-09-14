//
//  ListPresenter.swift
//  mvp-example
//
//  Created by Arthur Rocha on 13/09/2018.
//

import UIKit

class ListPresenter {
    
    private(set) weak var view: ListPresenterView?
    private(set) var router: ListPresenterRouter!
    
    var list : [ListMock] = []
    
    init(view: ListPresenterView, router: ListPresenterRouter) {
        self.view = view
        self.router = router
    }
    
    func viewDidLoad(){
        print("ViewDidLoad Presenter!")
        view?.startLoading()
        ListService.shared.getList { [weak self] (list) in
            self?.view?.stopLoading()
            self?.list = list
            self?.view?.reloadData()
        }
    }
    
    func onDidSelectRowAt(for row: Int){
        router.presentDetailScreen(list: list[row])
    }
    
    func onCreatePressed(){
        router.presentCreateScreen()
    }
    
    func configure(_ cell:ListCellPresenterView, for row:Int) {
        cell.startLoadingCell()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            cell.displayView(image: self.list[row].image)
            cell.stopLoadingCell()
        }
        
        cell.displayView(name: list[row].name)
        cell.displayView(description: list[row].description)
    }
    
    // MARK: - Navigation
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.prepare(for: segue, sender: sender)
    }
}
