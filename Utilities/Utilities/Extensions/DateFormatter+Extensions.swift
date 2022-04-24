//
//  DateFormatter+Extensions.swift
//  Utilities
//
//  Created by AMBER ÇATALBAŞ on 22.04.2022.
//

import Foundation

extension DateFormatter {
    public func formattedDateFromString(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: dateString)
        dateFormatter.dateFormat = "dd MMM yyyy"
        let resultString = dateFormatter.string(from: date!)
        return  resultString
    }
}
