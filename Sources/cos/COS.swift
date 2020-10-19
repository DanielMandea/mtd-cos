
import Vapor
import NIO

public struct COS<U: Uploader> {
    
    // MARK: - Private
    
    private var uploader: U
    
    // MARK: - Init
    
    public  init(uploader: U) {
        self.uploader = uploader
    }
    
    // MARK: - Public 
    
    public func uplad(file: Data, name: String, fileType: String) throws -> EventLoopFuture<String> {
        try uploader.oauth().flatMap { oAuth -> EventLoopFuture<String> in
            try! self.uploader.upload(file: file, name: name, fileType: fileType, oAuth: oAuth)
        }
    }
}


