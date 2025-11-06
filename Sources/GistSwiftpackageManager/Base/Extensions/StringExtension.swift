//
//  StringExtension.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 16/10/25.
//

import Foundation

extension String {
    
    func formatToDefault() -> Date? {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: self)
        return date
    }
    
}
