//
//  ListDestinationViewController.swift
//  ViajAI
//
//  Created by Felipe Miranda Santos on 30/09/23.
//

import UIKit

class ListDestinationViewController: UIViewController {
    @IBOutlet var presentationLabel: UILabel!
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var destinationTableView: UITableView!

    var destinationList: [Any] =
    [ListDestinationTitle(nameTitle: "Rio de Janeiro", id: "1"), ListDestination(place: "Rectangle 56", namePlace: "Raja Ampat", rating: "4.5/5.0", description: "Library device clip strikethrough move. Flows vector overflow style invite.", cityID: "1", ratingImage: "star.leadinghalf.filled"),
     ListDestination(place: "Rectangle 57", namePlace: "Sungai Baliem", rating: "4.5/5.0", description: "Library device clip strikethrough move. Flows vector overflow style invite.", cityID: "1", ratingImage: "star.leadinghalf.filled"), ListDestinationTitle(nameTitle: "Recife", id: "1"), ListDestination(place: "Rectangle 56", namePlace: "Raja Ampat", rating: "4.6/5.0", description: "Library device clip strikethrough move. Flows vector overflow style invite.", cityID: "1", ratingImage: "star.leadinghalf.filled"),
     ListDestination(place: "Rectangle 57", namePlace: "Sungai Baliem", rating: "4.5/5.0", description: "Library device clip strikethrough move. Flows vector overflow style invite.", cityID: "1", ratingImage: "star.leadinghalf.filled")]

    override func viewDidLoad() {
        super.viewDidLoad()
        configDestinationTableView()
        configElements()
    }

    func configDestinationTableView() {
        destinationTableView.delegate = self
        destinationTableView.dataSource = self
        destinationTableView.register(ListDestinationTableViewCell.nib(), forCellReuseIdentifier: ListDestinationTableViewCell.identifier)
        destinationTableView.register(TilteListDesinationTableViewCell.nib(), forCellReuseIdentifier: TilteListDesinationTableViewCell.identifier)
    }

    func configElements() {
        presentationLabel.text = "Meus Favoritos"
        presentationLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        presentationLabel.frame = CGRect(x: 0, y: 0, width: 174, height: 36)
        userImageView.image = UIImage(named: "Group 1930")
        userImageView.frame = CGRect(x: 50, y: 50, width: 48, height: 49)
    }
}

extension ListDestinationViewController: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return destinationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let destination = destinationList[indexPath.row]

        if let titleDestination = destination as? ListDestinationTitle {
            let cell = tableView.dequeueReusableCell(withIdentifier: TilteListDesinationTableViewCell.identifier, for: indexPath) as! TilteListDesinationTableViewCell
            cell.setupCell(listDestination: titleDestination)
            return cell
        } else if let regularDestination = destination as? ListDestination {
            let cell = tableView.dequeueReusableCell(withIdentifier: ListDestinationTableViewCell.identifier, for: indexPath) as! ListDestinationTableViewCell
            cell.setupCell(listDestination: regularDestination)
            return cell
        }

        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcString = String(describing: DetailsViewController.self)
        let vc = UIStoryboard(name: vcString, bundle: nil).instantiateViewController(withIdentifier: vcString) as? DetailsViewController
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }

}
