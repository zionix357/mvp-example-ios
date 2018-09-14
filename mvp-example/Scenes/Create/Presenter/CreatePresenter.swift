//
//  CreatePresenter.swift
//  mvp-example
//
//  Created by Arthur Rocha on 13/09/2018.
//

import UIKit

class CreatePresenter {
    
    private(set) weak var view: CreatePresenterView?
    private(set) var router: CreatePresenterRouter
    
    init(view: CreatePresenterView, router: CreatePresenterRouter) {
        self.view = view
        self.router = router
    }
    
    func viewDidLoad(){
        print("validate something")
    }
    
    func onCreate(image: UIImage?, name: String, description: String){
        guard areFieldsValid(image: image, name: name, description: description) else {
            return
        }
        
        view?.displayView(feedback: "Cadastrando...")
        view?.startLoading()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.view?.stopLoading()
            self?.router.dismiss()
        }
    }
    
    private func areFieldsValid(image: UIImage?, name: String, description: String) -> Bool {
        guard let _ = image else {
            view?.displayView(feedback: "Selecione uma image")
            return false
        }
        
        guard name.count > 0 else {
            view?.displayView(feedback: "Digite o nome")
            return false
        }
        
        guard description.count > 0 else {
            view?.displayView(feedback: "Digite a descrição")
            return false
        }
        return true
    }
    
    // MARK: - Navigation
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.prepare(for: segue, sender: sender)
    }
}
