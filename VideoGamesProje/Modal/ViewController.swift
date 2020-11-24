//
//  ViewController.swift
//  VideoGames
//
//  Created by Mansur Emin  Kaya on 24.11.2020.
//  Copyright © 2020 Mansur Emin  Kaya. All rights reserved.
//

import UIKit


class ViewController: UIViewController,GetGameListDelegate {

    var getGameListArray:[getGameListInfo] = []
    var dataSource = GetGameListSource(baseUrl: "https://api.rawg.io/api/")
       
       
    override func viewDidLoad() {
        super.viewDidLoad()

        print("HELLOOOOOOOO")
        dataSource.delegete = self
        dataSource.getGameList(ismeGoreGeetir: "games?page=2")
        
        // Do any additional setup after loading the view.
    }
    
     func getGameListState(getGameList: [getGameListInfo]) {
       
        self.getGameListArray=getGameList
       
        /*DispatchQueue.main.async {
            
        }*/
    }

    

}
