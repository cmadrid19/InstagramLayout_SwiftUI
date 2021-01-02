//
//  Home.swift
//  InstagramFeedLayout
//
//  Created by Maxim Macari on 31/12/20.
//

import SwiftUI

struct Home: View {
    
    @StateObject var jsonModel = JSONViewModel()
    
    var body: some View {
        VStack{
            HStack {
                HStack{
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    TextField("Search", text: $jsonModel.search)
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(
                    Color.primary.opacity(0.06)
                )
                .cornerRadius(10)
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "qrcodee.viewfinder")
                        .font(.title)
                        .foregroundColor(.primary)
                })
            }
            .padding()
            
            if jsonModel.cards.isEmpty {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }else{
                ScrollView{
                    
                    VStack(spacing: 4){
                        
                        ForEach(jsonModel.compositionalArray.indices, id: \.self){ index in
                            
                            if index == 0 || index % 6 == 0 {
                                Layout1(cards: jsonModel.compositionalArray[index])
                            }else if index % 3 == 0 {
                                Layout3(cards: jsonModel.compositionalArray[index])
                            }
                            else{
                                Layout2(cards: jsonModel.compositionalArray[index])
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
