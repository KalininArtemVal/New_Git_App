//
//  NetworkManager.swift
//  GitFind_12
//
//  Created by Калинин Артем Валериевич on 02.11.2020.
//

import Foundation
import UIKit

class SearchNetwork {
    
    private let scheme = "https"
    private let host = "api.github.com"
    private let searchRepoPath = "/search/repositories"
    var searchField: String?
    var langueageFiewld: String?
    var switcher: Bool?
    
    
    init(searchField: String?, langueageFiewld: String?, switcher: Bool?) {
        self.searchField = searchField
        self.langueageFiewld = langueageFiewld
        self.switcher = switcher
    }
    
    //search request
    func searchRepositoriesRequest() -> URLRequest? {
        
        guard let searchName = searchField else {return nil}
        guard let searchLanguage = langueageFiewld else {return nil}
        
        var urlComponents = URLComponents()
        
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = searchRepoPath
        
        if switcher == true {
            urlComponents.queryItems = [
                URLQueryItem(name: "q", value: "\(searchName)+language:\(searchLanguage)+stars:>3"),
                URLQueryItem(name: "sort", value: "stars"),
                URLQueryItem(name: "order", value: "desc")
            ]
        } else {
            urlComponents.queryItems = [
                URLQueryItem(name: "q", value: "\(searchName)+language:\(searchLanguage)"),
                URLQueryItem(name: "order", value: "desc")
            ]
        }
        
        guard let url = urlComponents.url else {
            return nil
        }
        print("search request url:\(url)")
        let request = URLRequest(url: url)
        return request
    }
    
    
    //Get Data
    func getData(competiton: @escaping (GitStruct) -> Void) {
        
        guard let urlRequest = self.searchRepositoriesRequest() else {
            print("url request error")
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            //Error
            if let error = error {
                print(error.localizedDescription)
                return
            }
            //Response
            if let httpResponse = response as? HTTPURLResponse {
                print("http status code: \(httpResponse.statusCode)")
            }
            //Data
            guard let data = data else { return }
            
            do {
                let json = try JSONDecoder().decode(GitStruct.self, from: data)
                competiton(json)
                print(competiton)
            } catch {
                print("ERRoR")
            }
        }
        dataTask.resume()
    }
}
