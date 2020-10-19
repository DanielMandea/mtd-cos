//
//  VaporClientUploader.swift
//  
//
//  Created by Daniel Mandea on 19.10.2020.
//

import Foundation
import Vapor

public struct VaporClientUploader: Uploader {
    
    private var oAuthURL: String
    private var baseURL: String
    private var client: Client
    
    // MARK: - Init
    
    public init(oAuthURL: String, baseURL: String, client: Client) {
        self.oAuthURL = oAuthURL
        self.baseURL = baseURL
        self.client = client
    }
    
    // MARK: - Internal
    
    public func oauth() throws -> EventLoopFuture<OAuth>  {
        let headers = HTTPHeaders([("Content-Type","application/x-www-form-urlencoded"),("Accept","application/json")])
        let request = ClientRequest(method: .POST, url: "\(oAuthURL)", headers: headers, body: nil)
        return client.send(request).map { response -> OAuth in
            return try! JSONDecoder().decode(OAuth.self, from: response.body!)
        }
    }
    
    public func upload(file: Data, name: String, fileType: String, oAuth: OAuth) throws -> EventLoopFuture<String> {
        let headers = HTTPHeaders([("Content-Type","image/jpeg"),("Authorization","Bearer \(oAuth.accessToken)")])
        let request = ClientRequest(method: .PUT, url: "\(baseURL)/\(name).\(fileType)", headers: headers, body: .init(data: file))
        return client.send(request).map { response -> String in
            request.url.string
        }
    }
}
