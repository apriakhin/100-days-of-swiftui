//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Anton Priakhin on 08.03.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.model.type) {
                        ForEach(OrderModel.types.indices) {
                            Text(OrderModel.types[$0])
                        }
                    }

                    Stepper("Number of cakes: \(order.model.quantity)", value: $order.model.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $order.model.specialRequestEnabled.animation())

                    if order.model.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.model.extraFrosting)

                        Toggle("Add extra sprinkles", isOn: $order.model.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
