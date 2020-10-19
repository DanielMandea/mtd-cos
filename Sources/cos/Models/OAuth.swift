//
//  File.swift
//  
//
//  Created by Daniel Mandea on 19.10.2020.
//

import Foundation

import Foundation

public struct OAuth: Codable {
    
    // MARK: - Public Variables
    
    public var accessToken: String
    public var refreshToken: String
    public var tokenType: String
    public var expiresIn: Int
    public var expiration: Int
    public var scope: String
    
    // MARK: - CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case expiration
        case scope
    }
}
