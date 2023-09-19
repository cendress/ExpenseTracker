//
//  AddExpenseView.swift
//  ExpenseTracker
//
//  Created by Christopher Endress on 9/19/23.
//

import SwiftUI

struct AddExpenseView: View {
  @State private var name = ""
  @State private var amount = ""
  @State private var type: String = "Want"
  
  @Binding var expenses: [Expense]
  @Environment(\.presentationMode) var presentationMode
  
    var body: some View {
      NavigationView {
        Form {
          TextField("Name", text: $name)
          TextField("Amount", text: $amount)
            .keyboardType(.decimalPad)
          Picker("Select type", selection: $type) {
            Text("Want").tag("Want")
            Text("Need").tag("Need")
          }
          .pickerStyle(SegmentedPickerStyle())
        }
        .navigationTitle("Add Expense")
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button("Add") {
              if let actualAmount = Double(amount) {
                let expense = Expense(name: name, amount: actualAmount, type: type, date: Date())
                expenses.append(expense)
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
