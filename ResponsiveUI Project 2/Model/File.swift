//
//  File.swift
//  ResponsiveUI Project 2
//
//  Created by Simbarashe Dombodzvuku on 6/21/22.
//

import Foundation

struct File: Identifiable {
    var id = UUID().uuidString
    var fileType: String
    var fileIcon: String
    var fileDate: String
    var fileSize: String
}

var sampleFile: [File] = [
    File(fileType: "mp4", fileIcon: "profile", fileDate: "24-07-2021", fileSize: "147MB"),
    File(fileType: "mkv", fileIcon: "profile", fileDate: "16-04-2019", fileSize: "15MB"),
    File(fileType: "exe", fileIcon: "profile", fileDate: "03-12-2017", fileSize: "1.67GB"),
    File(fileType: "txt", fileIcon: "profile", fileDate: "31-01-2012", fileSize: "3KB")
]
