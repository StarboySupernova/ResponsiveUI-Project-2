//
//  Storage.swift
//  ResponsiveUI Project 2
//
//  Created by Simbarashe Dombodzvuku on 6/21/22.
//

import Foundation
import SwiftUI

struct Storage: Identifiable {
    var id = UUID().uuidString
    var title: String
    var icon: String
    var fileCount: String
    var maxSize: String
    var progress: CGFloat
    var progressColor: Color
}

var sampleStorage: [Storage] = [
    Storage(title: "Local", icon: "profile", fileCount: "1188", maxSize: "40GB", progress: 0.4, progressColor: .teal),
    Storage(title: "Google Drive", icon: "profile", fileCount: "768", maxSize: "10GB", progress: 0.5, progressColor: .green),
    Storage(title: "OneDrive", icon: "profile", fileCount: "10923", maxSize: "115GB", progress: 0.2, progressColor: .blue),
    Storage(title: "Element", icon: "profile", fileCount: "1755", maxSize: "4GB", progress: 0.1, progressColor: .yellow)
]
