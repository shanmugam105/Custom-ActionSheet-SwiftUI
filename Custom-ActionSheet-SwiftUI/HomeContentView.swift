//
//  HomeContentView.swift
//  Custom-ActionSheet-SwiftUI
//
//  Created by Mac on 08/05/22.
//

import SwiftUI

struct HomeContentView: View {
    @State private var showActionSheet: Bool = false
    var body: some View {
        ZStack {
            VStack {
                Button {
                    showActionSheet.toggle()
                } label: {
                    Text("Present action sheet")
                }
            }
            VStack {
                Spacer()
                CustomActionSheet()
                    .offset(y: self.showActionSheet ? 0 : UIScreen.main.bounds.height)
            }
            .background(
                (self.showActionSheet ? Color.black.opacity(0.3) : Color.clear)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        self.showActionSheet.toggle()
                    }
            )
            .edgesIgnoringSafeArea(.bottom)
        }
        .animation(.default)
        
    }
}

struct CustomActionSheet: View {
    var body: some View {
        let bottomPadding = UIApplication.shared.windows.last?.safeAreaInsets.bottom ?? 0
        VStack(spacing: 15) {
            HStack {
                Text("Item 1")
                Spacer()
            }
            HStack {
                Text("Item 2")
                Spacer()
            }
            HStack {
                Text("Item 3")
                Spacer()
            }
            HStack {
                Text("Item 4")
                Spacer()
            }
            HStack {
                Text("Item 5")
                Spacer()
            }
        }
        .padding(.bottom, bottomPadding + 10)
        .padding(.horizontal)
        .padding(.top, 20)
        .background(Color.white)
        .cornerRadius(15)
    }
}
