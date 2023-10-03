//
//  TodayPairs.swift
//  App201
//
//  Created by Вячеслав on 9/30/23.
//

import SwiftUI

struct TodayPairs: View {
    
    @StateObject var viewModel: TodayViewModel
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Select Pair")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Text("Done")
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                }
                .padding()
                .padding(.top)
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.pairs, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.pair = index
                                
                                router.wrappedValue.dismiss()
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Text(index)
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                            })
                        }
                    }
                    .padding([.horizontal, .bottom])
                }
            }
        }
    }
}

#Preview {
    TodayPairs(viewModel: TodayViewModel())
}
