//
//  PersonaViewController.swift
//  DioThirdFinalChallenge
//
//  Created by Giugliano Severo on 04/10/23.
//

import UIKit
import SDWebImage

class PersonaViewController: UIViewController {

    @IBOutlet weak var imagePersona: UIImageView!
    @IBOutlet weak var namePersona: UILabel!
    @IBOutlet weak var speciesPersona: UILabel!
    @IBOutlet weak var statusPersona: UILabel!
    @IBOutlet weak var lastLocationPersona: UILabel!
    @IBOutlet weak var originPersona: UILabel!
    @IBOutlet weak var qntOfEpisodesPersona: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getPersonaInfo()
    }
    
    private func getPersonaInfo() {
        let persona = PersonaRepository.shared.selectedPersona
        imagePersona.sd_setImage(with: URL(string: persona.image!), placeholderImage: UIImage(systemName: "person.circle.fill"))
        imagePersona.contentMode = .scaleAspectFit
        namePersona.text = "Name: \(persona.name!)"
        speciesPersona.text = "Species: \(persona.species!)"
        statusPersona.text = "Status: \(persona.status!.rawValue)"
        lastLocationPersona.text = "Last location: \(persona.location!.name!)"
        originPersona.text = "Origin: \(persona.origin!.name!)"
        qntOfEpisodesPersona.text = "Quantity of episodes: \(persona.episode!.count)"
    }
}
