//
//  NewItemViewController.swift
//  DioFirstFinalChallenge
//
//  Created by Giugliano Severo on 12/09/23.
//

import UIKit

class NewItemViewController: UIViewController {
    
    lazy var newItemView: NewItemView = {
        let view = NewItemView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        super.loadView()
        newItemView.delegate = self
        self.view = newItemView
        
    }

}

extension NewItemViewController: NewItemViewDelegate {
    
    func addNewItem(item: Item) {
        ItemList.shared.addItem(item: item)
        navigationController?.popViewController(animated: true)
    }
}
