//
//  ViewController.swift
//  imageData
//
//  Created by JOEL CRAWFORD on 2/12/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //=====api end point===
        let urlstring = "https://ichuzz2work.com/api/services/categories"
        
        let url = URL(string: urlstring)
        guard url != nil else {
            return
        }
        //===session===
        let session = URLSession.shared
        //======data task====
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //====check for errors===
            if error == nil &&  data != nil {
                
                //=====parse the json===
                let decoder = JSONDecoder()
                
                do {
                    let categories =   try  decoder.decode(Categories.self, from: data!)
                    print(categories)
                    
                }
                catch {
                    print("Error in json")
                }
            }
            
        }
        //===make api call
        dataTask.resume()
    }
    
    
}

