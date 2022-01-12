//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Anton Priakhin on 12.01.2022.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double 
}
