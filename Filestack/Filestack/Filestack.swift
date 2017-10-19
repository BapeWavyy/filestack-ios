//
//  Filestack.swift
//  Filestack
//
//  Created by Ruben Nine on 10/19/17.
//  Copyright © 2017 Filestack. All rights reserved.
//

import Foundation
import FilestackSDK


@objc(FSFilestack) public class Filestack: NSObject {

    // MARK: - Properties

    /// An API key obtained from the [Developer Portal](http://dev.filestack.com).
    public let apiKey: String

    /// A `Security` object. `nil` by default.
    public let security: Security?

    private let client: Client

    // MARK: - Lifecyle Functions

    /**
        Default initializer.

        - SeeAlso: `Security`

        - Parameter apiKey: An API key obtained from the Developer Portal.
        - Parameter security: A `Security` object. `nil` by default.
     */
    @objc public init(apiKey: String, security: Security? = nil) {

        self.apiKey = apiKey
        self.security = security
        self.client = Client(apiKey: apiKey, security: security)

        super.init()
    }


    // MARK: - Public Functions


    /**
        Uploads a file directly to a given storage location (currently only S3 is supported.)

        - Parameter localURL: The URL of the local file to be uploaded.
        - Parameter storage: The storage location. Defaults to `s3`.
        - Parameter useIntelligentIngestionIfAvailable: Attempts to use Intelligent Ingestion
        for file uploading. Defaults to `true`.
        - Parameter queue: The queue on which the upload progress and completion handlers are
        dispatched.
        - Parameter uploadProgress: Sets a closure to be called periodically during the lifecycle
        of the upload process as data is uploaded to the server. `nil` by default.
        - Parameter completionHandler: Adds a handler to be called once the upload has finished.
     */
    @discardableResult public func upload(from localURL: URL,
                                          storage: StorageLocation = .s3,
                                          useIntelligentIngestionIfAvailable: Bool = true,
                                          queue: DispatchQueue = .main,
                                          uploadProgress: ((Progress) -> Void)? = nil,
                                          completionHandler: @escaping (NetworkJSONResponse?) -> Void) -> MultipartUpload {

        return client.multiPartUpload(from: localURL,
                                      storage: storage,
                                      useIntelligentIngestionIfAvailable: useIntelligentIngestionIfAvailable,
                                      queue: queue,
                                      uploadProgress: uploadProgress,
                                      completionHandler: completionHandler)
    }
}
