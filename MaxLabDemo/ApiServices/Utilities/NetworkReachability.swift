//
//  NetworkReachability.swift
//  MaxLabDemo
//
//  Created by Sumit Kumar on 07/02/24.
//

import Foundation
import Foundation
import SystemConfiguration

class NetworkReachability {
    static let shared = NetworkReachability()
    
    private var reachability: SCNetworkReachability?
    
    private init() {
        guard let reachability = SCNetworkReachabilityCreateWithName(nil, "www.apple.com") else {
            return
        }
        self.reachability = reachability
    }
    
    func startMonitoring() {
        var context = SCNetworkReachabilityContext()
        context.info = UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque())
        
        guard let reachability = self.reachability,
              SCNetworkReachabilitySetCallback(reachability, { (reachability, flags, info) in
                guard let info = info else { return }
                let `self` = Unmanaged<NetworkReachability>.fromOpaque(info).takeUnretainedValue()
                self.handleReachability(flags: flags)
            }, &context),
            SCNetworkReachabilitySetDispatchQueue(reachability, DispatchQueue.main) else {
                return
        }
    }
    
    func stopMonitoring() {
        guard let reachability = self.reachability else { return }
        SCNetworkReachabilitySetCallback(reachability, nil, nil)
        SCNetworkReachabilitySetDispatchQueue(reachability, nil)
    }
    
    private func handleReachability(flags: SCNetworkReachabilityFlags) {
        let isReachable = flags.contains(.reachable)
        if isReachable {
            print("Network is reachable")
            // Perform actions when the network becomes reachable
        } else {
            print("Network is not reachable")
            // Perform actions when the network becomes unreachable
        }
    }
}

