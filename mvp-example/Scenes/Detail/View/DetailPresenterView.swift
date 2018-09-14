//
//  DetailPresenterView.swift
//  mvp-example
//
//  Created by Arthur Rocha on 13/09/2018.
//

import UIKit

protocol DetailPresenterView: class {
    func startLoading()
    func stopLoading()
    
    func displayView(image: UIImage)
    func displayView(name: String)
    func displayView(description: String)
}
