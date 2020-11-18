//
//  Struct.swift
//  GitFind_12
//
//  Created by Калинин Артем Валериевич on 22.10.2020.
//

import Foundation

import Foundation

struct GitStruct: Codable {
    var count = 0
    var findingRepo = [Repository]()
    
    private enum CodingKeys: String, CodingKey {
        case count = "total_count"
        case findingRepo = "items"
    }
    
    struct Repository: Codable {
        var name: String?
        var description: String?
        var url: String?
        var owner: Owner
        
        init(dictionary: [String: Any]) {
            name = dictionary["name"] as? String? ?? ""
            description = dictionary["description"] as? String? ?? ""
            url = dictionary["url"] as? String? ?? ""
            owner = dictionary["owner"] as! GitStruct.Repository.Owner
        }
        
        private enum CodingKeys: String, CodingKey {
            case name
            case description
            case url = "html_url"
            case owner
        }
        
        struct Owner: Codable {
            var login: String
            var avatar: String
            
            private enum CodingKeys: String, CodingKey {
                case login
                case avatar = "avatar_url"
            }
        }
    }
}


