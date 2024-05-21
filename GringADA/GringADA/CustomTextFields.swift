//
//  CustomTextFields.swift
//  GringADA
//
//  Created by Arthur Alves Marsaro on 15/05/24.
//

import SwiftUI

struct CustomTextFieldNumber: View {
    
    @Binding var value: Int?  //alterar esse código para funcionar para qualquer tipo
    let placeholder: String //conteudo que fica dentro do textField
    let title: String

    var body: some View{
        ZStack{
            VStack(alignment: .leading, spacing: 8.0) {
                Text(title)
                    .font(.header2)
                    .foregroundStyle(.color5)
                    .padding(.leading, 8)
                TextField(placeholder, value: $value, format: .number)
                    .padding(.vertical, 6)
                    .padding(.leading, 6)
                    .background(
                        Color.color2
                            .clipShape(.rect(cornerRadius: 24))
                    )
            }
        }
    }
}

struct CustomTextFieldString: View {
    
    @Binding var value: String
    let title: String
    
    
    var body: some View{
        ZStack{
            VStack(alignment: .leading, spacing: 8.0) {
                Text(title)
                    .font(.header2)
                    .foregroundStyle(.color5)
                    .padding(.leading, 8)
                TextField(title, text: $value)
                    .padding(.vertical, 6)
                    .padding(.leading, 6)
                    .background(
                        Color.color2
                            .clipShape(.rect(cornerRadius: 24))
                    )
            }
        }
    }
}

#Preview {
    @State var value: String = ""
    return CustomTextFieldString(value: $value, title: "babado")
}
