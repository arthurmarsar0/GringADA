//
//  QuestionView.swift
//  GringADA
//
//  Created by Arthur Alves Marsaro on 15/05/24.
//

import SwiftUI


struct QuestionView: View {
    @Binding var selectedItem: Int?
    let questionText: String
    
    
    var body: some View {
        VStack(alignment: .leading, spacing:  40.0){
            Text(questionText)
                .font(.Questions)
                .foregroundStyle(.color5)
                .frame(maxWidth: .infinity)
            HStack(spacing: 16.0){
                ForEach(0...4, id: \.self) { index in
                    Button(action: {
                        selectedItem = index
                    },
                           label: {
                            Color.color2
                            .frame(height: 56)
                            .clipShape(
                                getShape(of: index)
                            )
                    })
                }
            }
        }
    }
    
    func getShape(of index: Int) -> some Shape {
        if selectedItem == index {
            return AnyShape(Circle())
        } else {
            return AnyShape(Circle().stroke(lineWidth: 3))
        }
    }
}

#Preview {
    struct PreviewView: View {
        @State var item: Int? = 0
        var body: some View {
            QuestionView(selectedItem: $item, questionText: "viadoooo")
        }
    }
    
    return PreviewView()
}
