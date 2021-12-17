//
//  extensions.swift
//  spok2
//
//  Created by Ivan Karpovich on 18.12.21.
//

import Foundation

extension Data {
    
    func hexEncodedString() -> String {
        return self.map { String(format: "%02hhx", $0) }.joined()
    }
}
