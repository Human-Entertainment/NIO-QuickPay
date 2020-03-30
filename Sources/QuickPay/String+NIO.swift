//
//  File.swift
//  
//
//  Created by Bastian Inuk Christensen on 30/03/2020.
//

import Foundation

extension String {
    func toBase64() -> String {
        Data(self.utf8).base64EncodedString()
    }
}
