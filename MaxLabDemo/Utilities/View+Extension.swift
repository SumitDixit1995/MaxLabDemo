//
//  View+Extension.swift
//  MaxLabDemo
//
//  Created by Sumit Kumar on 07/02/24.
//

import SwiftUI

//MARK:- View Extentions 
extension View {
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}

extension View {
    func overlayWithProgressView(isShowing: Bool, tint: Color = .gray) -> some View {
        self.overlay(
            ZStack {
                if isShowing {
                    GeometryReader { geometry in
                        Color.black.opacity(0)
                            .edgesIgnoringSafeArea(.all)
                        VStack{
                            Spacer()
                            HStack {
                                Spacer()
                                LoadingView(isShowing: isShowing)
                                    .scaleEffect(1.0, anchor: .center)
                                    .frame(width: geometry.size.width / 3, height: geometry.size.width / 3)
                                Spacer()
                            }
                            Spacer()
                        }
                    }
                }
            }
        )
    }
}

struct ViewDidLoadModifier: ViewModifier {
    
    @SwiftUI.State private var didLoad = false
    private let action: (() -> Void)?
    
    init(perform action: (() -> Void)? = nil) {
        self.action = action
    }
    
    func body(content: Content) -> some View {
        content.onAppear {
            if didLoad == false {
                didLoad = true
                action?()
            }
        }
    }
}

extension View {
    
    func onLoad(perform action: (() -> Void)? = nil) -> some View {
        modifier(ViewDidLoadModifier(perform: action))
    }
    
}
