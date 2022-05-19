//
//  UserListViewModel.swift
//  TawkPractical
//
//  Created by Rushang Prajapati on 17/05/22.
//

import UIKit
import SVProgressHUD

class UserListViewModel {
    
    var arrUserList: [UserList] = [UserList]()
    var arrTmpUserList: [UserList] = [UserList]()
    var objUserDetail: UserDetail = UserDetail()
    var isPaginaating = false

    
    func getUserData(page: String,completion: @escaping(Bool) -> Void) {
        
        if page == "0" {
            SVProgressHUD.show()
        }
        if !self.isPaginaating{
            self.isPaginaating = true
        }
        getUserList(page: page) { result in
            SVProgressHUD.dismiss()
            switch result {
            case .success(let userList):
                
                print("SERVER", userList.count)
                for data in userList{
                    self.arrUserList.append(data)
                    self.arrTmpUserList.append(data)
                }
                print("DATAA", self.arrUserList.count)
                self.savetoData(_strDate: self.arrUserList)
                completion(true)
                if self.isPaginaating{
                    self.isPaginaating = false
                }

            case .failure(let error):
                print(error.localizedDescription)
                completion(false)
                if self.isPaginaating{
                    self.isPaginaating = false
                }

            }
        }
    }
    
    
    func getOfflineUserData(completion: @escaping(Bool) -> Void){
        
        //FETCH DATA TO STORE BEFORE API CALL UPDATATION
        //FETCH DATA
        let userFromCoredata = DataHandler.sharedInstance().getAllgitUser()
        if userFromCoredata.count == 0 {
            completion(false)
        }
        for data_ in userFromCoredata {
            
            let obj = UserList(starredUrl: data_.value(forKey: "htmlUrl")! as? String, id: (data_.value(forKey: "id")! as! Int), gravatarId: data_.value(forKey: "gravatarId")! as? String, avatarUrl: data_.value(forKey: "avatarUrl")! as? String, subscriptionsUrl: data_.value(forKey: "subscriptionsUrl")! as? String, htmlUrl: (data_.value(forKey: "htmlUrl")! as? String), receivedEventsUrl: data_.value(forKey: "receivedEventsUrl")! as? String, login: data_.value(forKey: "login")! as? String, followingUrl: data_.value(forKey: "followingUrl")! as? String, type: data_.value(forKey: "type")! as? String, url: data_.value(forKey: "url")! as? String, gistsUrl: data_.value(forKey: "gistsUrl")! as? String, reposUrl: data_.value(forKey: "reposUrl")! as? String, siteAdmin: (data_.value(forKey: "siteAdmin")! as? Bool), followersUrl: data_.value(forKey: "followersUrl")! as? String, nodeId: data_.value(forKey: "nodeId")! as? String, organizationsUrl: data_.value(forKey: "organizationsUrl")! as? String, eventsUrl: data_.value(forKey: "eventsUrl")! as? String,notes: data_.value(forKey: "notes") as? String )
            self.arrUserList.append(obj)
            self.arrTmpUserList.append(obj)
            
        }
        completion(true)
        
    }
    
    func savetoData(_strDate:[UserList]){
        
        for item in _strDate{
            // CHECK RECORD IS PRESENT OR NOT AND UPDATE IF PRESENT AND ADD IT IF NEW
            if DataHandler.sharedInstance().ischeckRecordPresent(strLogin:item.login!){
                DataHandler.sharedInstance().updateUserIfexistInDatabase(arrUserList: item)
            }
            else{
                DataHandler.sharedInstance().saveUsersInCoredata(arrUserList: item)
            }
        }
        
    }
    
    
    func getUserDetails(strName: String,completion: @escaping(Bool) -> Void) {
        
        SVProgressHUD.show()
        getUserDetail(strUser: strName) { res in
            SVProgressHUD.dismiss()
            switch res {
            case .success(let userDetail):
                self.objUserDetail = userDetail
                completion(true)
            case .failure(let error):
                print(error.localizedDescription)
                completion(false)
            }
        }
    }
}
