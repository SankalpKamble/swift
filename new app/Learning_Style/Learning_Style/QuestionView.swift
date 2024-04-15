//
//  QuestionView.swift
//  Learning_Style
//
//  Created by AL21 on 13/04/24.
//

import SwiftUI
struct Question: Identifiable {
    let id = UUID()
    let title: String
    let answer: String
    let options: [String]
    var selection: Set<String> = [] // Changed to Set<String>
}

struct QuestionView: View {
    @Binding var question: Question

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(question.title)
            ForEach(question.options, id: \.self) { option in
                HStack {
                    Button {
                        if question.selection.contains(option) {
                            question.selection.remove(option)
                        } else {
                            question.selection.insert(option)
                        }
                    } label: {
                        if question.selection.contains(option) {
                            Circle()
                                .shadow(radius: 3)
                                .frame(width: 24, height: 24)
                        } else {
                            Circle()
                                .stroke()
                                .shadow(radius: 3)
                                .frame(width: 24, height: 24)
                        }
                    }
                    Text(option)
                }
                .foregroundColor(Color(uiColor: .secondaryLabel))
            }
        }
        .padding(.horizontal, 20)
        .frame(width: 340, height: 550, alignment: .leading)
        .background(Color(uiColor: .systemGray6))
        .cornerRadius(20)
        .shadow(color: Color(uiColor: .label).opacity(0.2), radius: 15)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question : .constant(Question(title:"what is your favourite color?", answer: "A" , options:["A","B","C","D"])))
    }
}
