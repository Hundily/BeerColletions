//
//  BeersViewController.swift
//  Beer
//
//  Created by Hundily Cerqueira Silva on 09/04/19.
//  Copyright © 2019 Hundily Cerqueira Silva. All rights reserved.
//

import UIKit
import SDWebImage

class BeersViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let spancingBetweenItens: Int = 5
    let numberOfItensPerLine: Int = 2
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    private var presenter = PunkBeerPresenter()
    private var beerColletion: [Beer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cervejas"
        
        self.presenter.loadBeears { (response) in
            self.beerColletion = response
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            print(response)
        }
        
        setBeerCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? BeerCollectionViewCell {
            cell.delegate = self
        }
    }
    

    func setBeerCell () {
        let nib = UINib(nibName: "BeerCollectionViewCell", bundle: Bundle.main)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(nib, forCellWithReuseIdentifier: "beerCell")
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        let columns: Int = {
            var count = 2
            if traitCollection.horizontalSizeClass == .regular { count += 1 }
            if collectionView.bounds.width == collectionView.bounds.height { count += 1 }
            return count
        }()
        
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing + CGFloat(columns - 1 ))
        
        let width = Int((collectionView.bounds.width - totalSpace) / CGFloat(columns))
        return CGSize(width: CGFloat(width), height: traitCollection.verticalSizeClass == .compact ?
            UIScreen.main.bounds.size.height : UIScreen.main.bounds.size.height / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let beerDetail = beerColletion[indexPath.row]
//        let viewDetail = BeerDetailViewController(beer: beerDetail)
//
//         self.present(viewDetail, animated: true, completion: nil)
        
        print(indexPath.row)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(spancingBetweenItens)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beerColletion.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "beerCell" , for: indexPath) as! BeerCollectionViewCell
        
        cell.set(beer: beerColletion[indexPath.row])

        return cell
    }
}

extension BeersViewController: BeerCollectionViewCellDelegate {
    func showDetail(beer: Beer) {
        print("ola")
    }
}

