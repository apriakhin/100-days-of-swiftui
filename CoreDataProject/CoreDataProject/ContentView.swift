//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Anton Priakhin on 17.04.2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var countries: FetchedResults<Country>
    
    @State private var nameFilter = "T"
    
    var body: some View {
        VStack {
            FilteredList(
                filterKey: "name",
                filterComparison: "BEGINSWITH",
                filterValue: nameFilter
            ) { (candy: Candy) in
                Text(candy.wrappedName)
            }

            Button("Add") {
                let candy1 = Candy(context: moc)
                candy1.name = "Mars"
                candy1.origin = Country(context: moc)
                candy1.origin?.shortName = "UK"
                candy1.origin?.fullName = "United Kingdom"

                let candy2 = Candy(context: moc)
                candy2.name = "KitKat"
                candy2.origin = Country(context: moc)
                candy2.origin?.shortName = "UK"
                candy2.origin?.fullName = "United Kingdom"

                let candy3 = Candy(context: moc)
                candy3.name = "Twix"
                candy3.origin = Country(context: moc)
                candy3.origin?.shortName = "UK"
                candy3.origin?.fullName = "United Kingdom"

                let candy4 = Candy(context: moc)
                candy4.name = "Toblerone"
                candy4.origin = Country(context: moc)
                candy4.origin?.shortName = "CH"
                candy4.origin?.fullName = "Switzerland"

                try? moc.save()
            }
            
            Button("Show T") {
                nameFilter = "T"
            }

            Button("Show M") {
                nameFilter = "M"
            }
            
            Button("Show K") {
                nameFilter = "K"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
