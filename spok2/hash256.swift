//
//  hash256.swift
//  spok2
//
//  Created by Ivan Karpovich on 18.12.21.
//

import Foundation
import CryptoKit

class Hash256 {
    static func transformationToHash(step: String)->String{
        let key = SymmetricKey(size: .bits256)
        let string = step
        let signature = HMAC<SHA256>.authenticationCode(for: string.data(using: .utf8)!, using: key)
        print(Data(signature).map { String(format: "%02hhx", $0) }.joined())
        let keyb64 = key.withUnsafeBytes {
            return Data(Array($0)).hexEncodedString()
        }
        return keyb64
    }
}
