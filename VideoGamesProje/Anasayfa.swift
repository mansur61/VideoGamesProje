//
//  ViewController.swift
//  VideoGamesProje
//
//  Created by Mansur Emin  Kaya on 24.11.2020.
//  Copyright © 2020 Mansur Emin  Kaya. All rights reserved.
//

import UIKit

import UIKit


class Anasayfa: UIViewController,GetGameListDelegate {

    var getGameListArray:[getGameListInfo] = []
    var dataSource = GetGameListSource(baseUrl: "https://api.rawg.io/api/")
       
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //print("HELLOOOOOOOO")
        dataSource.delegete = self
        dataSource.getGameList(ismeGoreGeetir: "games?page=2")
        
        collectionView.delegate = self
        collectionView.dataSource=self
        
        // Do any additional setup after loading the view.
    }
    
     func getGameListState(getGameList: [getGameListInfo]) {
       
        self.getGameListArray=getGameList
        print("getGameListArray :>" ,getGameListArray[0].seo_title!)
        /*DispatchQueue.main.async {
            
        }*/
    }

}
extension Anasayfa:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("You tapped me")
    }
}
extension Anasayfa:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        
        return cell
    }
    
    
}

