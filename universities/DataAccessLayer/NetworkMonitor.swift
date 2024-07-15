//
//  NetworkMonitor.swift
//  challenge05
//
//  Created by Ahmed Elsman on 02/07/2024.
//

import Foundation
import Network

class NetworkMonitor: ObservableObject {
    let networkMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "Monitor")
    var isConnected = false
    
    init() {
        networkMonitor.pathUpdateHandler = { path  in
            self.isConnected = path.status == .satisfied
            
            Task {
                await MainActor.run {
                    self.objectWillChange.send()
                }
            }
        }
        networkMonitor.start(queue: workerQueue)
    }
}

extension NetworkMonitor {
    func startMonitoring() {
        networkMonitor.start(queue: DispatchQueue(label: "NetworkMonitor"))
    }
}
