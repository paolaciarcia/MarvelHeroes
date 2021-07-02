//
//  APIHeros.swift
//  MarvelHeroes
//
//  Created by Erick Borges on 02/07/21.
//

import Foundation
import Alamofire
import SwiftHash


struct APIHeros {
    
    private let basePath = "https://gateway.marvel.com/v1/public/characters?"
    private let limit = 20
    
    func loadHeros(name: String?, page: Int = 0, onComplete: @escaping (MarvelInfo?) -> Void) {
        let offset = page * limit
        let startsWith: String
        if let name = name, !name.isEmpty {
            startsWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
        } else {
            startsWith = ""
        }
        
        let url = basePath + "offset=\(offset)&limit=\(limit)&" + startsWith + getCredentials()
        print(url)
        
        AF.request(url).responseJSON { (response) in
            guard let data = response.data,
                  let marvelInfo = try? JSONDecoder().decode(MarvelInfo.self, from: data),
                  marvelInfo.code == 200 else {
                onComplete(nil)
                return
            }
            onComplete(marvelInfo)
        }
    }
    
    private func getCredentials() -> String {
        let ts = String(Date().timeIntervalSince1970)
        let privateKey = Keys().privateKey
        let publicKey = Keys().publicKey
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
}
