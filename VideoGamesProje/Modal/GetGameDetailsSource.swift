//
//  GetGameDetails.swift
//  VideoGames
//
//  Created by Mansur Emin  Kaya on 24.11.2020.
//  Copyright © 2020 Mansur Emin  Kaya. All rights reserved.
//

import Foundation

protocol GetGameDetailsDelegate {
    func getGameDetailsState(getGameDetails: [getGameDetailsInfo])
}

extension GetGameDetailsDelegate{
     func getGameDetailsState(getGameDetails: [getGameDetailsInfo]){}
}

class  GetGameDetailsSource: NSObject {
    
     var delegete : GetGameDetailsDelegate?
    func getGameDetails(ismeGoreGetir:String){
        
    }
    
}
