//
//  PersonaTableViewCell.swift
//  DioThirdFinalChallenge
//
//  Created by Giugliano Severo on 02/10/23.
//

import UIKit
import SDWebImage

class PersonaTableViewCell: UITableViewCell {

    @IBOutlet weak var imagePersona: UIImageView!
    @IBOutlet weak var namePersona: UILabel!
    @IBOutlet weak var speciesPerssona: UILabel!
    @IBOutlet weak var originPersona: UILabel!
    @IBOutlet weak var statusPersona: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupStyle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupStyle() {
        imagePersona.clipsToBounds = true
        imagePersona.layer.cornerRadius = 40
    }
    
    internal func setup(persona: Persona) {
        imagePersona.sd_setImage(with: URL(string: persona.image!), placeholderImage: UIImage(systemName: "person.circle.fill"))
        namePersona.text = persona.name
        speciesPerssona.text = persona.species
        originPersona.text = persona.origin?.name
        let image =  UIImage(systemName: "circle.fill")?
            .withTintColor(persona.status?.color ?? .gray)
            .withRenderingMode(.alwaysOriginal)
        statusPersona.image = image
    }
    
}
