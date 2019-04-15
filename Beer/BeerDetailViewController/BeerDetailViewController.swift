//
//  beerViewController.swift
//  Beer
//
//  Created by Hundily Cerqueira Silva on 09/04/19.
//  Copyright © 2019 Hundily Cerqueira Silva. All rights reserved.
//

import UIKit
import SDWebImage

protocol PunkBeerCollectionDelegate: class {
    func didLike(beer: Beer)
}

class BeerDetailViewController: UIViewController {

    @IBOutlet weak var textNameBeer: UILabel!
    @IBOutlet weak var textAbv: UILabel!
    @IBOutlet weak var textIbu: UILabel!
    @IBOutlet weak var textTagline: UILabel!
    @IBOutlet weak var textDescription: UILabel!
    @IBOutlet weak var image: UIImageView!
//    @IBAction weak var buttonDetail: UIButton!
    
    var beer: Beer
    
    weak var delegate: PunkBeerCollectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDetails()
    }
    
    init(beer: Beer) {
        self.beer = beer
        super.init(nibName: "BeerDetailViewController", bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDetails(){
        textNameBeer.text = beer.name!
        guard let abv = beer.abv as? String else { return }
//        guard let ibu = beer.ibu as? String else { return }
        textAbv.text = abv
//        textIbu.text = ibu
        textTagline.text = String(beer.tagline!)
        textDescription.text = beer.desc
    
        let imageUrl = URL(string: beer.imageUrl!)
        image.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "placeholder.jpeg"))
    }
    
    @IBAction private func buttonDetailBeer(_ sender: Any){
        self.delegate?.didLike(beer: self.beer)
    }
}
