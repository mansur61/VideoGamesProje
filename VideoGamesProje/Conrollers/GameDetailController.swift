//
//  GameDetailController.swift
//  VideoGamesProje
//
//  Created by Mansur Emin  Kaya on 25.11.2020.
//  Copyright © 2020 Mansur Emin  Kaya. All rights reserved.
//

import UIKit

class GameDetailController: UIViewController,GetGameDetailsDelegate {

    @IBOutlet weak var imageDetay: UIImageView!
    @IBOutlet weak var gameNameDetay: UILabel!
    @IBOutlet weak var released_metacriticRate: UILabel!
    @IBOutlet weak var gameDescription: UITextView!
    
    var detailsSource = GetGameDetailsSource(baseUrl: "https://api.rawg.io/api/")
    var name=""
    var gameNameDetayGetir = ""
    var rele_Met = ""
    var aciklama = ""
    
    var getGameDetailsArray:getGameDetailsInfo!
    override func viewDidLoad() {
        detailsSource.delegate=self
        print("Anasayfadan geldim name ->\(name) ")
        super.viewDidLoad()

        imageDetay.image = UIImage.init(data: try! Data.init(contentsOf: URL(string: (name))!))
        gameNameDetay?.text! = gameNameDetayGetir
        released_metacriticRate?.text! = rele_Met
        gameDescription?.text! = aciklama
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        detailsSource.getGameDetails(ismeGoreGetir: name)
        
    }
    func getGameDetailsState(getGameDetails: getGameDetailsInfo) {
        self.getGameDetailsArray = getGameDetails
        
    }
    
    
    @IBAction func foveriButton(_ sender: Any) {
        print("Fav Button Tılanıldı")
        //print(self.getGameDetailsArray as? Any)
    }
    
    
}
