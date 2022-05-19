//
//  APIManager.swift
//  TawkPractical
//
//  Created by Rushang Prajapati on 17/05/22.
//

import Foundation


func getUserList(page: String,_ completionHandler: @escaping (Result<[UserList], NetworkError>) -> Void) {
    
    
    let url = URL(string: KEY.BASEURL.FETCH_USERS + page)!
    let task = URLSession.shared.dataTask(with: url) {(data, response, error) -> Void in
        if let data = data {
            do {
                let values = try JSONDecoder().decode([UserList].self, from: data)
                completionHandler(.success(values))
            } catch {
                completionHandler(.failure(.invalidJson))
            }
        }
        else{
            completionHandler(.failure(.badURL))
        }
    }
    task.resume()
}

func getUserDetail(strUser: String,_ completionHandler: @escaping (Result<UserDetail, NetworkError>) -> Void) {
    
    let url = URL(string: KEY.BASEURL.FETCH_USERDETAIL + strUser)!
    let task = URLSession.shared.dataTask(with: url) {(data, response, error) -> Void in
        if let data = data {
            do {
                let values = try JSONDecoder().decode(UserDetail.self, from: data)
                completionHandler(.success(values))
            } catch {
                completionHandler(.failure(.invalidJson))
            }
        }
        else{
            completionHandler(.failure(.badURL))
        }
    }
    task.resume()
}

enum NetworkError: Error {
    case badURL
    case invalidJson
}
