//
//  GetGameListInfo.swift
//  VideoGames
//
//  Created by Mansur Emin  Kaya on 24.11.2020.
//  Copyright © 2020 Mansur Emin  Kaya. All rights reserved.
//

import Foundation

struct getGameListInfo: Decodable {
    
    var count:Int?
    var next:String?
   // var previous:String?
    var results:[ArrayResults]
    var seo_title:String?
    var seo_description:String?
    var seo_keywords:String?
    var seo_h1:String?
    var noindex:Bool?
    var nofollow:Bool?
    var description:String?
    //var filters:Filters?
   // var nofollow_collections:NoFollowCollection?
    
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
        //case filters = "filters"
        //case nofollow_collections = "nofollow_collections"
    }
    
}
/*
struct Filters:Decodable {
    var years:[Yillar]
    
    enum CodingKeys: String, CodingKey {
        case years = "years"
    }
}
struct Yillar:Decodable {
    var from:Int?
    var to:Int?
    var filter:String?
    var years:Yillar_Years?
    
    enum CodingKeys: String, CodingKey {
        case from = "from"
        case to = "to"
        case filter = "filter"
        case years = "years" //nested var
    }
}
struct Yillar_Years:Decodable {
    var year:Int?
    var count:Int?
    var nofollow:Bool?
    
    enum CodingKeys: String, CodingKey {
        case year = "year"
        case count = "count"
        case nofollow = "nofollow"
    }
}
 */
struct ArrayResults: Decodable {
    var id:Int?
    var slug:String?
    var name:String?
    var released:String?
    var tba:Bool?
    var background_image:String?
    var rating:Float?
    var rating_top:Int?
    //var ratigns:[ArrayRatings] // result içinde, Bunu çalıştıramdık, bakılacak tekrar
    var ratings_count:Int?
    var reviews_text_count:Int?
    var added:Int?
    var added_by_status:AddedStatus?  //result içinde
    var metacritic:Int?
    var playtime:Int?
    var suggestions_count:Int?
    //var user_game:String? null olacak
    var reviews_count:Int?
    var saturated_color:String?
    var dominant_color:String?
    //var platforms:[Platforms] //result içinde, Bunu düzelteceğiz
    var parent_platforms:[ParentPlatform]
    var genres:[Genres]
    var stores:[Stores]
    var clip:Clip?
   var tags:[Tags]
    var short_screenshots:[ShortScreen]
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case slug = "slug"
        case name = "name"
        case released = "released"
        case tba = "tba"
        case background_image = "background_image"
        case rating = "rating"
        case rating_top = "rating_top"
        //case ratigns = "ratigns"
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
       //case platforms = "platforms"
        case parent_platforms = "parent_platforms"
       case genres = "genres"
       case stores = "stores"
         case clip = "clip"
        case tags = "tags"
        case short_screenshots = "short_screenshots"

    }
    
}

struct ShortScreen:Decodable {
    var id:Int?
    var image:String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case image = "image"
    
    }
}

struct Tags:Decodable {
    var id:Int?
    var name:String?
    var slug:String?
    var language:String?
    var games_count:Int?
    var image_background:String?
    
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
     //var clips:Clips?
    var video:String?
    var preview:String?
    enum CodingKeys: String, CodingKey {
        //case clips = "clips"
        case video = "video"
        case preview = "preview"
       
    }
}
/*
struct Clips:Decodable {
    
}
 */
   
struct Stores:Decodable {
    var id:Int?
    //var store:Store? // Burda bir sıkıntı oldu,düzeltilecek
    var url_en:String?
    //var url_ru:String? null
    enum CodingKeys: String, CodingKey {
        case id = "id"
       // case store = "store"
        case url_en = "url_en"
    }
   
}
/*
struct Store:Decodable {
    var id:Int?
    var name:String?
    var slug:String?
    var domain:String?
    var games_count:String?
    var image_background:String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case slug = "slug"
        case domain = "domain"
        case games_count = "games_count"
        case image_background = "image_background"
    }
}
 */

struct Genres:Decodable {
    var id:Int?
    var name:String?
    var slug:String?
    var games_count:Int?
    var image_background:String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case slug = "slug"
        case games_count = "games_count"
        case image_background = "image_background"
    }
}
 
struct ParentPlatform:Decodable {
    var platform:ParentPlatform_Platform?
    enum CodingKeys: String, CodingKey {
        case platform = "platform"
        
    }
}

struct ParentPlatform_Platform:Decodable {
    var id:Int?
    var name:String?
    var slug:String?
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case slug = "slug"
    }
}
/*
struct Platforms:Decodable {
    var platform:Platfrom?
    var released_at:String?
   // var requirements_en:Requirements?
   // var requirements_ru:String? null bir değer
    enum CodingKeys: String, CodingKey {
        case platform = "platform"
        case released_at = "released_at"
     //   case requirements_en = "requirements_en"
    }
    
}
 */
/*
struct Requirements:Decodable {
    var minimum:String?
    var recommended:String?
   
    enum CodingKeys: String, CodingKey {
        case minimum = "minimum"
        case recommended = "recommended"
    }
}*/
/*
struct Platfrom: Decodable{
      var id:Int?
       var name:String?
       var slug:String?
       var image:String?
       var year_end:String?
       var year_start:String?
        var games_count:Int?
       var image_background:String?
       
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
 */
struct AddedStatus:Decodable {
    var yet:Int?
    var owned:Int?
    var beaten:Int?
    var toplay:Int?
    var dropped:Int?
    var playing:Int?
    
    enum CodingKeys: String, CodingKey {
        case yet = "yet"
        case owned = "owned"
        case beaten = "beaten"
        case toplay = "toplay"
        case dropped = "dropped"
        case playing = "playing"
    }
}
 /*
struct ArrayRatings:Decodable {
    var id:Int?
    var title:String?
    var count:Int?
    var percent:Double?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case count = "count"
        case percent = "percent"
        
    }
}
 */
/*
struct NoFollowCollection:Decodable {
    var stores:String?
    
    enum CodingKeys: String, CodingKey {
        case stores = "stores"
    }
}
 */
