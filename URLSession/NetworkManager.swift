//
//  NetworkManager.swift
//  URLSession
//
//  Created by Saadet Şimşek on 28/03/2025.
//

import Foundation

class NetworkManager {
    let apiKey: String = "M_aNbXuIj6hcdUzpjRxZwQRVbIKfjXedhk82WGHqvMI"
    let url: String = "https://api.unsplash.com"
    //photos/random
    
    func sendRequest(query: String, completion: @escaping (String) -> Void){
        var urlComponents = URLComponents(string: url)
        urlComponents?.path = "/photos/random"
        
        urlComponents?.queryItems = [
            URLQueryItem(name: "client_id", value: "YqTlI7vTvZf2lQoUGz9iO54SDuziNICON3_YV6tiGr4"), //access key
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "orientation", value: "landscape")
        ]
        
        guard let url = urlComponents?.url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do{
                let result = try JSONDecoder().decode(Response.self, from: data)
                completion(result.urls.regular)
            }
            catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}
