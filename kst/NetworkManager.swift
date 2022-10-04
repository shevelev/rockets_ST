//
//  NetworkManager.swift
//  kst
//
//  Created by Сергей Шевелев on 01.10.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    static var networkDelegate: NetworkDelegate?
    private init() {}
    
    static func fetchRockets() {
        let url = "https://api.spacexdata.com/v4/rockets"
        
        self.requestData(urlString: url) { result in
            switch result {
            case .success(let data):
                do {
                    let rockets = try! JSONDecoder().decode([Rocket].self, from: data)
                    networkDelegate?.updateRocketsUI(rockets)
                    print("loading.........")
                    print(rockets.count)
                }
                
            case .failure(let error):
                print("error \(error.localizedDescription)")
            }
        }
        
    }
    
    
    static func requestData(urlString: String, completion: @escaping(Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else {
                    return
                }
                completion(.success(data))
            }
        }.resume()
    }
    
}

protocol NetworkDelegate {
    func updateRocketsUI(_ rockets: [Rocket])
}
