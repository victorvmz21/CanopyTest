//
//  StringExtension.swift
//  Dashboard
//
//  Created by Victor Monteiro on 9/30/21.
//

import Foundation

extension String {
    
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
       
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        let finaldate = dateFormatter.date(from:self)
        
        dateFormatter.dateFormat = "MMM d, yyyy"
        let formattedString = dateFormatter.string(from: finaldate!)
        return formattedString
    }
    
}
