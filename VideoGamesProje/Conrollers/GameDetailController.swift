//
//  GameDetailController.swift
//  VideoGamesProje
//
//  Created by Mansur Emin  Kaya on 25.11.2020.
//  Copyright © 2020 Mansur Emin  Kaya. All rights reserved.
//

import UIKit

class GameDetailController: UIViewController {

    @IBOutlet weak var imageDetay: UIImageView!
    @IBOutlet weak var gameNameDetay: UILabel!
    @IBOutlet weak var released_metacriticRate: UILabel!
    @IBOutlet weak var gameDescription: UITextView!
    
    var name=""
    override func viewDidLoad() {
        
        print("viewDidLoad name ->\(name) ")
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    @IBAction func foveriButton(_ sender: Any) {
    }
    
    
}
