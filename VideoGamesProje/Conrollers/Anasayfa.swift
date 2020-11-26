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
       
    let data=["mansur","yunus","ali","veli","araba","filiz","celil"]
    var filterData: [String]!
    
    let imageResim = ["kalp.png","kus.png"]
    
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var pageControl: UIPageControl!
     @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        filterData=data
       // print("HELLOOOOOOOO")
        dataSource.delegate = self
        
        searchBar.delegate = self
        scrollView.delegate = self
        collection.delegate = self
        collection.dataSource = self
        
        pageControl.numberOfPages = imageResim.count
        
        for i in 0..<imageResim.count{
            let imageView = UIImageView()
            imageView.contentMode = .scaleToFill
            imageView.image = UIImage(named: imageResim[i])
            let xPos = CGFloat(i)*self.view.bounds.size.width
            imageView.frame = CGRect(x:xPos,y:0,width:view.frame.size.width,height:scrollView.frame.size.height)
            scrollView.contentSize.width = view.frame.width*CGFloat(i+1)
            scrollView.addSubview(imageView)
            
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
     func getGameListState(getGameList: [getGameListInfo]) {
       
        self.getGameListArray=getGameList
       // print("getGameListArray :>" ,getGameListArray[0].seo_title!)
       // print("ilgili resim->",self.getGameListArray[0].results[0].background_image!)
        DispatchQueue.main.async {
            self.collection.reloadData()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
       // print("geldiii")
        
        dataSource.getGameList(ismeGoreGeetir: "games?page=2")
    }

}
extension Anasayfa:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        //print("You tapped me")
        let vc = storyboard?.instantiateViewController(identifier: "gameDetail") as? GameDetailController
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
}
extension Anasayfa:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterData.count//data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCollectionViewCell
        let index = indexPath.row
       
        cell.gameAd.text = self.filterData[index]
        cell.rating_released.text = " \(String(describing: self.filterData[index])) -  \(String(describing: self.filterData[index]))"
        
        /*
        if self.getGameListArray.count != 0 {
            cell.gameAd.text = self.getGameListArray[index].seo_title!
            cell.rating_released.text = " \(String(describing: self.getGameListArray[index].results[index].rating!)) -  \(String(describing: self.getGameListArray[index].results[index].released!))"
            
            // resim getirmede sıkıntı var bakılacak
            cell.resim.image = UIImage(contentsOfFile: "\(self.getGameListArray[index].results[index].background_image!)")
                //UIImage(systemName: "\(String(describing: ))", withConfiguration: nil)
                
            return cell
        }else{
            return cell
        }
        */
        return cell
    }
    
    
}
// search bar veri ve filtreleme ile alaklaı kısım
extension Anasayfa: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        filterData = []
        if searchText != "" && searchText.count >= 3{ // unit teste sok..
            for ad in data {
                if ad.lowercased().contains(searchText.lowercased()) {
                    filterData.append(ad)
                }
            }
        }else{
            
            filterData=data
            
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
