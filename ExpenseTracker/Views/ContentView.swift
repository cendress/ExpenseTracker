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
  
  @State private var selectedDate: Date = Date()
  @State private var isFiltering: Bool = false
  
  var body: some View {
    NavigationView {
      VStack {
        DatePicker("Filter by Date", selection: $selectedDate, displayedComponents: .date)
          .padding()
          .background(Color(.systemGray6))
          .cornerRadius(8)
          .padding(.horizontal)
        
        Toggle(isOn: $isFiltering) {
          Text("Filter by selected date")
        }
        .padding(.horizontal)
        
        List {
          ForEach(filteredExpenses) { expense in
            HStack {
              VStack(alignment: .leading) {
                Text(expense.name)
                  .font(.headline)
                Text(expense.type)
                Text(expense.date, formatter: DateFormatter.shortDate)
                  .font(.subheadline)
                  .foregroundColor(.gray)
              }
              
              Spacer()
              
              Text("$\(expense.amount.formatted())")
                .foregroundColor(expense.amountColor)
            }
          }
          .onDelete(perform: delete)
        }
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
  
  var filteredExpenses: [Expense] {
    if isFiltering {
      return expenses.filter { Calendar.current.isDate($0.date, inSameDayAs: selectedDate) }
    } else {
      return expenses
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



