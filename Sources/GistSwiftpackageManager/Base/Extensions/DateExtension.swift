//
//  DateExtension.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 17/10/25.
//

import Foundation

extension Date {
    
    func stringFromDate() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR_POSIX")
        formatter.dateFormat = "dd/MM/yyyy"
        let string = formatter.string(from: self)
        return string
    }

}
