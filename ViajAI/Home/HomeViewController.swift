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
        Destination(titleDestination: "Rio de Janeiro", listImages: ["rio_praia_copacabana", "rio_ipanema", "rio_urca"], listSubtitles: ["Praia de Copacabana", "Praia de Ipanema", "Urca"], listDescripition: ["Praia linda", "Praia maravilhosa", "Lugar top"]),
        
        Destination(titleDestination: "Ceará", listImages: ["ceara_praia_futuro", "ceara_canoa_quebrada", "ceara_jeriquaquara"], listSubtitles: ["Praia do futuro", "Canoa quebrada", "Jeri"], listDescripition: ["Praia linda", "Praia top", "Lindo lugar"]),
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
        initialPhraseLabel.font = UIFont.boldSystemFont(ofSize: 18)
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
