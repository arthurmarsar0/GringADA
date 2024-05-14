//
//  ContentView.swift
//  GringADA
//
//  Created by Arthur Alves Marsaro on 13/05/24.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var value: Int?  //alterar esse código para funcionar para qualquer tipo
    let placeholder: String
    let title: String
    
    var body: some View{
        ZStack{
            VStack(alignment: .leading, spacing: 8.0) {
                Text(title)
                    .font(.header2)
                    .foregroundStyle(.color4)
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

struct ContentView: View {
    
    @State var age: Int? = nil
    @State var name: Int? = nil  // está em inteiro somente para essa versão do CustomTextField funcione
    @State var motherTongue: Int? = nil
    
    
    var body: some View {
        ZStack {
            //BackGround - Deixa a tela na cor base do aplicativo
            Color(.color1)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            //MiddleGround - onde vai ficar os componentes que serão scrolaveis
            ScrollView {
                VStack(alignment: .leading, spacing: 24.0){
                    Text("Qual a sua compatibilidade com alguns idiomas?")
                        .font(.header1)
                        .foregroundStyle(.color4)
                        .padding(.leading, 5)
                    VStack(alignment: .leading, spacing: 8.0){
                        CustomTextField(value: $name, placeholder: "", title: "Nome")
                    }
                    HStack{
                        VStack(alignment: .leading, spacing: 8.0){
                            CustomTextField(value: $age, placeholder: "", title: "Idade:")
                        }
                        VStack(alignment: .leading, spacing: 8.0){
                            CustomTextField(value: $motherTongue, placeholder: "", title: "Lingua Materna:")
                        }
                    }
                }
                .padding()
            }
            //FrontGround - nossa NavigationBar (como queremos customizar ela nao pode-se usar o inicializador oficial da linguagem
        }
    }
}

#Preview {
    ContentView()
}
