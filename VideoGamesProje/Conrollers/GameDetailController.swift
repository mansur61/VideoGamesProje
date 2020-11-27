//
//  GameDetailController.swift
//  VideoGamesProje
//
//  Created by Mansur Emin  Kaya on 25.11.2020.
//  Copyright © 2020 Mansur Emin  Kaya. All rights reserved.
//

import UIKit

var favList:[String:String] = [:]

class GameDetailController: UIViewController,GetGameDetailsDelegate {

    @IBOutlet weak var imageDetay: UIImageView!
    @IBOutlet weak var gameNameDetay: UILabel!
    @IBOutlet weak var released_metacriticRate: UILabel!
    @IBOutlet weak var gameDescription: UITextView!
    
    var detailsSource = GetGameDetailsSource(baseUrl: "https://api.rawg.io/api/")
    var nameImage=""
    var gameNameDetayGetir = ""
    var rele_Met = ""
    var aciklama = ""
    
    var getGameDetailsArray:getGameDetailsInfo!
    override func viewDidLoad() {
        detailsSource.delegate=self
        print("Anasayfadan geldim name ->\(nameImage) ")
        super.viewDidLoad()

       // imageDetay.image = UIImage.init(data: try! Data.init(contentsOf: URL(string: (nameImage))!))
        gameNameDetay?.text! = gameNameDetayGetir
        released_metacriticRate?.text! = rele_Met
        gameDescription?.text! = aciklama
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        detailsSource.getGameDetails(ismeGoreGetir: nameImage)
        
    }
    func getGameDetailsState(getGameDetails: getGameDetailsInfo) {
        self.getGameDetailsArray = getGameDetails
        
    }
    
    
    @IBAction func foveriButton(_ sender: Any) {
        print("Fav Button Tılanıldı")
        //print(self.getGameDetailsArray as? Any)
        let params = [
            "iamgeUrl":"\(nameImage)",
            "oyunAdi":"\(gameNameDetayGetir)",
            "rele_Met":"\(rele_Met)",
           
        ]
        
        favList = params
        //print("favList: ",favList)
        //alertMesaj(mesaj:"Favorilerde Gör")
      
            self.performSegue(withIdentifier: "detayAktar", sender: nil)
       
    }
    
    func alertMesaj(mesaj:String){
        let alert = UIAlertController(title: "Favorilere Eklendi", message: mesaj, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "TAMAM", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            
        }))
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.destination is FavorilerConroller){
            let favController = segue.destination as! FavorilerConroller
            favController.favListAl = favList
            
            favController.resimAl = String(describing: favList["iamgeUrl"] )
            favController.playGame = String(describing:favList["oyunAdi"] )
            favController.relMat = String(describing:favList["rele_Met"] )
        }
        else{
            print("Gidilecek controller bulunamadı")
        }
        
    }
}
