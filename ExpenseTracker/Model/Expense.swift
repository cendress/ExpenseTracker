//
//  Expense.swift
//  ExpenseTracker
//
//  Created by Christopher Endress on 9/19/23.
//

import Foundation
import SwiftUI

struct Expense: Codable, Identifiable {
  var id = UUID()
  
  let name: String
  let amount: Double
  let type: String
  let date: Date
}

extension Expense {
  static func saveExpenses(_ expenses: [Expense]) {
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(expenses) {
      UserDefaults.standard.set(encoded, forKey: "Expenses")
    }
  }
  
  static func loadExpenses() -> [Expense] {
    if let savedExpenses = UserDefaults.standard.data(forKey: "Expenses") {
      let decoder = JSONDecoder()
      if let loadedExpenses = try? decoder.decode([Expense].self, from: savedExpenses) {
        return loadedExpenses
      }
    }
    return []
  }
  
  var amountColor: Color {
    if amount > 100 {
      return .red
    } else if amount < 100 && amount > 10 {
      return .blue
    } else {
      return .green
    }
  }
}
