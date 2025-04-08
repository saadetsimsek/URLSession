//
//  ViewController.swift
//  URLSession
//
//  Created by Saadet Şimşek on 16/03/2025.
//

import UIKit

class ViewController: UIViewController {
    
    private let networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.sendRequest(query: "car")
    }


}

