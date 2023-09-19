//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Christopher Endress on 9/19/23.
//

import SwiftUI

struct ContentView: View {
  @State private var expenses: [Expense] = Expense.loadExpenses()
  @State private var isShowingAddExpense = false
  
  var body: some View {
    NavigationView {
      List {
        ForEach(expenses) { expense in
          HStack {
            VStack(alignment: .leading) {
              Text(expense.name)
                .font(.headline)
              Text(expense.type)
            }
            
            Spacer()
            
            Text("$\(expense.amount.formatted())")
          }
        }
        .onDelete(perform: delete)
      }
      .navigationTitle("Expense Tracker")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            isShowingAddExpense.toggle()
          } label: {
            Image(systemName: "plus")
          }
        }
        ToolbarItem(placement: .navigationBarLeading) {
          EditButton()
        } 
      }
      .sheet(isPresented: $isShowingAddExpense) {
        AddExpenseView(expenses: $expenses)
      }
    }
  }
  
  func delete(at offsets: IndexSet) {
    expenses.remove(atOffsets: offsets)
    Expense.saveExpenses(expenses)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}


