//
//  ViewController.swift
//  DioFirstFinalChallenge
//
//  Created by Giugliano Severo on 10/09/23.
//

import Lottie
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimation()
        goToTableView()
    }

    private func setupAnimation() {
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.7
        animationView.play()
    }
    
    private func goToTableView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
            self.performSegue(withIdentifier: "goToTableView", sender: self)
        })
    }
}

