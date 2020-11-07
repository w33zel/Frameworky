//
//  FrameworkDetailView.swift
//  Frameworky
//
//  Created by Christian Arlt on 07.11.20.
//

import SwiftUI

struct FrameworkDetailView: View {
    @Environment(\.presentationMode) var presentation
    @State private var isShowing = false
    
    let framework: Framework
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView {
                VStack(spacing: 20) {
                    Image(framework.imageName)
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal)
                        .padding(.horizontal)
                    Text(framework.name)
                        .font(.system(size: 50, weight: .light, design: .default))
                    Text(framework.description)
                        .multilineTextAlignment(.center)
    //                Link(destination: URL(string: "https://www.apple.com")!, label: {
    //                    FrameworkyButton(title: "Learn more...")
    //                })
                    Spacer()
                    Button(action: { isShowing.toggle() }, label: {
                        FrameworkyButton(title: "Learn more...")
                    })
                    .padding(.bottom)
                }
                .padding(.horizontal)
            }
            Button(action: { presentation.wrappedValue.dismiss() }, label: {
                Image(systemName: "xmark")
                    .imageScale(.large)
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color(.label))
                    .padding()
            })
        }
        .fullScreenCover(isPresented: $isShowing) {
            SafariView(url: URL(string: framework.urlString)!)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(framework: Framework.appClips)
            .preferredColorScheme(.dark)
    }
}
