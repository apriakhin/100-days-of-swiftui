//
//  Expenses.swift
//  iExpense
//
//  Created by Anton Priakhin on 12.01.2022.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
