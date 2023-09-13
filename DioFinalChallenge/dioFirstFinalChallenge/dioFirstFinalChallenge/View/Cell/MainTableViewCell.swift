//
//  MainTableViewCell.swift
//  DioFirstFinalChallenge
//
//  Created by Giugliano Severo on 11/09/23.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var qntLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(item: Item) {
        nameLabel.text = item.name
        qntLabel.text = "Qnt: \(item.qnt)"
        typeLabel.text = "Tipo: \(item.type.rawValue)"
    }
    
}
