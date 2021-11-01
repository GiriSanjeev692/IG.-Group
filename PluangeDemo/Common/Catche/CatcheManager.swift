//
//  CatcheManager.swift
//  CatcheManager
//
//  Created by Sanjeev Kumar on 31/10/21.
//

import Foundation
import UIKit

final class CatcheManager {

    private let cache = ImageCache()

    func loadImage(from url: URL, completion: @escaping((UIImage?) -> Swift.Void)) {
        if let image = cache[url] {
            completion(image)
        } else {
            downloadImage(urlString: url) { [weak self] imageData in
                if let img = imageData {
                    self?.cache.insertImage(img, for: url)
                }
                DispatchQueue.main.async {
                    completion(imageData)
                }
                
            }
        }
       
    }
    
    private func downloadImage(urlString: URL, completion: @escaping((UIImage?) -> Swift.Void)) {
        //check if url present catche then get from catche else download and update catche and set image
        let networkManager = NetworkManager()
        networkManager.downloadImageData(urlString: urlString) { [weak self] result in
            switch result {
            case .success(let data):
                print("Image downloaded")
                let image = UIImage(data: data)
                completion(image)
            
            case .failure(let error):
                print("Error in image downloading")
                completion(nil)
            }
        }
    }
    
    
}
