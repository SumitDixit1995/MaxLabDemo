//
//  LoaderView.swift
//  MaxLabDemo
//
//  Created by Sumit Kumar on 07/02/24.
//
import SwiftUI
import UIKit


//MARK:- ActivityIndicator
struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

//MARK:- LoadingView
struct LoadingView: View {
    var isShowing: Bool

    var body: some View {
        ZStack(alignment: .center) {
            VStack {
                Text("Loading...")
                ActivityIndicator(isAnimating: .constant(true), style: .large)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.secondary.colorInvert())
            .foregroundColor(Color.primary)
            .cornerRadius(20)
            .opacity(self.isShowing ? 1 : 0)
        }
    }
}
