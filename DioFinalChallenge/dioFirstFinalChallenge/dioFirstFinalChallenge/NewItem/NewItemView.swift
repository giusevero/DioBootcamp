//
//  NewItemView.swift
//  DioFirstFinalChallenge
//
//  Created by Giugliano Severo on 12/09/23.
//

import UIKit

protocol NewItemViewDelegate {
    func addNewItem(item: Item)
}

class NewItemView: UIView {
    
    var delegate: NewItemViewDelegate?
    
    lazy var nameTextView: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var qntTextView: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var typePickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
        typePickerView.delegate = self
        typePickerView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func addNewItem() {
        let typeRow = typePickerView.selectedRow(inComponent: 0)

        let item = Item(name: nameTextView.text ?? String(),
                        qnt: Int(qntTextView.text ?? String(0)) ?? 0,
                        type: ItemType.allCases[typeRow])
        delegate?.addNewItem(item: item)
    }
    
}

extension NewItemView: ViewCode {
    
    func addSubviews() {
        addSubview(nameTextView)
        addSubview(qntTextView)
        addSubview(typePickerView)
        addSubview(confirmButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameTextView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            nameTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            nameTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            nameTextView.heightAnchor.constraint(equalToConstant: 50),
            
            
            qntTextView.topAnchor.constraint(equalTo: nameTextView.bottomAnchor, constant: 50),
            qntTextView.leadingAnchor.constraint(equalTo: nameTextView.leadingAnchor),
            qntTextView.trailingAnchor.constraint(equalTo: nameTextView.trailingAnchor),
            qntTextView.heightAnchor.constraint(equalToConstant: 50),
            
            typePickerView.topAnchor.constraint(equalTo: qntTextView.bottomAnchor, constant: 50),
            typePickerView.leadingAnchor.constraint(equalTo: nameTextView.leadingAnchor),
            typePickerView.trailingAnchor.constraint(equalTo: nameTextView.trailingAnchor),
            typePickerView.heightAnchor.constraint(equalToConstant: 90),
            
            confirmButton.topAnchor.constraint(equalTo: typePickerView.bottomAnchor, constant: 50),
            confirmButton.heightAnchor.constraint(equalToConstant: 40),
            confirmButton.widthAnchor.constraint(equalToConstant: 100),
            confirmButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
    }
    
    func setupStyle() {
        nameTextView.keyboardType = .default
        nameTextView.placeholder = "Item name"
        nameTextView.borderStyle = .roundedRect
        
        qntTextView.keyboardType = .numberPad
        qntTextView.placeholder = "Item quantity(Only digits)"
        qntTextView.borderStyle = .roundedRect
        
        confirmButton.setTitle("Confirmar", for: .normal)
        confirmButton.backgroundColor = . blue
        confirmButton.addTarget(self, action: #selector(addNewItem), for: .touchUpInside)
        
        backgroundColor = .white
        
    }
    
}

extension NewItemView: UIPickerViewDelegate {
    
}

extension NewItemView: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ItemType.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ItemType.allCases[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        print("\(ItemType.allCases[row].rawValue)")
    }
}

