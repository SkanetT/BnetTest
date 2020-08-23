//
//  NetworkAPI.swift
//  BnetTest
//
//  Created by Антон on 22.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class NetworkAPI {
    
    static let shared = NetworkAPI()
    let defaults = UserDefaults.standard
    
    func newSession(completion: @escaping (Result<String, ApiErrors>) -> ()) {
        guard let url = URL(string: Constants.urlAPI) else { return }
        
        guard Reachability.shared.isConnectedToNetwork() else {
            completion(.failure(.noInternet))
            return
        }
        var request = URLRequest(url: url)
        request.preparationRequestForAPI(method: .post, parametres: ["a" : "new_session"])
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let responseCode = response as? HTTPURLResponse else {
                completion(.failure(.unknown))
                return
            }
            switch responseCode.statusCode {
            case 200...300:
                if let data = data, let res = try? JSONDecoder().decode(SessionData.self, from: data) {
                    if res.status == 1 {
                        let result = res.data.session
                        completion(.success(result))
                    } else {
                        completion(.failure(.unknown))
                    }
                } else {
                    completion(.failure(.unknown))
                }
            case 404:
                completion(.failure(.noData))
            default:
                completion(.failure(.unknown))
            }
        }.resume()
    }
    
    func getEntries(completion: @escaping (Result<[EntryData], ApiErrors>) -> ()) {
        
        guard let sessionId = defaults.string(forKey: "session") else { return }
        
        guard let url = URL(string: Constants.urlAPI) else { return }
        
        guard Reachability.shared.isConnectedToNetwork() else {
            completion(.failure(.noInternet))
            return
        }
        var request = URLRequest(url: url)
        request.preparationRequestForAPI(method: .post, parametres: ["a" : "get_entries", "session" : "\(sessionId)"])
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let responseCode = response as? HTTPURLResponse else {
                completion(.failure(.unknown))
                return
            }
            switch responseCode.statusCode {
            case 200...300:
                if let data = data, let res = try? JSONDecoder().decode(ListData.self, from: data) {
                    
                    if res.status == 1 {
                        if let result = res.data.first {
                            completion(.success(result))
                        }
                    } else {
                        completion(.failure(.unknown))
                    }
                } else {
                    completion(.failure(.unknown))
                }
            case 404:
                completion(.failure(.noData))
            default:
                completion(.failure(.unknown))
            }
        }.resume()
    }
    
    func addEntry(body: String, completion: @escaping (Result<Void, ApiErrors>) -> ()) {
        
        guard let url = URL(string: Constants.urlAPI) else { return }
        
        guard let sessionId = defaults.string(forKey: "session") else { return }
        
        guard Reachability.shared.isConnectedToNetwork() else {
            completion(.failure(.noInternet))
            return
        }
        
        var request = URLRequest(url: url)
        request.preparationRequestForAPI(method: .post, parametres: ["a" : "add_entry", "session" : "\(sessionId)", "body" : "\(body)"])
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let responseCode = response as? HTTPURLResponse else {
                completion(.failure(.unknown))
                return
            }
            switch responseCode.statusCode {
            case 200...300:
                if let data = data, let res = try? JSONDecoder().decode(AdditionData.self, from: data) {
                    
                    if res.status == 1 {
                        completion(.success( () ))
                    } else {
                        completion(.failure(.unknown))
                    }
                } else {
                    completion(.failure(.unknown))
                }
            case 404:
                completion(.failure(.noData))
            default:
                completion(.failure(.unknown))
            }
        }.resume()
    }
}


