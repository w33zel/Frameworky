//
//  FrameworkListView.swift
//  Frameworky
//
//  Created by Christian Arlt on 15.11.20.
//

import SwiftUI

struct FrameworkListView: View {
    @StateObject private var model = FrameworkyModel()
        
    init() {
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundView = BackgroundView.UIKitBackgroundView()
    }

    let gradient = Gradient(colors: [.gray, .black])
    
    var body: some View {
        NavigationView {
//            ZStack {
//                LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
//                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack(alignment: .leading, spacing: .zero) {
                        ForEach(model.frameworks) { framework in
                            HStack {
                                Image(framework.imageName)
                                    .resizable()
                                    .frame(width: 90, height: 90)
                                    .scaledToFit()
                                Text(framework.name)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .scaledToFit()
                                    .minimumScaleFactor(0.7)
                            }
                            .padding(30)
                            .frame(width: UIScreen.main.bounds.width - 50)
                            .background(LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .trailing))
                        }
                    }
//                }
            }
                .navigationTitle(" Frameworks")

        }
    }
}

struct FrameworkListView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkListView()
    }
}

struct BackgroundView: View {
    
    static func UIKitBackgroundView() -> UIView {
        let view = UIView()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = UIScreen.main.bounds
        gradientLayer.colors = [UIColor.gray.cgColor, UIColor.black.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
        return view
    }

    var body: some View {
        LinearGradient(gradient: Gradient(
                        colors: [.gray,
                                 .black]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ChildView: View {
    @ObservedObject var model: FrameworkyModel
    
    let gradient = Gradient(colors: [.gray, .black])
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: .zero) {
                    ForEach(model.frameworks) { framework in
                        HStack {
                            Image(framework.imageName)
                                .resizable()
                                .frame(width: 90, height: 90)
                                .scaledToFit()
                            Text(framework.name)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .scaledToFit()
                                .minimumScaleFactor(0.7)
                        }
                        .padding(30)
                        .frame(width: UIScreen.main.bounds.width - 50)
                        .background(LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .trailing))
                    }
                }
            }
        }
    }
}
