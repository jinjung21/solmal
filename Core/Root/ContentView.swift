//
//  ContentView.swift
//  solmal
//
//  Created by 최지원 on 2023/09/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
        Group{
            if viewModel.userSession != nil{
                ProfileView()
            }
            else{
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
