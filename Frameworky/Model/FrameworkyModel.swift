//
//  FrameworkyModel.swift
//  Frameworky
//
//  Created by Christian Arlt on 07.11.20.
//

import Foundation

final class FrameworkyModel: ObservableObject {
    @Published var frameworks: [Framework] = []
    @Published var selectedFramework: Framework?
    
    init() {
        self.frameworks = Framework.all
    }
}
