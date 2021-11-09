//
//  UIImageViewExtention.swift
//  UIImageViewExtention
//
//  Created by Sanjeev Kumar on 31/11/09.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadImage(urlStr: String) {
        guard let url = URL.init(string: urlStr) else { return}
        let imageLoader = CatcheManager()
        imageLoader.loadImage(from: url) { [weak self] image in
            self?.image = image
        }
    }
    
    func makeCirculer() {
        if !self.clipsToBounds {
            self.clipsToBounds = true
        }
        self.layer.cornerRadius = (self.frame.width * 0.5)
    }
}
