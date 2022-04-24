//
//  String+Extensions.swift
//  Utilities
//
//  Created by AMBER ÇATALBAŞ on 22.04.2022.
//

extension String {
    public func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}
