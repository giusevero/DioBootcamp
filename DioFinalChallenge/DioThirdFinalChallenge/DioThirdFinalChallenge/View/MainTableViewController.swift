//
//  MainTableViewController.swift
//  DioThirdFinalChallenge
//
//  Created by Giugliano Severo on 29/09/23.
//

import UIKit

class MainTableViewController: UITableViewController  {
 
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(PersonaTableViewCell.self, forCellReuseIdentifier: "PersonaTableViewCell")
        tableView.register(UINib(nibName: "PersonaTableViewCell", bundle: nil), forCellReuseIdentifier: "PersonaTableViewCell")
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
        return PersonaRepository.shared.personas.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonaTableViewCell",
                                                       for: indexPath) as? PersonaTableViewCell else { return UITableViewCell() }
        
        cell.setup(persona: PersonaRepository.shared.personas[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == PersonaRepository.shared.personas.count - 1 {
            if PersonaRepository.shared.lastPage.count! > PersonaRepository.shared.personas.count{
                getNextPage()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        PersonaRepository.shared.selectedPersona = PersonaRepository.shared.personas[indexPath.row]
        self.performSegue(withIdentifier: "goToPersona", sender: self)
    }
    
    private func getNextPage() {
        Task(priority: .background) {
            guard let pageString = PersonaRepository.shared.lastPage.next?.popLast(),
                  let page = pageString.wholeNumberValue else { return }
            
            let result = await PersonaRepository.shared.service.getAllPersonas(page: page)
            switch result {
            case .success(let success):
                PersonaRepository.shared.lastPage = success.info!
                PersonaRepository.shared.personas.append(contentsOf: success.results!)
                self.tableView.reloadData()
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
