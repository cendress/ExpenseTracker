//
//  DateFormatter.swift
//  ExpenseTracker
//
//  Created by Christopher Endress on 9/19/23.
//

import Foundation

extension DateFormatter {
  static let shortDate: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
  }()
}

