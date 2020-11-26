//
//  FavorilerConroller.swift
//  VideoGamesProje
//
//  Created by Mansur Emin  Kaya on 26.11.2020.
//  Copyright © 2020 Mansur Emin  Kaya. All rights reserved.
//

import UIKit

class FavorilerConroller: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    
    
    var resimAl=""
    var playGame = ""
    var relMat = ""

    
    var favListAl:[String:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        collection.reloadData()
    }
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }

}
extension FavorilerConroller: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if favListAl.count == 0 {
            return 1
        }else {
            return favListAl.capacity / favListAl.count
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "favCell", for: indexPath) as! FavoriViewCellCollection
        
            guard  (self.favListAl["oyunAdi"] != nil) else { return cell}
            guard  (self.favListAl["rele_Met"] != nil) else { return cell}
            guard  (self.favListAl["iamgeUrl"] != nil) else { return cell}
        
            cell.favGameName?.text! = self.favListAl["oyunAdi"]!
            cell.favImage?.image = UIImage.init(data: try! Data.init(contentsOf: URL(string: (self.favListAl["iamgeUrl"]! ))!))
            cell.favRating_Released_Matrict?.text! = self.favListAl["rele_Met"]!
            
            return cell
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItenAt indexPath: IndexPath )-> CGSize{
        let size = (collectionView.frame.size.width) / 2
        return CGSize(width: size, height: size)
    }
}
