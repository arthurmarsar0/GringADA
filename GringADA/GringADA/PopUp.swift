//
//  PopUp.swift
//  Criarte
//
//  Created by Maria Clara Albuquerque Moura on 16/05/24.
//
import SwiftUI

struct PopUp: View {
    @Binding var showAlert: Bool
    @Binding var resultBra: Int
    @Binding var resultEng: Int
    @Binding var resultJpn: Int
    
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
    
    var body: some View {
        ZStack{
            Color(.black).opacity(0.3)
            VStack(alignment: .center, spacing: 14.0) {
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
                                .foregroundStyle(.color3)
                                .cornerRadius(30.0)
                            .frame(width: braWidth, height: 17.61)
                        }
                        Text("\(resultBra)%")
                            .foregroundStyle(.color1)
                    }
                }
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
                                .foregroundStyle(.color3)
                                .cornerRadius(30.0)
                            .frame(width: engWidth, height: 17.61)
                        }
                        Text("\(resultEng)%")
                            .foregroundStyle(.color1)
                    }
                }
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
                                .foregroundStyle(.color3)
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
                    ScrollView{
                        //Texto aqui
                        //TODO: pensar como adicionar o espacamento do texto
                    }
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
    PopUp(showAlert: .constant(true), resultBra: .constant(75), resultEng: .constant(80), resultJpn: .constant(30), resetAttributes: {})
}
