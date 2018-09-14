//
//  DetailController.swift
//  mvp-example
//
//  Created by Arthur Rocha on 13/09/2018.
//

import UIKit

class DetailController: UIViewController {
    
    lazy var presenter : DetailPresenter = {
        let p = DetailPresenter(
            view: self,
            router: DetailPresenterRouter(viewController: self))
        return p
    }()
    
    @IBOutlet weak var listImageView: UIImageView!
    @IBOutlet weak var listNameLabel: UILabel!
    @IBOutlet weak var listDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}

extension DetailController : DetailPresenterView {
    func startLoading() { }
    
    func stopLoading() { }
    
    func displayView(image: UIImage) {
        listImageView.image = image
    }
    
    func displayView(name: String) {
        listNameLabel.text = name
    }
    
    func displayView(description: String) {
        listDescriptionLabel.text = description
    }
}
