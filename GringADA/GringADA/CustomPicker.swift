////
////  CustomPicker.swift
////  GringADA
////
////  Created by Arthur Alves Marsaro on 17/05/24.
////
//
//import SwiftUI
//import Foundation
//
//enum DropDownPickerState {
//    case top
//    case bottom
//    
//}
//
//struct CustomPicker: View {
//    @Binding var value: String?
//    var state: DropDownPickerState = .bottom
//    var options: [Idioms]
//    var maxWidth: CGFloat = 180
//    let placeHolder : String
//    
//    @State var _showDropDown = false
//    
//    @SceneStorage("drop_down_zindex") private var index = 1000.0
//    @State var zindex = 1000.0
//    
//    var body: some View {
//        GeometryReader{
//            let size = $0.size
//            VStack(spacing: 0){
//                if state == .top && _showDropDown {
//                    OptionsView()
//                }
//                
//                HStack{
//                    Text(value == nil ? placeHolder : value!)
//                        .foregroundColor(value != nil ? .blue : .black)
//                        .font(.header1)
//                    
//                    Spacer(minLength: 0)
//                    Image(systemName: state == .top ? "chevron.up" : "chevron.down")
//                        .foregroundColor(.chevron.opacity(0.4))
//                    
//                }
//                .padding(.horizontal,15)
//                .frame(width: 165.0, height: 36.0)
//                .background(.black)
//                .contentShape(.rect)
//                .onTapGesture{
//                    index += 1
//                    zindex = index
//                    withAnimation(.snappy){
//                        _showDropDown.toggle()
//                    }
//                }
//                .clipped()
//                .background(.black)
//                .cornerRadius(24)
//                .overlay{  //colocar o delininhado no picker
//                    RoundedRectangle(cornerRadius: 24.0)
//                        .stroke(.gray)
//                }
//                .frame(height: size.height, alignment: state == .top ? .bottom: .top)
//            }
//            .frame(width: maxWidth, height: 50.0)
//            .zIndex(zindex)
//        }
//        
//    }
//    
//    func OptionsView() -> some View {
//        
//        VStack(alignment: .leading, spacing: 0){
//            ForEach(options, id: \.self) { idiom in
//                HStack{
//                    Text(idiom.rawValue)
//                        .foregroundColor(.black)
//                }
//                .foregroundStyle(value == idiom.rawValue ? .green: .black)
//                .animation(.none, value: value)
//                .frame(height: 40.0)
//                .frame(maxWidth: .infinity)
//                .contentShape(.rect)
//                .padding(.horizontal, 15.0)
//                .onTapGesture {
//                    withAnimation(.snappy){
//                        value = idiom.rawValue
//                        _showDropDown.toggle()
//                    }
//                }
//            }
//        }
//        .transition(.move(edge: state == .top ? .bottom : .top))
//        .zIndex(1.0)
//    }
//}
//
//#Preview {
//    
//    @State var value: String?
//    return CustomPicker(value: $value, options: Idioms.allCases, placeHolder: "Select")
//}
