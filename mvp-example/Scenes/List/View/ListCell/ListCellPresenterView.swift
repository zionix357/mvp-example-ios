//
//  ListCellPresenterView.swift
//  mvp-example
//
//  Created by Arthur Rocha on 13/09/2018.
//

import UIKit

protocol ListCellPresenterView: class {
    func startLoadingCell()
    func stopLoadingCell()
    
    func displayView(image: UIImage)
    func displayView(name: String)
    func displayView(description: String)
}
