//
//  HomeTableViewCell.swift
//  ViajAI
//
//  Created by Michael Bressiani on 30/09/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleDestinationLabel: UILabel!
    @IBOutlet weak var listDestinationCollectionView: UICollectionView!

    static let identifier: String = String(describing: HomeTableViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    var detailsList: [DetailsList] = []
    
//    var detailsList: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollection()
    }

    func configCollection() {
        listDestinationCollectionView.delegate = self
        listDestinationCollectionView.dataSource = self
        if let layout = listDestinationCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = .zero
        }
        listDestinationCollectionView.register(HomeCollectionViewCell.nib(), forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
    }
    
    func setupCell(destination: Destination) {
        self.titleDestinationLabel.text = destination.titleDestination
        
        self.detailsList = [DetailsList(listImages: destination.listImages,
                                        listSubtitles: destination.listSubtitles,
                                        listDescripition: destination.listDescripition)]
    }
}

extension HomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell
        cell?.setupCell(photoName: detailsList[indexPath.row].listImages[indexPath.row],subTitles: detailsList[indexPath.row].listSubtitles[indexPath.row], description: detailsList[indexPath.row].listDescripition[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
