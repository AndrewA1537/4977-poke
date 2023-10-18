//
//  HeaderView.swift
//  pokeAPI
//
//  Created by Petronela Anca on 2023-10-17.
//



import SwiftUI



struct HeaderView: View
{
    let title:     String
    let subtitle:  String
    let angle:     Double
    let backColor: Color
    
    var body: some View
    {
        ZStack
        {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backColor)
                .rotationEffect(Angle(degrees: angle))
            
            VStack
            {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -135)
    }
}



#Preview 
{
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, backColor: .brown)
}
