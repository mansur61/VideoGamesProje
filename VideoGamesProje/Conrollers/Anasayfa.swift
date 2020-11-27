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


    // Modals
    var data=["",""]
    var dataVeri:[String] = []
    var filterData: [String]!
    var imageCell: [String] = []
    let silider = SiliderPagesData()
    var getGameListArray:getGameListInfo?
    var dataSource = GetGameListSource(baseUrl: "https://api.rawg.io/api/")
    
    // Views
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var uyariLabel: UILabel!
    
    //Conrollers
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
        
        if let total = self.getGameListArray?.results.count {
            for i in 0..<total {
                self.imageCell.append(self.getGameListArray!.results[i].background_image!)
                self.dataVeri.append(self.getGameListArray!.results[i].name!)
            }
        }
        filterData = self.dataVeri
    
            DispatchQueue.main.async {
            let toplam = self.getGameListArray!.results.count
           
                if toplam >= self.imageCell.count {
                    self.silider.siliderPages(resimler: self.imageCell,scrollView: self.scrollView,pageControl: self.pageControl)
                }

            self.collection.reloadData()
        }
    }
    
 
    override func viewWillAppear(_ animated: Bool) {
        dataSource.getGameList(ismeGoreGeetir: "games?page=2")
        DispatchQueue.main.async {
            self.collection.reloadData()
        }
    }

}
extension Anasayfa:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(identifier: "gameDetail") as? GameDetailController
        
        if let gameNameDetayGetir = self.getGameListArray?.results[indexPath.row].name , let aciklama = self.getGameListArray?.description , let relesed = self.getGameListArray?.results[indexPath.row].released , let nameImage = self.getGameListArray?.results[indexPath.row].background_image ,let metirict = self.getGameListArray?.results[indexPath.row].metacritic  {
            
            print("oyunAdi:\(gameNameDetayGetir) -> aciklama: \(aciklama)",
                "-> \(nameImage) -> \(nameImage) -> relesed : \(relesed) -> metirict: \(metirict) ")
            
            
            vc!.nameImage = nameImage //self.getGameListArray!.results[indexPath.row].background_image!
            vc!.gameNameDetayGetir = gameNameDetayGetir//self.getGameListArray!.results[indexPath.row].name!
            vc!.rele_Met = "\(relesed)-\(metirict)"
            //String(describing: self.getGameListArray!.results[indexPath.row].released! + "-" + String(describing: self.getGameListArray!.results[indexPath.row].metacritic!) )
            vc!.aciklama = aciklama//self.getGameListArray!.description!
             
            
        }

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
        
       
        
        if let total = self.getGameListArray?.results.count {
            if total > indexPath.row {
              
               guard let oyunAdi = self.getGameListArray?.results[indexPath.row].name , let rating = self.getGameListArray?.results[indexPath.row].rating , let released = self.getGameListArray?.results[indexPath.row].released , let resim = self.getGameListArray?.results[indexPath.row].background_image else {
                      
                      return cell
                  }
                 // print("oyunAdi:\(oyunAdi) -> rating: \(rating) -> released :\(released) -> resim: \(resim)")
                  
                  cell.gameAd?.text = oyunAdi
                  cell.rating_released?.text = "\(released) - \(rating)"
                 cell.resim?.image = UIImage.init(data: try! Data.init(contentsOf: URL(string: (resim))!))
                 
               return cell
           }else{
                return cell
           }
        }else{
            return cell
        }
        
       
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

