//
//  AddExpenseView.swift
//  ExpenseTracker
//
//  Created by Christopher Endress on 9/19/23.
//

import SwiftUI

struct AddExpenseView: View {
  @State private var name = ""
  @State private var amount: Double? = nil
  @State private var type: String = "Want"
  
  @Binding var expenses: [Expense]
  @Environment(\.presentationMode) var presentationMode
  
    var body: some View {
      NavigationView {
        Form {
          TextField("Name", text: $name)
          
          HStack {
            Text("$")
            TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
              .keyboardType(.decimalPad)
          }
          
          Picker("Select type", selection: $type) {
            Text("Want").tag("Want")
            Text("Need").tag("Need")
          }
          .pickerStyle(SegmentedPickerStyle())
        }
        .navigationTitle("Add Expense")
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button("Save") {
              if let actualAmount = amount {
                let expense = Expense(name: name, amount: actualAmount, type: type, date: Date())
                expenses.append(expense)
                Expense.saveExpenses(expenses)
                presentationMode.wrappedValue.dismiss()
              }
            }
          }
        }
      }
    }
}

struct AddExpenseView_Previews: PreviewProvider {
  static var sampleExpenses = [Expense(name: "Food", amount: 20.25, type: "Need", date: Date())]
    static var previews: some View {
      AddExpenseView(expenses: .constant(sampleExpenses))
    }
}
