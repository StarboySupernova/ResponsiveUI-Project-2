//
//  Sidebar.swift
//  ResponsiveUI Project 2
//
//  Created by Simbarashe Dombodzvuku on 6/21/22.
//

import SwiftUI

struct SideBar: View {
    var prop: Properties
    @Binding var currentTab: Tab
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Label {
                    Text("profile")
                        .fontWeight(.semibold)
                } icon: {
                    Image("profile")
                        .resizedToFit(width: 15, height: 15)
                }
                .padding(.vertical, 20)
                .padding(.bottom, 15)

                Rectangle()
                    .fill(.white.opacity(0.1))
                    .frame(height: 1)
                    .padding(.horizontal, -15)

                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Button {
                        withAnimation(.easeInOut) {
                            currentTab = tab
                        }
                    } label: {
                        HStack(spacing: 15) {
                            Image(tab.rawValue)
                                .renderingMode(.template)
                                .resizedToFit(width: 25, height: 25)

                            Text(tab.rawValue)
                                .fontWeight(.semibold)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(currentTab == tab ? .green : .white)

                    }
                    .padding(.top)
                }
            }
            .padding(15)
        }
        .frame(width: 220)
        .background {
            Color.pink
                .ignoresSafeArea()
        }
    }
    
}
struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
