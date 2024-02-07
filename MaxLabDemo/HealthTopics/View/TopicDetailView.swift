//
//  TopicsDetailView.swift
//  MaxLabDemo
//
//  Created by Sumit Kumar on 07/02/24.
//

import SwiftUI
import URLImage
import Combine

struct TopicDetailView: View {
    
    var viewModel : HealthTopicsProtocol = HealthTopicsViewModel()
    @State var topic: HealthTopic?
    @State private var isRefreshed = false
    @State private var showLoder = true
    var id : String
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all) // Background color
            if let topic = topic{
                VStack(alignment: .leading) {
                    if let url = URL(string: topic.imageURL) {
                        URLImage(url: url) { image, info in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    Text("Type: \(topic.type ?? "")")
                        .font(.title)
                    Text("Title: \(topic.title)")
                        .font(.subheadline)
                    Text("Categories: \(topic.categories)")
                        .font(.subheadline)
                    Text("Last Update: \(topic.lastUpdate)")
                        .font(.subheadline)
                    Button(action: {
                        if let url = URL(string: topic.accessibleVersion) {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Image(systemName: "globe")
                            .font(.title)
                            .foregroundColor(.white)
                        Text("Accessible Version")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    Spacer()
                }
                .padding()}
        }.onAppear(perform: fetch)
        .overlayWithProgressView(isShowing: showLoder)
    }
    
    private func fetch() {
        viewModel.fetchHealthTopicsDetail(id: id){ topic in
            if topic != nil{
                self.topic = topic
                isRefreshed.toggle()
                showLoder = false
            }
        }
    }
}
