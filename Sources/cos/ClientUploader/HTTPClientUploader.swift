//
//  File.swift
//  
//
//  Created by Daniel Mandea on 19.10.2020.
//

import Foundation
import NIO
import Vapor

public struct HTTPClientUploader: Uploader {
    
    private var oAuthURL: String
    private var baseURL: String
    private var client: HTTPClient
    
    // MARK: - Init
    
    public init(oAuthURL: String, baseURL: String, client: HTTPClient) {
        self.oAuthURL = oAuthURL
        self.baseURL = baseURL
        self.client = client
    }
    
    // MARK: - Internal
    
    public func oauth() throws -> EventLoopFuture<OAuth>  {
        let headers = HTTPHeaders([("Content-Type","application/x-www-form-urlencoded"),("Accept","application/json")])
        let request = try HTTPClient.Request(url: oAuthURL, method: .POST, headers: headers, body: nil)
        return client.execute(request: request).map { response -> OAuth in
            return try! JSONDecoder().decode(OAuth.self, from: response.body!)
        }
    }
    
    public func upload(file: Data, name: String, fileType: String, oAuth: OAuth) throws -> EventLoopFuture<String> {
        let headers = HTTPHeaders([("Content-Type","image/jpeg"),("Authorization","Bearer \(oAuth.accessToken)")])
        let imageURL =  "\(baseURL)/\(name).\(fileType)"
        let request = try HTTPClient.Request(url: imageURL, method: .PUT, headers: headers, body: .data(file))
        return client.execute(request: request).map { response -> String in
            request.url.absoluteString
        }
    }
}
