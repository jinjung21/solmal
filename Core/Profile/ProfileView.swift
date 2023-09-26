//
//  ProfileView.swift
//  solmal
//
//  Created by Jin Jung on 2023/09/25.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser{
            List{
                Section{
                    HStack{
                        Text("Welcome! \(user.fullName)")
                            .padding()
                    }
                }
                
                Section("General"){
                    HStack{
                        SettingRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                    
                        Spacer()
                    }
                }
                
                Section("Account"){
                    Button{
                        viewModel.signOut()
                    } label: {
                        SettingRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                    }
                    
                    Button{
                        print("Sign out...")
                    } label: {
                        SettingRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                    }
                    
                }
            }
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
