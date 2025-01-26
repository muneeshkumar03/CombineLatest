//
//  SignupViewViewModel.swift
//  CombineLatest
//
//  Created by Encora on 25/01/25.
//

import Foundation
import Combine

class SignupViewViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isToggleOn: Bool = false
    @Published var isValidFields: Bool = false
    private var cancellables: Set<AnyCancellable> = []
    
    init () {
        Publishers.CombineLatest3($isToggleOn, $username, $password)
            .map { isTnCAccepted, username, password in
                isTnCAccepted && !username.isEmpty && !password.isEmpty
            }
            .receive(on: RunLoop.main)
            .assign(to: &$isValidFields)
    }
           
    
}
