//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Christopher Endress on 9/19/23.
//

import SwiftUI

struct ContentView: View {
  let expenses: [Expense] = [
    Expense(name: "Toilet paper", amount: 5.50, type: "Need", date: Date()),
    Expense(name: "Diapers", amount: 10.20, type: "Need", date: Date())
  ]
  var body: some View {
    NavigationView {
      List(expenses) { expense in
        Text("\(expense.name): \(expense.amount, specifier: "%.2f")")
      }
      .navigationTitle("Expense Tracker")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            //action
          } label: {
            Image(systemName: "plus")
          }
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
