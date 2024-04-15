//
//  Pages.swift
//  Learning_Style
//
//  Created by AL21 on 13/04/24.
//
//
//import SwiftUI
//
//struct Pages: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct Pages_Previews: PreviewProvider {
//    static var previews: some View {
//        Pages()
//    }
//}

import SwiftUI
class QuizManger:ObservableObject{
    @Published var mockQuestions = [
        Question(title:"what is your favourite color?", answer: "A" , options:["A","B","C","D"]),
        Question(title:"what is your favourite color?", answer: "A" , options:["A","B","C","D"]),
        Question(title:"what is your favourite color?", answer: "A" , options:["A","B","C","D"]),
        Question(title:"what is your favourite color?", answer: "A" , options:["A","B","C","D"])
    ]
    func canSubmitQuiz() -> Bool {
        return mockQuestions.allSatisfy { !$0.selection.isEmpty }
    }

}
struct Pages: View {
    @StateObject var manger = QuizManger()
    var body: some View {
        
        TabView{
            ForEach(manger.mockQuestions.indices, id:\.self){ index in
                VStack{
                    Spacer()
                    QuestionView(question: $manger.mockQuestions[index] )
                    Spacer()
                    if let lastQuestion = manger.mockQuestions.last,
                       lastQuestion.id == $manger.mockQuestions[index].id {
                        Button{
                            print(manger.canSubmitQuiz())
                            
                        }label: {
                            Text("Submit")
                                .padding()
                                .foregroundColor(.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 20,style:.continuous)
                                        .fill(Color.blue)
                                        .frame(width:340)
                                        )
                        }
                    }
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
    
    struct Pages_Previews: PreviewProvider {
        static var previews: some View {
           Pages()
        }
    }
}
