//
//  ListService.swift
//  mvp-example
//
//  Created by Arthur Rocha on 13/09/2018.
//

import UIKit

class ListService {
    
    ///Singleton definition
    static let shared = ListService()
    
    func getList(completionHandler: @escaping([ListMock]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            completionHandler(ListMock.returnList())
        }
    }
}


///Pode colocar isso num arquivo próprio, estou simulando vindo do servidor os dados
class ListMock {
    var name: String
    var description: String
    var image: UIImage
    
    init(name: String, description: String, image: UIImage) {
        self.name = name
        self.description = description
        self.image = image
    }
    
    static func returnList() -> [ListMock]{
        return [
            ListMock(name: "iOS", description: "Melhor de todos", image: #imageLiteral(resourceName: "apple")),
            ListMock(name: "Android", description: "Mais ou menos", image: #imageLiteral(resourceName: "android")),
            ListMock(name: "Windows Phone", description: "Existe?", image: #imageLiteral(resourceName: "windows"))
        ]
    }
}
