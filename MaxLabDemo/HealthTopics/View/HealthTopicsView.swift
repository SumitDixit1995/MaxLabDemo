//
//  ContentView.swift
//  MaxLabDemo
//
//  Created by Sumit Kumar on 07/02/24.
//

import SwiftUI
import Combine

struct HealthTopicsView: View {
    
    var viewModel : HealthTopicsProtocol = HealthTopicsViewModel()
    @State private var isRefreshed = false
    @State private var showLoder = true
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.white.edgesIgnoringSafeArea(.all)
                   
                VStack{
                    List(self.viewModel.healthTopics ?? []) { topic in
                        NavigationLink(destination: TopicDetailView(id: topic.idx)) {
                            VStack(alignment: .leading) {
                                Text(topic.type ?? "")
                                    .font(.headline)
                                Text(topic.title)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                        }
                        .edgesIgnoringSafeArea(.all)
                    }
                    .navigationBarTitle("Health Topics") // Set the navigation bar title
                    .onReceive(Just(isRefreshed)) { _ in
                        // Optionally handle refresh action here
                    }}
            }
            .overlayWithProgressView(isShowing: showLoder)
            
            
        }.onAppear(perform: fetch)
    }
    
    private func fetch() {
        viewModel.fetchHealthTopics { isSuscess in
            if isSuscess{
                isRefreshed.toggle()
                showLoder = false
            }
        }
    }
}
