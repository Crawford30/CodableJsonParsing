//
//  ViewController.swift
//  imageData
//
//  Created by JOEL CRAWFORD on 2/12/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = Category?.count {
            return count
        }
        return Category?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
    //=========================Not setting  the data  to be representd=======
//       cell.categoryname = Category?[indexPath.row].name
//        cell.categoryimageView = Category?[indexPath.row].image
        return cell
    }
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var Category: [Categories]?
    
    
    func fetchCategory() {
        // Define server side script URL
        let scriptUrl = "https://ichuzz2work.com/api/services/categories"
        
        // Create URL Ibject
        guard  let myUrl = URL(string: scriptUrl) else{ return}
        
        // Creaste URL Request
        var request = URLRequest(url:myUrl)
        
        // Set request HTTP method to GET. It could be POST as well
        request.httpMethod = "GET"
        // request.addValue("Token token=884288bae150b9f2f68d8dc3a932071d", forHTTPHeaderField: "Authorization")
        
        //===session===
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            
           // let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
           // print(str ?? "")
            
            //====check for errors===
            if error == nil &&  data != nil {
                //=====parse the json===
                let decoder = JSONDecoder()
                
                do {
                    let categories =   try  decoder.decode(Categories.self, from: data!)
                    
//                     for json in categories["data"]  { ///giving error
//
//                        if let Name = json["name"] as? String {
//                            print(Name)
//                        }
//
//                    }
//
                    
                }
                catch {
                    print("Error in json")
                }
            }
            
        }
        
        //===make api call
        dataTask.resume()
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchCategory()
        
        
    }
    
    
}

