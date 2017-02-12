//
//  APIClientCore.swift
//  MKHAPIClient
//
//  Created by Maxim Khatskevich on 2/12/17.
//  Copyright © 2017 Maxim Khatskevich. All rights reserved.
//

import Foundation

//===

public
protocol APIClientCore
{
    var session: URLSession { get }
    
    var basePath: String { get }
    
    var onConfigureRequest: OnConfigureRequestBlock { get }
    
    var onDidPrepareRequest: OnDidPrepareRequestBlock? { get }
    
    var onDidReceiveDataResponse: OnDidReceiveDataResponseBlock? { get }
    
    init(
        basePath: String,
        onConfigureRequest: OnConfigureRequestBlock?,
        onDidPrepareRequest: OnDidPrepareRequestBlock?,
        onDidReceiveDataResponse: OnDidReceiveDataResponseBlock?,
        sessionConfig: URLSessionConfiguration?,
        sessionDelegate: URLSessionDelegate?,
        sessionDelegateQueue: OperationQueue?)
}