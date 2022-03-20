//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Anton Priakhin on 08.03.2022.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.model.name)
                TextField("Street Address", text: $order.model.streetAddress)
                TextField("City", text: $order.model.city)
                TextField("Zip", text: $order.model.zip)
            }

            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(order.model.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(order: Order())
        }
    }
}
