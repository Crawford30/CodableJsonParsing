//
//  ViewController.swift
//  imageData
//
//  Created by JOEL CRAWFORD on 2/12/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var Category: [Categories]?
    
    var pathToImages: NSString! = ""
    
    
    
    
    
    //=======Keep globals and outlets above viewDidLoad=============
    
    //--------------------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        // delegate and dataSource
        collectionView.delegate = self
        collectionView.dataSource = self
        
        super.viewDidLoad()
        
        buildPathToImages() // Will do what it says... this path is needed to show images in collecntionViewCells
        
        fetchCategory()
        
    }
    
    //--------------------------------------------------------------------------------------------------------
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = Category?.count {
            
            return count
            
        }
        
        return Category?.count ?? 0
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        // cell.categoryname.text = Category?[indexPath.item].getName(theName: data.name)
        
        //cell.categoryname.text = Category?[indexPath.item]
        return cell
        
    }
    
    //------------------------------------------------------------------------------------------------------------
    
    func fetchCategory() {
        // Define server side script URL
        let dataUrl = "https://ichuzz2work.com/api/services/categories"
        
        // Create URL Object
        guard let myUrl = URL(string: dataUrl ) else { return }
        
        //===session===
        let session  = URLSession.shared
        let dataTask = session.dataTask(with: myUrl ) { ( theData, response, error) in
            
            if error == nil && theData != nil {
                
                let decoder = JSONDecoder()  // Parse JSON
                
                do {
                    
                    let fetchedCategories = try decoder.decode(Categories.self, from: theData!)
                    
                    for data in fetchedCategories.data  { ///giving error
                        
                        self.fetchImage( theImage: data.image )
                        
                        // let name_label = fetchedCategories.data["name"]
                        self.getName(theName: data.name)
                        
                        
                        
                    }
                    
                    
                    
                    // Info in fetchedCategories must be stored globally so cellForItemAt can access it
                    
                    // reload collectionView on main UI thread
                    //=================reloloading the data in the collection view=======
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    
                    
                }
                    
                catch {
                    
                    print("Error in json")
                    
                }
                
            }
            
        }
        
        dataTask.resume() // Make sure task runs
        
    }
    
    //🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷
    
    func buildPathToImages() {
        
        // You have to build this code
        
        pathToImages = ""
        
        // Build path to app's Documents directory... then decide whether or not to store images
        // in a subdirectory ... unless it is desired to download the images every single time 
        
    }
    
    //🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷
    
    func fetchImage( theImage: String ) {
        
        // You have to build this code
        
        print(theImage)
        
        //        Extract just filename from the path
        //
        //        Is that file in the local Documents or Cache directory?
        //
        //        YES - We are done
        //
        //        NO - Fetch the image from URL and save it to Documents / Cache directory
        
        
        // Some sample Objective-C code to help get things started:
        
        //        NSURL *tempURL = [[NSURL alloc] initWithString:@"https://api.ichuzz2work.com/uploads/categories/cleaning.png"];
        //
        //        NSData *tempData = [[NSData alloc] initWithContentsOfURL:tempURL];
        //
        //        testImage.image = [UIImage imageWithData:tempData];
        
    }
    
    
    //======fetching name===
    
    func getName(theName: String) {
        print(theName)
    }
    
    
    
    
    
}

