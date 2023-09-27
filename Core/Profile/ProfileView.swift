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
        NavigationView{
            if let user = viewModel.currentUser{
                List{
                    Section{
                        HStack{
                            Text("Welcome! \(user.fullName)")
                                .padding()
                        }
                    }
                    
                    Section("Time Table"){
                        VStack{
                            // 시간표 메인화면 가기
                            NavigationLink{
                                TimeTableMainView()
                            } label: {
                                SettingRowView(imageName: "arrow.right.circle.fill", title: "Time Table", tintColor: .green)
                            }
                        }
                    }
                    
                    Section("Community"){
                        VStack{
                            // 게시판 메인화면 가기
                            NavigationLink{
                                CommunityMainView()
                            } label: {
                                SettingRowView(imageName: "arrow.right.circle.fill", title: "Community", tintColor: .green)
                                
                            }
                        }
                    }
                    
                    Section("Setting"){
                        VStack{
                            // 환경설정 가기
                            NavigationLink{
                                SettingView()
                            } label: {
                                SettingRowView(imageName: "arrow.right.circle.fill", title: "Setting", tintColor: .green)
                            }
                        }
                        
                        
    //                    HStack{
    //                        SettingRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
    //
    //                        Spacer()
    //                    }
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
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
