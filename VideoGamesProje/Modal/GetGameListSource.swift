//
//  GetGameList.swift
//  VideoGames
//
//  Created by Mansur Emin  Kaya on 24.11.2020.
//  Copyright © 2020 Mansur Emin  Kaya. All rights reserved.
//

import Foundation
import  Alamofire

protocol GetGameListDelegate {
    func getGameListState(getGameList: [getGameListInfo])
}

extension GetGameListDelegate{
    func getGameListState(getGameList: [getGameListInfo]){}
}

class  GetGameListSource: NSObject {
    
    var delegate:GetGameListDelegate?
    fileprivate var baseUrl = ""
    
    init(baseUrl:String) {
        self.baseUrl = baseUrl
    }
    
    func getGameList(ismeGoreGeetir:String){
       print(self.baseUrl+ismeGoreGeetir)
        
        AF.request(self.baseUrl+ismeGoreGeetir,method: .get,parameters: nil,encoding: URLEncoding.default,headers: nil,interceptor: nil).response { (responseData) in
            print("We got the response")
            print(responseData.result)
            guard let data = responseData.data else{return}
            
            /*if let jsonObj = try? JSONSerialization.jsonObject(with: data) as? NSDictionary {           //response
                print(jsonObj)
                
           }*/
               do{
                   
                   let getPosts = try JSONDecoder().decode(getGameListInfo.self, from: data)
                   //if getPosts.count != 0 {
                //print("getPostsUzunluk :>" ,getPosts.seo_title!)
                    self.delegate?.getGameListState(getGameList: [getPosts])
                   //}
       
               }catch{
                print("Api verileri ile uyuşmazlık olmuş olabilir..")
               }
            
        }
        
    }
    
    
}
