//
//  TodayView.swift
//  App201
//
//  Created by Вячеслав on 9/30/23.
//

import SwiftUI

struct TodayView: View {
    
    @StateObject var viewModel = TodayViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack(alignment: .top) {
                    
                    VStack(alignment: .leading, spacing: 5, content: {
                        
                        Text("Today")
                            .foregroundColor(.black)
                            .font(.system(size: 24, weight: .semibold))
                        
                        Text(Date().convertDate(format: "MMM d"))
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.isAdd = true
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 17, weight: .bold))
                    })
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        ForEach(viewModel.dates) { index in
                            
                            VStack(alignment: .center, spacing: 5, content: {
                                
                                Text(index.title)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text(index.subtitle)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .semibold))
                            })
                            .padding()
                            .background(Capsule().fill(.gray.opacity(0.1)))
                        }
                    }
                    .padding(.horizontal)
                }
                
                if viewModel.transes.isEmpty {
                    
                    VStack(spacing: 5) {
                        
                        Image("empty")
                            .padding(.bottom)
                        
                        Text("No added spending")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("Schedule your first spend to track your spending")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    .padding()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.transes, id: \.self) { index in
                            
                                HStack {
                                    
                                    Circle()
                                        .fill(Color("primary"))
                                        .frame(width: 45, height: 45)
                                        .overlay (
                                        
                                            Circle()
                                                .stroke(.white, lineWidth: 3)
                                                .frame(width: 20, height: 20)
                                        )
                                    
                                    Text(index.name ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .medium))
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(3)
                                    
                                    Spacer()
                                    
                                    Text("-\(index.amount)$")
                                        .foregroundColor(.red)
                                        .font(.system(size: 14, weight: .regular))
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.fetchTrans()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            TodayAdd(viewModel: viewModel)
        })
    }
}

#Preview {
    TodayView()
}
