import FirebaseCore
import SwiftUI
struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text("Trivia Game")
                        .foregroundColor(Color("AccentColor"))
                    Text("Are you ready to test out your trivia skills?")
                }
                NavigationLink(destination: Login()) {
                    Text("Let's go!")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        }
    }
}

