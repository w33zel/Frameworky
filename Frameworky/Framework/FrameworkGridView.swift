//
//  FrameworkGridView.swift
//  Frameworky
//
//  Created by Christian Arlt on 07.11.20.
//

import SwiftUI

struct FrameworkGridView: View {
    @StateObject private var model = FrameworkyModel()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(model.frameworks) { item in
                        FrameworkTitleView(framework: item)
                            .onTapGesture{
                                model.selectedFramework = item
                            }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle(" Frameworks")
            .sheet(item: $model.selectedFramework) { fw in
                FrameworkDetailView(framework: fw)
            }
        }
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
    }
}
