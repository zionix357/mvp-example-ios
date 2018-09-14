//
//  CreatePresenterView.swift
//  mvp-example
//
//  Created by Arthur Rocha on 13/09/2018.
//

import Foundation

protocol CreatePresenterView: class {
    func startLoading()
    func stopLoading()
    
    func displayView(feedback: String)
}
