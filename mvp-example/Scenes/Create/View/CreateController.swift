//
//  CreateController.swift
//  mvp-example
//
//  Created by Arthur Rocha on 13/09/2018.
//

import UIKit

class CreateController: UIViewController {
    
    lazy var presenter : CreatePresenter = {
        let p = CreatePresenter(
            view: self,
            router: CreatePresenterRouter(viewController: self))
        return p
    }()
    
    @IBOutlet weak var listImageView: UIImageView!
    @IBOutlet weak var listNameTextField: UITextField!
    @IBOutlet weak var listDescriptionTextField: UITextField!
    @IBOutlet weak var listIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var listFeedbackLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureForm()
        presenter.viewDidLoad()
    }

    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    
    private func configureForm(){
        print("form validate something")
    }
    
    @IBAction func onCreateTapButton(_ sender: Any) {
        presenter.onCreate(image: listImageView.image,
                           name: listNameTextField.text ?? "",
                           description: listDescriptionTextField.text ?? "")
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.prepare(for: segue, sender: sender)
    }
}

extension CreateController : CreatePresenterView {
    func startLoading() {
        listIndicatorView.isHidden = false
        listIndicatorView.startAnimating()
    }
    
    func stopLoading() {
        listIndicatorView.stopAnimating()
        listIndicatorView.isHidden = true
    }
    
    func displayView(feedback: String) {
        listFeedbackLabel.isHidden = false
        listFeedbackLabel.text = feedback
    }
}
