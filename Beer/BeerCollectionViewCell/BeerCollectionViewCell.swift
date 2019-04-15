//
//  BeerCollectionViewCell.swift
//  Beer
//
//  Created by Hundily Cerqueira Silva on 09/04/19.
//  Copyright © 2019 Hundily Cerqueira Silva. All rights reserved.
//

import UIKit
import SDWebImage

protocol BeerCollectionViewCellDelegate: class {
    func showDetail(beer: Beer)
}

class BeerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageBeer: UIImageView!
    @IBOutlet weak var labelPrice: UILabel!
    
    weak var delegate: BeerCollectionViewCellDelegate?
    var beer: Beer
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(){
        super.init(frame: CGRectZero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(beer: Beer){
        let imageUrl = URL(string: beer.imageUrl!)
        
        labelName.text = beer.name
        labelPrice.text = beer.desc
        imageBeer.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "placeholder.jpeg"))
    }
    
    @IBAction private func buttonDetailBeer(_ sender: Any){
        self.delegate?.showDetail(beer: self.beer)
    }
    
}
