//
//  ViewController.swift
//  DioThirdFinalChallenge
//
//  Created by Giugliano Severo on 28/09/23.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var animationView: LottieAnimationView!
//    private var service: PersonaService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        service = PersonaService()
        setupAnimation()
        getAllPersonas()
    }


    private func setupAnimation() {
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 1
        animationView.play()
    }
    
    private func getAllPersonas() {
        Task(priority: .background) {
            let result = await PersonaRepository.shared.service.getAllPersonas(page: nil)
            switch result {
            case .success(let success):
                PersonaRepository.shared.lastPage = success.info!
                PersonaRepository.shared.personas = success.results!
            case .failure(let failure):
                print(failure)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
                
                self.performSegue(withIdentifier: "goToPersonas", sender: self)
            })
            
        }
    }

}
