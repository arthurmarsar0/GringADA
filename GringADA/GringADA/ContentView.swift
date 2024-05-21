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
    @State var selection1: Idioms?
    @State var answer1: Int? = 3
    @State var answer2: Int? = 2
    @State var answer3: Int? = 1
    @State var answer4: Int? = 4
    @State var answer5: Int? = 0
    @State var failedInput: Bool = false
    @State var failedAnswers: Bool = false
    @State var Poparemos: Bool = false

    //Variaveis que guardarão as respostas
    @State var compBra: Int = 0
    @State var compEng: Int = 0
    @State var compJpn: Int = 0
    
    let failedFirstInputTitle = "Preencha os campos para começar"
    let failedAnswersTitle = "Responda todas as perguntas para finalizar"
    
    var body: some View {
        NavigationStack {
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
                        //MARK: - CAIXA DE INTERAÇÃO INICIAL
                        VStack(alignment: .leading, spacing: 24.0){
                            Text("Qual a sua compatibilidade com alguns idiomas?")
                                .font(.header1)
                                .foregroundStyle(.color4)
                                .padding(.leading, 5)
                                .padding(.top, 20.0)
                            CustomTextFieldString(value: $name, title: "Nome:")
                            HStack(spacing: 17.0){
                                CustomTextFieldNumber(value: $age, placeholder: "Idade", title: "Idade:")
                                VStack(alignment: .leading, spacing: 8.0){ //mudar para picker
                                    Text("Lingua Materna:")
                                        .foregroundStyle(.color4)
                                        .padding(.leading, 8.0)
                                        .padding(.trailing, 40.0)
                                    
                                            DropDownPicker(
                                                selection: $selection1
                                            )
                                }
                                //.zIndex(50)
                            }
                            Spacer()
                            Button(action: processTextFields, label: {
                                ZStack{
                                    Color.color3
                                    Text("START")
                                        .foregroundStyle(.color1)
                                }
                                .cornerRadius(24.0)
                            })
                            .frame(width: 164, height: 36.0)
                            .frame(maxWidth: .infinity)
                            Spacer()
                            //MARK: - PERGUNTAS
                            VStack(alignment: .leading, spacing: 60.0) {
                                
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
                                Button(action: {processQuestions(); self.Poparemos.toggle()}, label: {
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
                        .alert(failedFirstInputTitle, isPresented: $failedInput){
                            Button("OK", role: .cancel, action: {})}
                        .alert(failedAnswersTitle, isPresented: $failedAnswers){
                            Button("OK", role: .cancel, action: {})}
                    }
                    
                }
                if Poparemos {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
                            self.Poparemos.toggle()
                        }
                        PopUp(showAlert: $Poparemos, resultBra: $compBra, resultEng: $compEng, resultJpn: $compJpn, resetAttributes: {})
                }
            }
            
            
            
        }
        .scrollDismissesKeyboard(.immediately)
        
    }
    
    //MARK: - CALCULOS
    
    
    func processTextFields() {
        guard let age, let selection1 else {
            print("preencha o campo de entrada")
            failedInput = true
            return
        }
        
        if age <= 20 {
            compBra += 5
            compEng += 5
            compJpn += 5
        }
        
        
    }
    
    func processQuestions(){
        guard let answer1, let answer2, let answer3, let answer4, let answer5 else{
            print("Responda todas as perguntas para calcular")
            failedAnswers = true
            return
        }
        
        switch answer1 {
        case 0:
            compBra += 0
            compEng += 0
            compJpn += 0
        case 1:
            compBra += 0
            compEng += 0
            compJpn += 0
        case 2:
            compBra += 0
            compEng += 0
            compJpn += 0
        case 3:
            compBra += 0
            compEng += 0
            compJpn += 0
        case 4:
            compBra += 0
            compEng += 0
            compJpn += 0
        default:
            compBra += 0
            compEng += 0
            compJpn += 0
        }
        
        switch answer2 {
        case 0:
            compBra += 0
            compEng += 0
            compJpn += 0
        case 1:
            compBra += 0
            compEng += 0
            compJpn += 0
        case 2:
            compBra += 0
            compEng += 0
            compJpn += 0
        case 3:
            compBra += 0
            compEng += 0
            compJpn += 0
        case 4:
            compBra += 0
            compEng += 0
            compJpn += 0
        default:
            compBra += 0
            compEng += 0
            compJpn += 0
        }
        
        switch answer3 {
        case 0:
            compBra += 0
            compEng += 0
            compJpn += 0
        case 1:
            compBra += 0
            compEng += 0
            compJpn += 0
        case 2:
            compBra += 0
            compEng += 0
            compJpn += 0
        case 3:
            compBra += 0
            compEng += 0
            compJpn += 0
        case 4:
            compBra += 0
            compEng += 0
            compJpn += 0
        default:
            compBra += 0
            compEng += 0
            compJpn += 0
        }
        
        switch answer4 {
        case 0:
            compBra += 0
            compEng += 0
            compJpn += 0
        case 1:
            compBra += 1
            compEng += 0
            compJpn += 0
        case 2:
            compBra += 2
            compEng += 0
            compJpn += 0
        case 3:
            compBra += 3
            compEng += 0
            compJpn += 0
        case 4:
            compBra += 4
            compEng += 0
            compJpn += 0
        default:
            compBra += 0
            compEng += 0
            compJpn += 0
        }
        
        switch answer5 {
        case 0:
            compBra += 0
            compEng += 0
            compJpn += 0
        case 1:
            compBra += 0
            compEng += 0
            compJpn += 0
        case 2:
            compBra += 0
            compEng += 0
            compJpn += 0
        case 3:
            compBra += 0
            compEng += 0
            compJpn += 0
        case 4:
            compBra += 0
            compEng += 0
            compJpn += 0
        default:
            compBra += 0
            compEng += 0
            compJpn += 0
        }
        
        
        //Garantia que no final os resultados estarão menores que 100%
        if compBra >= 100{
            compBra = 100
        }
        if compEng >= 100{
            compEng = 100
        }
        if compJpn >= 100{
            compJpn = 100
        }
    }
}

#Preview {
    ContentView()
}
