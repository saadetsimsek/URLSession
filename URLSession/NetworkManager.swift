//
//  NetworkManager.swift
//  URLSession
//
//  Created by Saadet Şimşek on 28/03/2025.
//

import Foundation

class NetworkManager {
    let apiKey: String = ""
    let url: String = "https://api.unsplash.com"
    //photos/random
    
    func sendRequest(query: String){
        var urlComponents = URLComponents(string: url)
        urlComponents?.path = "/photos/random"
        
        urlComponents?.queryItems = [
            URLQueryItem(name: "", value: ""),
            URLQueryItem(name: "", value: ""),
            URLQueryItem(name: "", value: "")
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
            print(String(decoding: data, as: UTF8.self))
        }.resume()
    }
    
}
