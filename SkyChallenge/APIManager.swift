//
//  APIManager.swift
//  SkyChallenge
//
//  Created by Lucas Feitosa on 19/08/20.
//  Copyright © 2020 lfeitosa.com. All rights reserved.
//

/*
 
 Resposta padrão
 
 Alamofire.request(url,encoding:self.encoding,headers:headers).validate().responseJSON { response in
 
 switch response.result {
 case let .success(value):
 
 break
 case let .failure(error):
 break
 }
 }
 
 
 
 
 
 */

import Foundation
import Alamofire

class APIManager: NSObject {
    
    // MARK: - Vars & Lets
    private let encoding:JSONEncoding = JSONEncoding.default
    private var baseUrl:String
    private var authToken:String = ""
    
    private var headers: HTTPHeaders = [
        "Accept": "application/json"
    ]
    private let sessionManager: Session
    private static var sharedApiManager: APIManager = {
        let apiManager = APIManager(sessionManager: Session())
        
        return apiManager
    }()
    
    // MARK: - Accessors
    
    class func shared() -> APIManager {
        return sharedApiManager
    }
    
    // MARK: - Initialization
    
    private init(sessionManager: Session) {
        self.sessionManager = sessionManager
        self.baseUrl = "https://sky-exercise.herokuapp.com/api"
        
    }
    
    
    func getVideos(completion:@escaping (String?) -> Void) {
        
        let url = "\(self.baseUrl)/Movies"
        AF.request(url,encoding:JSONEncoding.default,headers:headers).validate().responseJSON { response in
            
            switch response.result {
            case let .success(value):
                print(value)
                completion(nil)
            case .failure:
                completion(nil)
                break
            }
        }
        
    }
}

