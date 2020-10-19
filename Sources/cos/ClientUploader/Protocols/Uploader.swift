//
//  File.swift
//  
//
//  Created by Daniel Mandea on 19.10.2020.
//

import Foundation
import NIO

public protocol Uploader {
    func oauth() throws -> EventLoopFuture<OAuth>
    func upload(file: Data, name: String, fileType: String, oAuth: OAuth) throws -> EventLoopFuture<String>
}
