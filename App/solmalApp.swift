//
//  solmalApp.swift
//  solmal
//
//  Created by 최지원 on 2023/09/20.
//

import SwiftUI
import Firebase

@main
struct solmalApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
