//
//  StorageDetail.swift
//  ResponsiveUI Project 2
//
//  Created by Simbarashe Dombodzvuku on 6/21/22.
//

import Foundation
import SwiftUI

struct StorageDetail: Identifiable {
    var id = UUID().uuidString
    var type: String
    var icon: String
    var files: String
    var size: String
    var progress: CGFloat
    var progressColor: Color
}

var sampleStorageDetail : [StorageDetail] = [
    StorageDetail(type: "Documents", icon: "profile", files: "129", size: "1.3GB", progress: 0.3, progressColor: .indigo),
    StorageDetail(type: "Media", icon: "profile", files: "4926", size: "3.4GB", progress: 0.2, progressColor: .red),
    StorageDetail(type: "Executables", icon: "profile", files: "91", size: "17.3GB", progress: 0.2, progressColor: .yellow),
    StorageDetail(type: "Other", icon: "profile", files: "9274", size: "29.7GB", progress: 0.1, progressColor: .mint)
]
