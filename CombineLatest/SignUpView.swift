//
//  ContentView.swift
//  CombineLatest
//
//  Created by Encora on 25/01/25.
//

import SwiftUI
import Combine

struct SignUpView: View {
    @StateObject private var viewModel: SignupViewViewModel = SignupViewViewModel()
    private var cancellables: Set<AnyCancellable> = []

    var signUpButton: some View {
        Button {
            
        } label: {
            Text("Sign Up")
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 50)
        .background(viewModel.isValidFields ? Color.blue : Color.gray)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .disabled(viewModel.isValidFields)
    }

    var body: some View {
        ZStack {
            Color.pink
                .edgesIgnoringSafeArea(.all)
            HStack {
                VStack {
                    Text("Sign Up")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        
                    TextField("Username", text: $viewModel.username)
                        .onChange(of: viewModel.username) { oldValue, newValue in
                            if newValue.count > 10 {
                                viewModel.username = oldValue
                            }
                        }
                        .padding(10)
                        .frame(height: 50)
                        .background(.white)
                        .cornerRadius(10)
                        
                    SecureField("Password", text: $viewModel.password)
                        .onChange(of: viewModel.password) { oldValue, newValue in
                            if newValue.count > 10 {
                                viewModel.password = oldValue
                            }
                        }
                        .padding(10)
                        .frame(height: 50)
                        .background(.white)
                        .cornerRadius(10)
                    
                    HStack {
                        Text("Agree to Terms and Conditions")
                            .underline()
                            .foregroundStyle(.white)
                        Toggle("", isOn: $viewModel.isToggleOn)
                            .frame(width: 60)
                    }
                    signUpButton
                    
                }
                .padding(.all)
            }
            .background(.teal)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()
        }
        
    }
}

#Preview {
    SignUpView()
}
