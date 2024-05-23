//
//  PopUp.swift
//  Criarte
//
//  Created by Arthur Alves Marsaro (feat. Maria Clara Albuquerque Moura) on 16/05/24.
//
import SwiftUI

struct PopUp: View {
    @Binding var showAlert: Bool
    @Binding var resultBra: Int
    @Binding var resultEng: Int
    @Binding var resultJpn: Int
    var motherTongue : String = ""
    
    var resetAttributes: () -> Void
    let baseWidth : CGFloat = 272.0
    var braWidth : CGFloat {
        return baseWidth * CGFloat(resultBra) / 100
    }
    var engWidth : CGFloat {
        return baseWidth * CGFloat(resultEng) / 100
    }
    var jpnWidth : CGFloat {
        return baseWidth * CGFloat(resultJpn) / 100
    }
    
    let portugueseText = "O falante de português brasileiro é expressivo e informal, usando gírias e diminutivos para criar uma comunicação calorosa. A diversidade regional reflete-se nos diferentes sotaques e variações linguísticas. Gestos e contato físico são comuns, evidenciando a hospitalidade e a proximidade nas interações sociais. A informalidade predomina, com uma pontualidade flexível em encontros sociais. O humor e a alegria são marcantes, tornando as conversas leves e agradáveis."
    
    let japaneseText = "O falante de japonês é geralmente formal e respeitoso, usando honoríficos e níveis de polidez para refletir hierarquia e relações sociais. A linguagem é repleta de sutilezas, com uma comunicação indireta e implícita sendo comum. Gestos são moderados e o contato físico é mínimo, destacando a importância do espaço pessoal. A pontualidade é valorizada e a interação social segue normas de etiqueta rígidas. A cultura do silêncio é apreciada, com pausas frequentes em conversas para reflexão."
    
    let englishText = "O falante de inglês britânico tende a ser formal e polido, valorizando a cortesia e o uso adequado da gramática. O sotaque e as expressões variam regionalmente, refletindo a diversidade cultural do Reino Unido. O humor, especialmente o sarcasmo e a ironia, é uma característica marcante na comunicação. A pontualidade é importante e é comum manter uma certa distância pessoal durante as interações. Conversas frequentemente incluem temas sobre o tempo, e a comunicação é direta, mas educada."
    
    var body: some View {
        ZStack{
            Color(.black).opacity(0.3)
            VStack(alignment: .center, spacing: 14.0) {
                //MARK: - Brazil Graph
                VStack(alignment: .leading) {
                    HStack{
                        Image("flagBrazil")
                            .resizable()
                            .frame(width: 38, height: 23)
                        Text("BRA")
                            .foregroundStyle(.color1)
                    }
                    .padding(.horizontal, 8)
                    HStack(spacing: 27){
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .foregroundStyle(.color1)
                                .cornerRadius(30.0)
                            .frame(width: baseWidth, height: 17.61)
                            Rectangle()
                                .foregroundStyle(motherTongue == "Português" ? .color2 : .color3)
                                .cornerRadius(30.0)
                            .frame(width: braWidth, height: 17.61)
                        }
                        Text("\(resultBra)%")
                            .foregroundStyle(.color1)
                    }
                }
                // MARK: - UK Graph
                VStack(alignment: .leading) {
                    HStack{
                        Image("flagUK")
                            .resizable()
                            .frame(width: 38, height: 23)
                        Text("ENG")
                            .foregroundStyle(.color1)
                    }
                    .padding(.horizontal, 8)
                    HStack(spacing: 27){
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .foregroundStyle(.color1)
                                .cornerRadius(30.0)
                            .frame(width: baseWidth, height: 17.61)
                            Rectangle()
                                .foregroundStyle(motherTongue == "Inglês" ? .color2 : .color3)
                                .cornerRadius(30.0)
                            .frame(width: engWidth, height: 17.61)
                        }
                        Text("\(resultEng)%")
                            .foregroundStyle(.color1)
                    }
                }
                // MARK: - Japan Graph
                VStack(alignment: .leading) {
                    HStack{
                        Image("flagJapan")
                            .resizable()
                            .frame(width: 38, height: 23)
                        Text("JPN")
                            .foregroundStyle(.color1)
                    }
                    .padding(.horizontal, 8)
                    HStack(spacing: 27){
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .foregroundStyle(.color1)
                                .cornerRadius(30.0)
                            .frame(width: baseWidth, height: 17.61)
                            Rectangle()
                                .foregroundStyle(motherTongue == "Japonês" ? .color2 : .color3)
                                .cornerRadius(30.0)
                            .frame(width: jpnWidth, height: 17.61)
                        }
                        Text("\(resultJpn)%")
                            .foregroundStyle(.color1)
                    }
                }
                ZStack(alignment: .leading) {
                    Color(.color2)
                        .cornerRadius(8.0)
                    ScrollView {
                            //TODO: pensar como adicionar o espacamento do texto
                            switch (motherTongue) {
                            case "Português":
                                if resultEng > resultJpn {
                                    Text("Sua maior compatibilidade foi com o Inglês, em \(resultEng)%")
                                        .font(.header1)
                                        .foregroundStyle(.color5)
                                    Text(englishText)
                                        .font(.header2)
                                } else {
                                    Text("Sua maior compatibilidade foi com o Japonês, em \(resultJpn)%")
                                        .font(.header1)
                                    Spacer()
                                    Text(japaneseText)
                                        .font(.header2)
                                }
                            case "Inglês" :
                                if resultBra > resultJpn {
                                    Text("Sua maior compatibilidade foi com o Portugês, em \(resultBra)%")
                                        .font(.header1)
                                    Spacer()
                                    Text(portugueseText)
                                        .font(.header2)
                                } else {
                                    Text("Sua maior compatibilidade foi com o Japonês, em \(resultJpn)%")
                                        .font(.header1)
                                    Spacer()
                                    Text(japaneseText)
                                        .font(.header2)
                                }
                            case "Japonês" :
                                if resultBra > resultEng {
                                    Text("Sua maior compatibilidade foi com o Portugês, em \(resultBra)%")
                                        .font(.header1)
                                    Spacer()
                                    Text(portugueseText)
                                        .font(.header2)
                                } else {
                                    Text("Sua maior compatibilidade foi com o Inglês, em \(resultEng)%")
                                        .font(.header1)
                                        .foregroundStyle(.color5)
                                }
                            default:
                                if resultBra > resultEng && resultBra > resultJpn{
                                    Text("Sua maior compatibilidade foi com o Portugês, em \(resultBra)%")
                                        .font(.header1)
                                    Spacer()
                                    Text(portugueseText)
                                        .font(.header2)
                                } else if resultEng > resultJpn {
                                    Text("Sua maior compatibilidade foi com o Inglês, em \(resultEng)%")
                                        .font(.header1)
                                    Spacer()
                                    Text(englishText)
                                        .font(.header2)
                                } else {
                                    Text("Sua maior compatibilidade foi com o Japonês, em \(resultJpn)%")
                                        .font(.header1)
                                    Spacer()
                                    Text(japaneseText)
                                        .font(.header2)
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                        .foregroundStyle(.color5)
                }
                .frame(width: 342, height: 234)
                //MARK: - Botoes
                HStack {
                    Button(action: {
                        //resetAttributes()
                        showAlert = false }) {
                        Text("CLOSE")
                        .foregroundColor(Color(.color4))
                        .frame(width: 128,height: 28.1)
                        .background(Color(.color1))
                        .cornerRadius(24)
                    }
                        .shadow(radius: 8)
                    Button(action: {
                        resetAttributes()
                        showAlert = false }) {
                        Text("RETAKE")
                        .foregroundColor(Color(.color1))
                        .frame(width: 164,height: 36)
                        .background(Color(.color3))
                        .cornerRadius(24)
                    }
                        .shadow(radius: 8)
                }
                //.padding(.bottom,32.0)
            }
            .frame(width: 357,height: 559)
            .background(Color(.color4))
            .cornerRadius(8)
            .shadow(radius: 8.0)
            .transition(.opacity)
        }.ignoresSafeArea()
    }
    
}

#Preview {
    PopUp(showAlert: .constant(true), resultBra: .constant(75), resultEng: .constant(100), resultJpn: .constant(30),motherTongue: "Inglês", resetAttributes: {})
}
