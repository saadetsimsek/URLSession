//
//  ViewController.swift
//  URLSession
//
//  Created by Saadet Şimşek on 16/03/2025.
//

import UIKit

class ViewController: UIViewController {
    
    private let networkManager = NetworkManager()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.frame.size = CGSize(width: 200, height: 200)
        image.center = view.center
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(image)
        networkManager.sendRequest(query: "car") {[weak self] urlString in
            guard let self = self else { return }
            guard let urlString = URL(string: urlString) else { return }
            image.load(url: urlString)
        }
    }


}
extension UIImageView{
    func load(url: URL) {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

