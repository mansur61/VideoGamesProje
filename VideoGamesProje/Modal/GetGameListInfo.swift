//
//  GetGameListInfo.swift
//  VideoGames
//
//  Created by Mansur Emin  Kaya on 24.11.2020.
//  Copyright © 2020 Mansur Emin  Kaya. All rights reserved.
//

import Foundation

struct getGameListInfo: Decodable {
    
    let count:Int?
    let next:String?
   // let previous:String?
    let results:[ArrayResults]
    let seo_title:String?
    let seo_description:String?
    let seo_keywords:String?
    let seo_h1:String?
    let noindex:Bool?
    let nofollow:Bool?
    let description:String?
    let filters:Filters?
    let nofollow_collections:NoFollowCollection?
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case next = "next"
        //case previous = "previous"
        case results = "results"
        case seo_title = "seo_title"
        case seo_description = "seo_description"
        case seo_keywords = "seo_keywords"
        case seo_h1 = "seo_h1"
        case noindex = "noindex"
        case nofollow = "nofollow"
        case description = "description"
        case filters = "filters"
        case nofollow_collections = "nofollow_collections"
    }
    
}
struct Filters:Decodable {
    let years:[Yillar]
    
    enum CodingKeys: String, CodingKey {
        case years = "years"
    }
}
struct Yillar:Decodable {
    let from:Int?
    let to:Int?
    let filter:String?
    let years:Yillar_Years?
    
    enum CodingKeys: String, CodingKey {
        case from = "from"
        case to = "to"
        case filter = "filter"
        case years = "years" //nested var
    }
}
struct Yillar_Years:Decodable {
    let year:Int?
    let count:Int?
    let nofollow:Bool?
    
    enum CodingKeys: String, CodingKey {
        case year = "year"
        case count = "count"
        case nofollow = "nofollow"
    }
}
struct ArrayResults: Decodable {
    let id:Int?
    let slug:String?
    let name:String?
    let released:String?
    let tba:Bool?
    let background_image:String?
    let rating:Float?
    let rating_top:Int?
    let ratigns:[ArrayRatings] //result içinde
    let ratings_count:Int?
    let reviews_text_count:Int?
    let added:Int?
    let added_by_status:AddedStatus  //result içinde
    let metacritic:Int?
    let playtime:Int?
    let suggestions_count:Int?
    //let user_game:String?
    let reviews_count:Int?
    let saturated_color:String?
    let dominant_color:String?
    let platform:[Platfroms] //result içinde
    let parent_platforms:[ParentPlatform]
    let gender:[Gender]
    let stores:[Stores]
    let clip:Clip?
    let tags:[Tags]
    let short_screenshots:[ShortScreen]
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case slug = "slug"
        case name = "name"
        case released = "released"
        case tba = "tba"
        case background_image = "background_image"
        case rating = "rating"
        case rating_top = "rating_top"
        case ratigns = "ratigns"
       case ratings_count = "ratings_count"
       case reviews_text_count = "reviews_text_count"
       case added = "added"
        case added_by_status = "added_by_status"
         case metacritic = "metacritic"
        case playtime = "playtime"
        case suggestions_count = "suggestions_count"
       // case user_game = "user_game"
        case reviews_count = "reviews_count"
         case saturated_color = "saturated_color"
        case dominant_color = "dominant_color"
       case platform = "platform"
        case parent_platforms = "parent_platforms"
       case gender = "gender"
        case stores = "stores"
        case clip = "clip"
        case tags = "tags"
        case short_screenshots = "short_screenshots"
    }
    
}
struct ShortScreen:Decodable {
    let id:Int?
    let image:String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case image = "image"
    
    }
}
struct Tags:Decodable {
    let id:Int?
    let name:String?
    let slug:String?
    let language:String?
    let games_count:String?
    let image_background:String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case slug = "slug"
        case language = "language"
        case games_count = "games_count"
        case image_background = "image_background"
    }
}
struct Clip:Decodable {
     let clips:Clips?
    let video:String?
    let preview:String?
    enum CodingKeys: String, CodingKey {
        case clips = "clips"
        case video = "video"
        case preview = "preview"
       
    }
}
struct Clips:Decodable {
    
}
struct Stores:Decodable {
    let id:Int?
    let store:Store?
    let url_en:String?
    //let url_ru:String? null
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case store = "store"
        case url_en = "url_en"
    }
   
}
struct Store:Decodable {
    let id:Int?
    let name:String?
    let slug:String?
    let domain:Int?
    let games_count:String?
    let image_background:String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case slug = "slug"
        case domain = "domain"
        case games_count = "games_count"
        case image_background = "image_background"
    }
}
struct Gender:Decodable {
    let id:Int?
    let name:String?
    let slug:String?
    let games_count:Int?
    let image_background:String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case slug = "slug"
        case games_count = "games_count"
        case image_background = "image_background"
    }
}
struct ParentPlatform:Decodable {
    let platform:ParentPlatform_Platform?
    enum CodingKeys: String, CodingKey {
        case platform = "platform"
        
    }
}
struct ParentPlatform_Platform:Decodable {
    let id:Int?
    let name:String?
    let slug:String?
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case slug = "slug"
    }
}
struct Platfroms:Decodable {
    let platform:Platfrom?
    let released_at:String?
    let requirements_en:Requirements?
   // let requirements_ru:String? null bir değer
    enum CodingKeys: String, CodingKey {
        case platform = "platform"
        case released_at = "released_at"
        case requirements_en = "requirements_en"
    }
    
}
struct Requirements:Decodable {
    let minimum:String?
    let recommended:String?
   
    enum CodingKeys: String, CodingKey {
        case minimum = "minimum"
        case recommended = "recommended"
    }
}
struct Platfrom: Decodable{
     let id:Int?
       let name:String?
       let slug:String?
       let image:String?
       let year_end:String?
       let year_start:String?
        let games_count:Int?
       let image_background:String?
       
       enum CodingKeys: String, CodingKey {
           case id = "id"
           case name = "name"
           case slug = "slug"
           case image = "image"
           case year_end = "year_end"
           case year_start = "year_start"
           case games_count = "games_count"
           case image_background = "image_background"
       }
}
struct AddedStatus:Decodable {
    let yet:Int?
    let owned:Int?
    let beaten:Int?
    let toplay:Int?
    let dropped:Int?
    let playing:Int?
    
    enum CodingKeys: String, CodingKey {
        case yet = "yet"
        case owned = "owned"
        case beaten = "beaten"
        case toplay = "toplay"
        case dropped = "dropped"
        case playing = "playing"
    }
}
struct ArrayRatings:Decodable {
    let id:Int?
    let title:String?
    let count:Int?
    let percent:Float?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case count = "count"
        case percent = "percent"
        
    }
}
struct NoFollowCollection:Decodable {
    let stores:String?
    
    enum CodingKeys: String, CodingKey {
        case stores = "stores"
    }
}
