//
//  GetGameDetails.swift
//  VideoGames
//
//  Created by Mansur Emin  Kaya on 24.11.2020.
//  Copyright © 2020 Mansur Emin  Kaya. All rights reserved.
//

import Foundation
import  Alamofire
protocol GetGameDetailsDelegate {
    func getGameDetailsState(getGameDetails: getGameDetailsInfo)
}

extension GetGameDetailsDelegate{
     func getGameDetailsState(getGameDetails: getGameDetailsInfo){}
}

class  GetGameDetailsSource: NSObject {
    
    var delegate : GetGameDetailsDelegate?
    
    fileprivate var baseUrl = ""
    
    init(baseUrl:String) {
        self.baseUrl = baseUrl
    }
    
    
    func getGameDetails(ismeGoreGetir:String){
        print(self.baseUrl+ismeGoreGetir)
        let params = ["game_pk":"\(ismeGoreGetir)"]
        print(params["game_pk"]!)
        /*
        AF.request(self.baseUrl+ismeGoreGetir,method: .get,parameters: params,encoding: URLEncoding.default,headers: nil,interceptor: nil).response { (responseData) in
           print("We got the response")
           print(responseData.result)
           guard let data = responseData.data else{return}
      
          do{
            let getPosts = try JSONDecoder().decode(getGameDetailsInfo.self, from: data)
            self.delegate?.getGameDetailsState(getGameDetails: getPosts)
        
          }catch{
            print("Api verileri ile uyuşmazlık olmuş olabilir..")
          }
       
       }
         */
           
    }
    
}
