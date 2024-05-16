//
//  ContentView.swift
//  GringADA
//
//  Created by Arthur Alves Marsaro on 13/05/24.
//

import SwiftUI


struct ContentView: View {
    
    @State var age: Int? = nil
    @State var name: String = ""
    @State var motherTongue: String = ""
    @State var answer1: Int?
    @State var answer2: Int?
    @State var answer3: Int?
    @State var answer4: Int?
    @State var answer5: Int?
    
    var body: some View {
        ZStack {
            //BackGround - Deixa a tela na cor base do aplicativo
            Color(.color1)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            //MiddleGround - onde vai ficar os componentes que serão scrolaveis
            VStack(spacing: 0.0) {
                ZStack(alignment: /*@START_MENU_TOKEN@*/Alignment(horizontal: .center, vertical: .center)/*@END_MENU_TOKEN@*/){
                    Rectangle()  // lembrar de adicionar o titulo do aplicativo ...
                        .foregroundColor(.color4)
                        .ignoresSafeArea()
                        .frame(width: 393)
                    .frame(maxHeight: 80.0)
                    Text("gringADA")
                        .foregroundStyle(.color1)
                        .font(Font.custom("LeagueGothic-Regular", size:56.0))
                }
                ScrollView {
                    VStack(alignment: .leading, spacing: 24.0){
                        Text("Qual a sua compatibilidade com alguns idiomas?")
                            .font(.header1)
                            .foregroundStyle(.color4)
                            .padding(.leading, 5)
                            .padding(.top, 20.0)
                        VStack(alignment: .leading, spacing: 8.0){
                            CustomTextFieldString(value: $name, title: "Nome:")
                        }
                        HStack{
                            VStack(alignment: .leading, spacing: 8.0){
                                CustomTextFieldNumber(value: $age, placeholder: "Idade", title: "Idade:")
                            }
                            VStack(alignment: .leading, spacing: 8.0){
                                CustomTextFieldString(value: $motherTongue, title: "Lingua Materna:")
                            }
                        }
                        Spacer()
                        Button(action: {}, label: {
                            ZStack{
                                Color.color3
                                Text("START")
                                    .foregroundStyle(.color1)
                                //  .font(.___)
                            }
                            .cornerRadius(24.0)
                        })
                        .frame(width: 164, height: 36.0)
                        .frame(maxWidth: .infinity)
                        Spacer()
                        VStack(alignment: .leading, spacing: 60.0) {
                            
                            //Divider()
                            QuestionView(selectedItem: $answer1, questionText: "Você é uma pessoa que se comunica com muito toques/gestos")
                            Divider()
                            QuestionView(selectedItem: $answer2, questionText: "Normalmente um me comunico diretamente se eu discordo ou concordo de algo")
                            Divider()
                            QuestionView(selectedItem: $answer3, questionText: "Prefiro obras literárias com predominancia de texto à imagens")
                            Divider()
                            QuestionView(selectedItem: $answer4, questionText: "Em um idioma, eu me fascino mais pela relação entra as palavras do que a singularidade de cada palavra em si")
                            Divider()
                            QuestionView(selectedItem: $answer5, questionText: "Tenho costume de consumir conteúdo de outras culturas em seu idioma de origem (e.g: Musicas no idioma original e filmes/séries legendada)")
                            Divider()
                            Button(action: {}, label: {
                                ZStack{
                                    Color.color3
                                    Text("FINISH")
                                        .foregroundStyle(.color1)
                                    //  .font(.___)
                                }
                                .cornerRadius(24.0)
                            })
                            .frame(width: 164, height: 36.0)
                            .frame(maxWidth: .infinity)
                            
                        }
                        
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
