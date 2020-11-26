//
//  getGameDetailsInfo.swift
//  VideoGames
//
//  Created by Mansur Emin  Kaya on 24.11.2020.
//  Copyright © 2020 Mansur Emin  Kaya. All rights reserved.
//

import Foundation

struct getGameDetailsInfo: Decodable {
    let id: Int?
    let slug:String?
    let name:String?
    let name_orinigal:String?
    let description:String?
    let metacritic:String?
    //let metacritic_platforms:[MetacriticPlatform]
    let released:String?
    let tba:String?
    let updated:String?
    let background_image:String?
    let background_image_additional:String?
    let website:String?
    let rating:String?
    let rating_top:String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case slug = "slug"
        case name = "name"
        case name_orinigal = "name_orinigal"
        case description = "description"
        case metacritic = "metacritic"
        case released = "released"
        case tba = "tba"
        case updated = "updated"
        case background_image = "background_image"
        case background_image_additional = "background_image_additional"
        case website = "website"
        case rating = "rating"
        case rating_top = "rating_top"
    }
}
/*
struct MetacriticPlatform:Decodable {
    
}
*/
