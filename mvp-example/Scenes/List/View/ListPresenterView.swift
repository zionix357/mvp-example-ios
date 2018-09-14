//
//  ListPresenterView.swift
//  mvp-example
//
//  Created by Arthur Rocha on 13/09/2018.
//

import Foundation

protocol ListPresenterView : class {
    func startLoading()
    func stopLoading()
    func reloadData()
}
