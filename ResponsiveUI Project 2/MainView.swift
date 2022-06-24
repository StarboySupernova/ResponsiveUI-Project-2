//
//  ContentView.swift
//  ResponsiveUI Project 2
//
//  Created by Simbarashe Dombodzvuku on 6/21/22.
//

import SwiftUI

struct MainView: View {
    @State private var currentTab: Tab = .dashboard
    @State private var showSideBar: Bool = false
    var body: some View {
        ResponsiveView { prop in
            HStack(spacing: 0) {
                //displaying only on iPad and not on split mode
                if prop.isiPad && !prop.isSplit {
                    SideBar(prop: prop, currentTab: $currentTab)
                }

                Dashboard(prop: prop, showSideBar: $showSideBar)

            }
            .overlay {
                ZStack(alignment: .leading) {
                    Color.black
                        .opacity(showSideBar ? 0.35 : 0)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                showSideBar = false
                            }
                        }

                    if showSideBar {
                        SideBar(prop: prop, currentTab: $currentTab)
                            .transition(.move(edge: .leading))
                    }
                }
            }
        }
    }
    
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}
