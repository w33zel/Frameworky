//
//  FrameworkyButton.swift
//  Frameworky
//
//  Created by Christian Arlt on 07.11.20.
//

import SwiftUI

struct FrameworkyButton: View {
    let title: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(title)
                .font(.title2)
                .bold()
            Spacer()
        }
        .padding()
        .background(Color.red)
        .foregroundColor(.white)
        .cornerRadius(25)
    }
}

struct FrameworkyButton_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkyButton(title: "Test Title")
            .previewLayout(.sizeThatFits)
    }
}
