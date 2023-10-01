//
//  HomeViewController.swift
//  ViajAI
//
//  Created by Michael Bressiani on 29/09/23.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var initialPhraseLabel: UILabel!
    
    @IBOutlet weak var principalsExperiencesTableView: UITableView!
    
    var destinations: [Destination] = [
        Destination(titleDestination: "Rio de Janeiro", listImages: ["rio_praia_copacabana", "rio_ipanema", "rio_urca"], listSubtitles: ["1", "2", "3"], listDescripition: ["12", "23", "45"]),
        
        Destination(titleDestination: "Ceará", listImages: ["ceara_praia_futuro", "ceara_canoa_quebrada", "ceara_jeriquaquara"], listSubtitles: ["1", "2", "3"], listDescripition: ["12", "23", "45"]),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        elementsConfig()
        configTableView()
    }
    
    func configTableView() {
        principalsExperiencesTableView.delegate = self
        principalsExperiencesTableView.dataSource = self
        principalsExperiencesTableView.register(HomeTableViewCell.nib(), forCellReuseIdentifier: HomeTableViewCell.identifier)
    }
    
    func elementsConfig() {
        initialPhraseLabel.text = "Principais experiências do ViajAÍ"
        initialPhraseLabel.font = UIFont.boldSystemFont(ofSize: 20)
        initialPhraseLabel.textColor = UIColor.black
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return destinations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        cell.setupCell(destination: destinations[indexPath.row])
        return cell

    }
}
