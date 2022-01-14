//
//  TitleView.swift
//  Moonshot
//
//  Created by Anton Priakhin on 15.01.2022.
//

import SwiftUI

struct TitleView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title.bold())
            .padding(.bottom, 5)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(text: "Hello, World!")
    }
}
