//
//  Constants.swift
//  SelfTest
//
//  Created by Rushang Prajapati on 20/04/22.
//

import Foundation
import UIKit

struct KEY {
    
    struct BASEURL {
        static let FETCH_USERS = "https://api.github.com/users?since="
        static let FETCH_USERDETAIL = "https://api.github.com/users/"
    }
    
    struct COREDATA {
        static let PERSON_ENTITY = "UsersList"
        static let NO_NOTES_PATTERN = "N/A"
    }
    
    
    struct MESSAGE {
        
        static let SAVED_SUCCESSFULLY = "Data Saved Successfully"
        static let SOMETHING_WENT_WRONG = "Oops!! Something went wrong."
        
    }
    
    
    struct ButtonNames {
        static let TERMS = "Terms of use"
        static let INFORMATION = "Do not sell my information (CA policy)"
        static let PRIVACY = "Privacy policy"
        static let YES = "Yes"
        static let NO = "No"
        static let OK = "Ok"
        static let DISCONNECT = "Disconnect"
        static let CONTINUE = "Continue"
        static let VIEW_SUGGESTIONS = "View address suggestions"
        static let CHOOSE_OPTION = "Choose Option"
        static let EMAIL_US = "Email us"
        static let CALL_US = "Call us"
        static let CANCEL = "Cancel"
        static let DELIVERY_EVS = "Delivery address verification failed"
        static let BILLING_EVS = "Billing address verification failed"
        static let LOOK_BOOK = "Look Book"
        static let SELECT_NOW = "Select Now"
        static let SELECT_STATE = "Select State"
        static let SELECT_PROVINCE = "Select Province"
        static let SELECT_COUNTRY = "Select Country"
    }

}
func showAlert(message: String) {
    if let window = UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .compactMap({$0 as? UIWindowScene})
        .first?.windows
        .filter({$0.isKeyWindow}).first {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        window.rootViewController?.present(alert, animated: true, completion: {
            
        })
    }
}
