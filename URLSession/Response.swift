//
//  Response.swift
//  URLSession
//
//  Created by Saadet Şimşek on 28/03/2025.
//

import Foundation
struct Response: Decodable {
    let urls: ImageUrls
}

struct ImageUrls: Decodable {
    let regular: String
    let full: String
}


