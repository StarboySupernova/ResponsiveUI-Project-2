//
//  Dashboard.swift
//  ResponsiveUI Project 2
//
//  Created by Simbarashe Dombodzvuku on 6/21/22.
//

import SwiftUI

struct Dashboard: View {
    var prop: Properties
    @Binding var showSideBar: Bool

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            let showStorageDetails = prop.isiPad && !prop.isSplit && prop.isLandscape
            VStack(spacing: 15) {
                TopNavBar()

                VStack(spacing: 15) {
                    HStack {
                        Text("My Files")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)

                        Spacer(minLength: 10)

                        Button {

                        } label: {
                            Label {
                                Text("Add New")
                            } icon: {
                                Image(systemName: "plus.fill")
                            }
                            .font(.callout.bold())
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background {
                                RoundedRectangle(cornerRadius:4, style: .continuous)
                                    .fill(Color.blue)
                            }
                        }
                    }
                    .padding(.vertical)

                    OnlineStorageView()

                    //MARK: Recent Files View
                    FilesView()
                        .padding(.top)

                    //MARK: Showing only for smaller screen sizes
                    if !showStorageDetails {
                        //Storage Detail View with Custom Graph
                        StorageDetailsView()
                    }
                }
                .padding(.trailing, showStorageDetails ? (prop.size.width / 4) + 15 : 0)
                .overlay(alignment: .topTrailing) {
                    if showStorageDetails {
                        StorageDetailsView()
                            .frame(width: prop.size.width / 4)
                    }
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background {
            Color.brown
                .ignoresSafeArea()
        }
    }

    //Custom Graph Properties
    func getIndex(item: StorageDetail) -> Int {
        return sampleStorageDetail.firstIndex{ index in
            return index.id == item.id
        } ?? 0
    }

    func getAngle(item: StorageDetail) -> Angle {
        let index = getIndex(item: item)
        let prefixItems = sampleStorageDetail.prefix(index)
        var angle: Angle = .zero
        for item in prefixItems {
            angle += .init(degrees: (item.progress * 360))
        }

        return angle
    }

    @ViewBuilder
    func StorageDetailsView() -> some View {
        VStack(alignment: .leading, spacing: 15){
            Text("Storage Details")
                .font(.title3)
                .bold()
                .padding(.bottom, 10)

            //MARK: Custom Graph
            ZStack{
                Circle()
                    .stroke(Color.green, lineWidth: 25)

                ForEach(sampleStorageDetail) { storage in
                    let index = CGFloat(getIndex(item: storage))
                    let progress = index / CGFloat(sampleStorageDetail.count)
                    Circle()
                        .trim(from: 0, to: storage.progress)
                        .stroke(storage.progressColor, lineWidth: 35 - (10 * progress)) //35 - 10 = 25. This is to enable different width blocks on the circle graph
                        .rotationEffect(.init(degrees: -90))
                        .rotationEffect(getAngle(item: storage))
                }

                VStack {
                    Text("29.1 %")
                        .font(.largeTitle)
                        .bold()

                    Text("Of 625GB")
                        .font(.callout)
                        .fontWeight(.semibold)
                }
            }
            .frame(height: 200)
            .padding()
            .padding(.bottom, 10)

            ForEach(sampleStorageDetail) { item in
                HStack(spacing: 15) {
                    Image(item.icon)
                        .resizedToFit(width: 30, height: 30)

                    VStack(alignment: .leading, spacing: 6){
                        Text(item.type)
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundColor(.white.opacity(0.8))

                        Text(item.files + " files")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                        Text(item.size)
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundColor(.white.opacity(0.8))
                }
                .padding()
                .background {
                    RoundedRectangle(cornerRadius:8, style: .continuous)
                        .strokeBorder(.white.opacity(0.2))
                }
                .padding(.top, 5)
            }

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background {
            RoundedRectangle(cornerRadius:8, style: .continuous)
                .fill(.thinMaterial)
        }
        .padding(.top)
    }

    @ViewBuilder
    func FilesView() -> some View {
        VStack(alignment: .leading, spacing: 15){
            Text("Recent Files")
                .fontWeight(.semibold)
                .foregroundColor(.white.opacity(0.8))

            HStack(spacing: 0) {
                ForEach(["File Name", "Date", "Size"], id: \.self) { type in
                    Text(type)
                        .fontWeight(.semibold)
                        .italic()
                        .frame(maxWidth: .infinity, alignment: type == "File Name" ? .leading : .center)
                }
            }
            .foregroundColor(.white.opacity(0.8))

            Rectangle()
                .fill(.white.opacity(0.1))
                .frame(height: 1)
                .padding(.bottom, 10)

            ForEach(sampleFile) { file in
                HStack(spacing: 0) {
                    Image(file.fileIcon)
                        .resizedToFit(width: 25, height: 25)

                    Text(file.fileType)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text(file.fileDate)
                    .frame(maxWidth: .infinity, alignment: .center)

                    Text(file.fileSize)
                        .frame(maxWidth: .infinity, alignment: .trailing)

                    Rectangle()
                        .fill(.white.opacity(0.2))
                        .frame(height: 1)
                        .padding(.bottom, prop.isiPad ? 10 : 5)

                }
                .font(.system(size: prop.isiPad ? 18 : 14,weight: .semibold, design: .rounded))
                .foregroundColor(.white.opacity(0.8))
            }

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background {
            RoundedRectangle(cornerRadius:8, style: .continuous)
                .fill(.thinMaterial)
        }
    }

    @ViewBuilder
    func OnlineStorageView() -> some View {
        let count = (prop.isiPad && !prop.isSplit ? 1 : 2)
        ScrollView(count == 1 ? .horizontal : .vertical, showsIndicators: false) {
            DynamicLazyGrid(count: count) {
                ForEach(sampleStorage) { storage in
                    VStack(alignment: .leading, spacing: 15) {
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
                            .fill(.thinMaterial)
                    }
                }
            }
        }
    }

    //MARK: Dynamic LazyGrid Content
    @ViewBuilder
    func DynamicLazyGrid<Content: View>(count: Int, @ViewBuilder content: @escaping () -> Content) -> some View {
        if count == 1 {
            LazyHGrid(rows: Array(repeating: GridItem(.flexible(), spacing: 10), count: 1), spacing: 15) {
                content()
            }
        } else {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2), spacing: 15) {
                content()
            }
        }
    }

    @ViewBuilder
    func TopNavBar() -> some View {
        HStack(spacing: 15) {
            if prop.isiPad && !prop.isSplit {
                Text("Dashboard")
                    .font(.title3)
                    .bold()
            } else {
                //menu button for sidebar
                Button {
                    withAnimation(.easeInOut) {
                        showSideBar = true
                    }
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.title2)
                        .foregroundColor(.white)

                }
            }

            HStack {
                TextField("Search", text: .constant(""))
                    .padding(.leading, 10)

                Button {

                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .padding(12)
                        .background {
                            RoundedRectangle(cornerRadius:8, style: .continuous)
                                .fill(Color.teal)
                        }
                }
            }
            .background {
                RoundedRectangle(cornerRadius:8, style: .continuous)
                    .fill(.thinMaterial)
            }
            .frame(maxWidth: 250)
            .frame(maxWidth: .infinity, alignment: .trailing)

            Button {

            } label: {
                Image("profile")
                    .resizedToFill(width: 45, height: 45)
                    .clipShape(Circle())
            }

        }
    }
}
struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
