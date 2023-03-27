//
//  HTTPHelper.swift
//  Unsplashapp
//
//  Created by Mamoudou Cisse on 3/23/23.
//

import Foundation
class HTTPHelper{
    func getURLImage(url1: String, complete: @escaping (Bool, Data?) -> ()) {
        
        guard let url2 = URL(string: url1) else {
            print("Error: cannot create URL from string")
            return
        }
        let API_KEY = "1yfnR8k0DSEkTrEzebMQjjeQhQlj5zk-EGmj_T69kXg"

        var request = URLRequest(url: url2)
        request.httpMethod = "GET"
        request.setValue(API_KEY, forHTTPHeaderField: "Authorization")
        
        let config = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: config)
        session.dataTask(with: request) {
            data, response, error in
            
            if error != nil {
                print("Error: problem calling GET")
                print(error!)
                complete(false, nil)
                return
            }
            
            if data == nil {
                print("Error: not data present")
                complete(false, nil)
                return
            }
            
            if let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode {
                print(response)
            }
            complete(true, data)
        }.resume()
        
    }
    var endpoint = ""
    let API_KEY = "1yfnR8k0DSEkTrEzebMQjjeQhQlj5zk-EGmj_T69kXg"

    let session = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    func mediaRequest(query: String, urlStr: String) -> URLRequest?{
        endpoint = urlStr
        endpoint.append(query)
        endpoint.append("&per_page=")
        endpoint.append("50")
        endpoint.append("&page=")
        let endpoint = endpoint.replacingOccurrences(of: " ", with: "%20")
        
        guard let url = URL(string: endpoint) else {
            print("Error: cannot create URL from string")
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json;charset=UTF-8",
        forHTTPHeaderField: "Content-Type")
        request.addValue(API_KEY, forHTTPHeaderField: "Authorization")
        return request
    }
    
    func getPhoto(request: URLRequest, completion: @escaping(Result<WelcomeElement, Error>) -> Void) {

        dataTask = session.dataTask(with: request) { data, response, error in
            if let error = error{
                print(error)
                completion(Result.failure(error))
                return
                
            }
            if let data = data, let parsedResponse = try? JSONDecoder().decode(WelcomeElement.self, from: data){
                print(parsedResponse)
                completion(Result.success(parsedResponse))
                return
            }
           
            completion(Result.failure(error!))
        
        }
        dataTask?.resume()
    }
   
    }



