//
//  ViewController.swift
//  VideoGamesProje
//
//  Created by Mansur Emin  Kaya on 24.11.2020.
//  Copyright © 2020 Mansur Emin  Kaya. All rights reserved.
//

import UIKit



class Anasayfa: UIViewController,GetGameListDelegate {

    var getGameListArray:getGameListInfo?
    var dataSource = GetGameListSource(baseUrl: "https://api.rawg.io/api/")
       
    var data=["",""]
    var dataVeri:[String] = []
    
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
            self.imageCell.append(self.getGameListArray!.results[i].background_image!)
            self.dataVeri.append(self.getGameListArray!.results[i].name!)
        }
        
        filterData = self.dataVeri
        
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
        
         let index = 0//indexPath.row
        
        vc!.nameImage=String(describing: imageCell[index] )  
        vc!.gameNameDetayGetir="mansur"
        vc!.rele_Met = "s"
        vc!.aciklama = "78"
        /*
         vc!.gameNameDetay.text = self.getGameListArray!.results[index].name!
         vc!.gameDescription!.text = self.getGameListArray!.description!
         vc!.imageDetay.image = UIImage(named: "\(self.imageCell[index])")
         */
        
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
        
        let index = indexPath.row
        
        cell.gameAd.text = self.filterData[index]
        cell.rating_released.text = " \(String(describing: self.filterData[index])) -  \(String(describing: self.filterData[index]))"
       // cell.resim.image = UIImage.init(data: try! Data.init(contentsOf: URL(string: (imageCell[index]))!))
      
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
