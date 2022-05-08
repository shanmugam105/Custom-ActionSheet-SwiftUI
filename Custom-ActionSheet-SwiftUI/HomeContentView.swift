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
                CustomActionSheet(showActionSheet: $showActionSheet)
            }
            .background(
                (self.showActionSheet ? Color.black.opacity(0.3) : Color.clear)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        hideKeyboard()
                        self.showActionSheet.toggle()
                    }
            )
            .edgesIgnoringSafeArea(.bottom)
        }
        .animation(.default)
        
    }
}

struct CustomActionSheet: View {
    let showActionSheet: Binding<Bool>
    @State var username: String = ""
    @State var keyboardHeight: CGFloat = 0.0
    var body: some View {
        let bottomPadding = UIApplication.shared.windows.last?.safeAreaInsets.bottom ?? 0
        VStack(spacing: 15) {
            Text("Item 1")
            Text("Item 1")
            Text("Item 1")
            Text("Item 1")
            TextField("User name", text: $username)
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, bottomPadding + 10)
        .padding(.horizontal)
        .padding(.top, 20)
        .background(Color.white)
        .cornerRadius(15)
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
                if let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                    keyboardHeight = value.height
                }
            }
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { notification in
                keyboardHeight = 0
            }
        }
        .offset(y: showActionSheet.wrappedValue ? -keyboardHeight : UIScreen.main.bounds.height)
    }
}


extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

