//
//  PunkBeerPresent.swift
//  Beer
//
//  Created by Hundily Cerqueira Silva on 09/04/19.
//  Copyright © 2019 Hundily Cerqueira Silva. All rights reserved.
//

import UIKit
import Foundation

class PunkBeerPresenter: NSObject {
    
    override init() {
        super.init()
    }
    
    func loadBeears(callback: @escaping (([Beer])) -> Void){
        guard let url = URL(string: "https://api.punkapi.com/v2/beers") else { return }
        
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: urlRequest, completionHandler: {data, reponse, error in
            if error  == nil {
                let decoder = JSONDecoder()
                do {
                    let json = try decoder.decode([Beer].self, from: data!)
//                    print(json)
                    callback(json)
                }catch {
                    print("Deu merda")
                }
            }else{
                print(error)
            }
        })
        dataTask.resume()
    }
}
