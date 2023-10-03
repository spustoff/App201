//
//  TodayChart.swift
//  App201
//
//  Created by Вячеслав on 9/30/23.
//

import SwiftUI

struct TodayChart: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel: TodayViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .leading, spacing: 7, content: {
                    
                    Text(viewModel.pair)
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.leading)
                    
                    Text("$\(Int.random(in: 1...25555))")
                        .foregroundColor(.black)
                        .font(.system(size: 21, weight: .black))
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.top, .horizontal])
                
                Chart(pair: viewModel.pair)
                    .disabled(true)
                
                Button(action: {
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Done")
                        .foregroundColor(.black)
                        .font(.system(size: 15 ,weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding([.horizontal, .bottom])
                })
            }
        }
    }
}

#Preview {
    TodayChart(viewModel: TodayViewModel())
}
