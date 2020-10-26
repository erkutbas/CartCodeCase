//
//  NetworkCheckerManager.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 22.10.2020.
//

import Foundation
import Network

typealias NetworkListener = (NetworkStates) -> Void

class NetworkCheckerManager {
    
    public static let shared = NetworkCheckerManager()
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "InternetConnectionMonitor")
    
    private var networkListener: NetworkListener?
    
    private let manager = NWPathMonitor()

    init() {
        startNetworkListener()
    }
    
    private func startNetworkListener() {
        monitor.pathUpdateHandler = { pathUpdateHandler in
            if pathUpdateHandler.status == .satisfied {
                self.networkListener?(.online)
            } else {
                self.networkListener?(.offline)
            }
        }

        monitor.start(queue: queue)
        
    }
    
    func subscribeNetworkListener(_ completion: @escaping NetworkListener) {
        networkListener = completion
    }
    
}
