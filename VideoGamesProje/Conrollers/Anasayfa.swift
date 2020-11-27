//
//  ViewController.swift
//  VideoGamesProje
//
//  Created by Mansur Emin  Kaya on 24.11.2020.
//  Copyright © 2020 Mansur Emin  Kaya. All rights reserved.
//

import UIKit

import  Foundation

class Anasayfa: UIViewController,GetGameListDelegate {

    var getGameListArray:getGameListInfo?
    var dataSource = GetGameListSource(baseUrl: "https://api.rawg.io/api/")
       
    var data=["",""]
    var dataVeri:[String] = []
    
    var veriJSON : [String:Any] = [:]
    
    var filterData: [String]!

    var imageCell: [String] = []
    
    let silider = SiliderPagesData()
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var pageControl: UIPageControl!
     @IBOutlet weak var scrollView: UIScrollView!
    
     @IBOutlet weak var uyariLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        filterData=data
       
        dataSource.delegate = self
        searchBar.delegate = self
        scrollView.delegate = self
        collection.delegate = self
        collection.dataSource = self
        
    }
    
     func getGameListState(getGameList: getGameListInfo) {
      
        self.getGameListArray=getGameList
        let bak = self.getGameListArray!.results.count
       
        for i in 0..<bak {
            self.imageCell.append(self.getGameListArray!.results[i].background_image)
            self.dataVeri.append(self.getGameListArray!.results[i].name!)
        }
       
        filterData = self.dataVeri
        
        for item in 0..<self.dataVeri.count {
            if self.dataVeri[item] == self.getGameListArray!.results[item].name!{
                       
             veriJSON = ["released":"\(self.getGameListArray!.results[item].released!)",
                  "rating":"\(self.getGameListArray!.results[item].rating!)",
                  "background_image":"\(self.getGameListArray!.results[item].background_image)"]
           // print("background_image: ",veriJSON["background_image"]!)
              }
          }
        print("veriJSON: ",veriJSON)
        
        //silider.siliderPages(resimler: self.imageCell,scrollView: self.scrollView,pageControl: self.pageControl)
        
            DispatchQueue.main.async {
                self.collection.reloadData()
            }
    }
    
 
    override func viewWillAppear(_ animated: Bool) {
        dataSource.getGameList(ismeGoreGeetir: "games?page=2")
        
    }

}
extension Anasayfa:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(identifier: "gameDetail") as? GameDetailController
        
        
        vc!.nameImage = self.getGameListArray!.results[indexPath.row].background_image
        vc!.gameNameDetayGetir = self.getGameListArray!.results[indexPath.row].name!
        vc!.rele_Met = String(describing: self.getGameListArray!.results[indexPath.row].released! + "-" + String(describing: self.getGameListArray!.results[indexPath.row].metacritic!) )
        vc!.aciklama = self.getGameListArray!.description!
        
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
}
extension Anasayfa:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print("filterData ,",filterData.count)
        return filterData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
  
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCollectionViewCell

        cell.gameAd.text! = String(describing: self.getGameListArray?.results[indexPath.row].name!)
        cell.rating_released.text = String(describing: self.getGameListArray!.results[indexPath.row].released! + "-" + String(describing: self.getGameListArray!.results[indexPath.row].rating!) )
        cell.resim.image = UIImage.init(data: try! Data.init(contentsOf: URL(string: self.getGameListArray!.results[indexPath.row].background_image )!))
        /*
        DispatchQueue.main.async {
          cell.resim.image = UIImage.init(data: try! Data.init(contentsOf: URL(string: "https://media.rawg.io/media/games/b7b/b7b8381707152afc7d91f5d95de70e39.jpg" )!))
        }
        */
        return cell
    }
}
// search bar veri ve filtreleme ile alaklaı kısım

extension Anasayfa: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //print("searchBar.text?.count",searchBar.text!.count)
        filterData = []
        if searchText != "" && searchText.count >= 3{ // unit teste sok..
            for ad in dataVeri{
                if ad.lowercased().contains(searchText.lowercased()) {
                    filterData.append(ad)
                }
            }
            if filterData.count == 0 {
                
                self.collection.isHidden = true
                self.uyariLabel.isHidden = false
            }
        
        }else{
            
            filterData=dataVeri
            self.uyariLabel.isHidden = true
            self.collection.isHidden = false
           
        }
         self.collection.reloadData()
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.text = ""
        if searchBar.text == "" {
            filterData=dataVeri
           self.uyariLabel.isHidden = true
            self.collection.isHidden = false
        }
         self.collection.reloadData()
    }
}


// page view kısmı
extension Anasayfa: UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        let page = scrollView.contentOffset.x/scrollView.frame.width
        pageControl.currentPage = Int(page)
    }
}
