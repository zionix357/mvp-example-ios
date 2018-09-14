//
//  ListCell.swift
//  mvp-example
//
//  Created by Arthur Rocha on 13/09/2018.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet weak var listImageView: UIImageView!
    @IBOutlet weak var listIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var listNameLabel: UILabel!
    @IBOutlet weak var listDescriptionLabel: UILabel!
    
    ///This cell identifier
    class var identifier:String {
        return String(describing: type(of: ListCell.self))
    }
    
    override func awakeFromNib() { super.awakeFromNib() }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension ListCell : ListCellPresenterView {
    func startLoadingCell() {
        listIndicatorView.startAnimating()
    }
    
    func stopLoadingCell() {
        listIndicatorView.stopAnimating()
        listIndicatorView.isHidden = true
    }
    
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
