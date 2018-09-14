//
//  ListController.swift
//  mvp-example
//
//  Created by Arthur Rocha on 13/09/2018.
//

import UIKit

let listCellNibName = "ListCell"

class ListController: UITableViewController {
    
    lazy var presenter : ListPresenter = {
        let p = ListPresenter(
            view: self,
            router: ListPresenterRouter(viewController: self))
        return p
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configuratorTableView()
        presenter.viewDidLoad()
    }

    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    
    private func configuratorTableView(){
        tableView.register(UINib(nibName: listCellNibName, bundle: .main), forCellReuseIdentifier: ListCell.identifier)
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    @IBAction func onCreateTapButton(_ sender: Any) {
        presenter.onCreatePressed()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.identifier, for: indexPath) as! ListCell
        presenter.configure(cell, for: indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onDidSelectRowAt(for: indexPath.row)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.prepare(for: segue, sender: sender)
    }
}

extension ListController : ListPresenterView {
    func reloadData() {
        print(presenter.list.count)
        tableView.reloadData()
    }
    
    func startLoading() {
        print("start loading...")
    }
    
    func stopLoading() {
        print("stop loading!")
    }
}
