//
//  ImageLoading.swift
//  TawkPractical
//
//  Created by Rushang Prajapati on 18/05/22.
//

import UIKit
class ImageLoading: UIImageView {

    // MARK: - Constants

    let imageCache = NSCache<NSString, AnyObject>()

    // MARK: - Properties

    var imageURLString: String?

    func downloadImageFrom(urlString: String, imageMode: UIView.ContentMode) {
        guard let url = URL(string: urlString) else { return }
        downloadImageFrom(url: url, isConverted: false, imageMode: imageMode)
    }

    func downloadImageFrom(url: URL,isConverted:Bool, imageMode: UIView.ContentMode) {
        contentMode = imageMode
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) as? UIImage {
            DispatchQueue.main.async {
                self.image = cachedImage
            }
        } else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                if !isConverted{
                    let imageToCache = UIImage(data: data)
                    self.imageCache.setObject(imageToCache!, forKey: url.absoluteString as NSString)
                    DispatchQueue.main.async {
                        self.image = imageToCache
                    }
                    
                } else{
                    DispatchQueue.main.async {
                        let imageToCache = UIImage(data: data)
                        let beginImage = CIImage(image: imageToCache!)
                        if let filter = CIFilter(name: "CIColorInvert") {
                            filter.setValue(beginImage, forKey: kCIInputImageKey)
                            let newImage = UIImage(ciImage: filter.outputImage!)
                            self.imageCache.setObject(newImage, forKey: url.absoluteString as NSString)
                            self.image = newImage
                        }
                        
                    }
                }
            }.resume()
        }
    }
    
}

