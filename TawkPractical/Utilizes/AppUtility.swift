//
//  AppUtility.swift
//  Babylisspro
//
//  Created by Solvative on 12/6/19.
//  Copyright © 2019 Solvative. All rights reserved.
//

import UIKit
import CommonCrypto

class AppUtility: NSObject {
    
    class func methodGetAssetUrl(forAssetName assetName: String, andExtension extensionValue: String) -> URL? {
        guard let urlPath = Bundle.main.url(forResource: assetName, withExtension: extensionValue) else { return nil }
        return urlPath
    }
    
    class func methodDegreesToRadians(degrees: Double) -> Double {
        return (degrees * (.pi / 180))
    }
    
    class func showAlert(message: String) {
        if let window = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows
            .filter({$0.isKeyWindow}).first {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: KEY.ButtonNames.OK, style: .default) { (action) in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(okAction)
            window.rootViewController?.present(alert, animated: true, completion: {
                
            })
        }
    }

}
