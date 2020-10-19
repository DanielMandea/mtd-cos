# mtd-cos
IBM Cloud Object Storage Helper

## Development
Navigate to repositoity rute then run `open Package.swift` 

## Usage 
Instantiate based on your need `HTTPClientUploader` or  `VaporClientUploader`
Instantiate `COS` using one of the clients above 
Call  `func uplad(file: Data, name: String, fileType: String)` in order to upload some file to `IBM Cloud Object Storage` using `EventLoopFuture<String>` one will receive some `String` representing the actual `URL` of the file recently uploaded  


