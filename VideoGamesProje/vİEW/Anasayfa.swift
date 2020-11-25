//
//  ViewController.swift
//  VideoGamesProje
//
//  Created by Mansur Emin  Kaya on 24.11.2020.
//  Copyright © 2020 Mansur Emin  Kaya. All rights reserved.
//

import UIKit



class Anasayfa: UIViewController,GetGameListDelegate {

    var getGameListArray:[getGameListInfo] = []
    var dataSource = GetGameListSource(baseUrl: "https://api.rawg.io/api/")
       
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //print("HELLOOOOOOOO")
        dataSource.delegete = self
        dataSource.getGameList(ismeGoreGeetir: "games?page=2")
        
        collection.dataSource = self
        collection.dataSource = self
        
        
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
       
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCollectionViewCell
        cell.gameAd.text = self.getGameListArray[indexPath.row].seo_title
        cell.rating_released.text = " \(String(describing: self.getGameListArray[indexPath.row].results[indexPath.row].rating)) -  \(String(describing: self.getGameListArray[indexPath.row].results[indexPath.row].released))"
        cell.resim.image = UIImage(systemName: "\(String(describing: self.getGameListArray[indexPath.row].results[indexPath.row].background_image))", withConfiguration: nil)
        
        return cell
    }
    
    
}

