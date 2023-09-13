//
//  MainTableViewController.swift
//  DioFirstFinalChallenge
//
//  Created by Giugliano Severo on 11/09/23.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    @IBOutlet weak var addItemBarButton: UIBarButtonItem!
    
    var itemsList: Items = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
        tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "MainTableViewCell")
        addItemBarButton.target = self
        addItemBarButton.action = #selector(addItem)
        tableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemList.shared.itemList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath)
                as? MainTableViewCell else { return UITableViewCell() }

        cell.setup(item: ItemList.shared.itemList[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Item selected: \(itemsList[indexPath.row])")
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ItemList.shared.removeItem(row: indexPath.row)
            tableView.reloadData()
        }
    }
    
    @objc func addItem() {
        let vc = NewItemViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
