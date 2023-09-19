//
//  Expense.swift
//  ExpenseTracker
//
//  Created by Christopher Endress on 9/19/23.
//

import Foundation

struct Expense: Codable, Identifiable {
  var id = UUID()
  
  let name: String
  let amount: Double
  let type: String
  let date: Date
}
