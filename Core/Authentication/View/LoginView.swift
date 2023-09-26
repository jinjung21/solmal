//
//  LoginView.swift
//  solmal
//
//  Created by 정의진 on 2023/09/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView{
            VStack{
                // image
                
                // form fields
                VStack(spacing: 24){
                    InputView(text: $email, title: "Email Address", placeHolder: "name@example.com")
                    .autocapitalization(.none) //we dont want it to automatically capitalize things
                    InputView(text: $password, title: "Password", placeHolder: "Enter your password", isSecureField: true)
                }
                .padding(.horizontal)
                
                // sign in button
                Button{
                    Task{
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                } label: {
                    HStack{ //"Sign in" 관련
                        Text("Sign in")
                            .fontWeight(.semibold) //글씨체"
                        Image(systemName: "arrow.right") //옆에 화살표
                    }
                    .foregroundColor(.white) //글씨 색
                    .frame(width: UIScreen.main.bounds.width - 32, height:48) //프레임 만들기
                }
                .background(Color(.systemBlue)) //프레임 색
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(10) //프레임 구석탱이 귀엽게 동그랗게
                .padding(.top, 24)
                
                //Spacer()  <-- 이거 하면 위로 정렬
            
                
                // sign up button
                NavigationLink{
                    RegistrationView()
                        .navigationBarBackButtonHidden(true) //있으면  back버튼 없어짐. 편한지는 모르겠음 ㅋㅋ
                } label: {
                    HStack{
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
                
                
            }
        }
    }
}

//MARK: - AuthenticationFormProtocol

extension LoginView: AuthenticationFormProtocol{
    var formIsValid: Bool{
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
