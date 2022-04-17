//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Anton Priakhin on 17.04.2022.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    
    let content: (T) -> Content
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(
            sortDescriptors: [],
            predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue)
        )
        self.content = content
    }
    
    var body: some View {
        List(fetchRequest, id: \.self) { item in
            content(item)
        }
    }
}
