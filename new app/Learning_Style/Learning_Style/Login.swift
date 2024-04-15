import SwiftUI
import Firebase
//import GoogleSignIn
//import GoogleSignInSwift


struct Login: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isSignUp: Bool = false
    @State private var errorMessage: String?
    @State private var showWelcomeView: Bool = false
    @State private var navigateToGuide: Bool = false

    var body: some View {
        NavigationView {
            VStack {
               
                Image("emailIcon")
                             .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 340, height: 340)
                            .padding(.bottom, 10)
               
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }

                Button(action: {
                    if isSignUp {
                        signUp()
                    } else {
                        signIn()
                    }
                }) {
                    Text(isSignUp ? "Sign Up" : "Sign In")
                        .font(.system(size: 25))
                }

                Button(action: {
                    isSignUp.toggle()
                }) {
                    Text(isSignUp ? "Already have an account? Sign In" : "Don't have an account? Sign Up")
                        .font(.system(size: 18))
                        .font(.footnote)
                        .foregroundColor(.blue)
                       

                }
                .padding(.top)
               


                NavigationLink(destination: Pages().navigationBarBackButtonHidden(true), isActive: $navigateToGuide) {
                                    //EmptyView()
                   
                                }
            }
            .padding()
            .navigationTitle(" ")
            .navigationBarBackButtonHidden(true)
        }
    }


   
    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                // User signed up successfully
                // Now sign in the user automatically
//                signIn()
                navigateToGuide = true
            }
        }
    }

    func signIn() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                // User signed in successfully
                showWelcomeView = true
                navigateToGuide = true
            }
        }
    }
}



struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
