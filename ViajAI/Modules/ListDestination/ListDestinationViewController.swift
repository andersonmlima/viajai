//
//  ListDestinationViewController.swift
//  ViajAI
//
//  Created by Felipe Miranda Santos on 30/09/23.
//

import UIKit

class ListDestinationViewController: UIViewController {
    
    
    @IBOutlet weak var presentationLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var destinationTableView: UITableView!
    
    var destinationList: [Any] =
                        [ListDestinationTitle(nameTitle: "Rio de Janeiro", id: "1"), ListDestination(place: "Rectangle 56", namePlace: "Raja Ampat", rating: "4.5/5.0", description: "Library device clip strikethrough move. Flows vector overflow style invite.", cityID: "1"),
                        ListDestination(place: "Rectangle 57", namePlace: "Sungai Baliem", rating: "4.5/5.0", description: "Library device clip strikethrough move. Flows vector overflow style invite.", cityID: "1")]
    
    
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
        if indexPath.row == 0 {
            guard let cell = destinationTableView.dequeueReusableCell(withIdentifier: TilteListDesinationTableViewCell.identifier, for: indexPath) as? TilteListDesinationTableViewCell else {
                return UITableViewCell()
            }
            cell.setupCell(listDestination: destinationList[indexPath.row] as! ListDestinationTitle)
            return cell
        } else {
            guard let cell = destinationTableView.dequeueReusableCell(withIdentifier: ListDestinationTableViewCell.identifier, for: indexPath) as? ListDestinationTableViewCell else {
                return UITableViewCell()
            }
                cell.setupCell(listDestination: destinationList[indexPath.row] as! ListDestination)
                return cell
        }


    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
}
