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
        Text("Hello World")
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
