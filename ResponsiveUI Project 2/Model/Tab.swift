//
//  Tab.swift
//  ResponsiveUI Project 2
//
//  Created by Simbarashe Dombodzvuku on 6/21/22.
//

import Foundation

//Tab enum model, raw value is image file name is assets
enum Tab: String, CaseIterable {
    case dashboard = "Dashboard"
    case transaction = "Transaction"
    case task = "Task"
    case documents = "Documents"
    case store  = "Store"
    case notifications = "Notifications"
    case profile = "Profile"
    case settings = "Settings"
}

/*
 
 ScrollView(count == 1 ? .horizontal : .vertical, showsIndicators: false) {
     DynamicLazyGrid(count: count) {
         ForEach(sampleStorage) { storage in
             VStack(alignment: .leading, spacing: 15){
                 HStack {
                     Image(storage.icon)
                         .resizedToFit(width: 25, height: 25)
                         .padding(10)
                         .background {
                             Circle()
                                 .fill(storage.progressColor.opacity(0.15))
                         }

                     Spacer(minLength: 5)

                     Button {

                     } label: {
                         Image(systemName: "ellipsis")
                             .foregroundColor(.white.opacity(0.5))
                             .rotationEffect(.init(degrees: -90))

                     }
                 }

                 Text(storage.title)
                     .font(.callout)
                     .fontWeight(.semibold)
                     .foregroundColor(.white.opacity(0.8))
             
                 //MARK: Progress Bar
                 GeometryReader{ geometry in
                     let size = geometry.size
                     ZStack(alignment: .leading){
                         Capsule()
                             .fill(Color.white.opacity(0.1))

                         Capsule()
                             .fill(storage.progressColor)
                             .frame(width: storage.progress * size.width)
                     }
                 }
                 .frame(height: 4)

                 HStack {
                     Text("\(storage.fileCount) files")
                         .font(.caption2)
                         .foregroundColor(.white.opacity(0.7))

                     Spacer(minLength: 5)

                     Text(storage.maxSize)
                     .font(.caption2)
                     .bold()
                     .foregroundColor(.white)
                 }
         }
         .frame(width: count == 2 ? nil : 150)
         .padding()
         .background {
             RoundedRectangle(cornerRadius:8, style: .continuous)
                 .fill(.lightMaterial)
         }
         }
     }
 }

 
 */
