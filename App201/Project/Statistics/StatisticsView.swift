//
//  StatisticsView.swift
//  App201
//
//  Created by Вячеслав on 9/30/23.
//

import SwiftUI

struct StatisticsView: View {
    
    @AppStorage("viewed_videos") var viewed_videos: Int = 0
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Statistics")
                    .foregroundColor(.black)
                    .font(.system(size: 24, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding()
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        HStack {
                            
                            VStack(alignment: .center, spacing: 13, content: {
                                
                                Text("0")
                                    .foregroundColor(.black)
                                    .font(.system(size: 21, weight: .black))
                                
                                Text("Planned Days")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
                            
                            VStack(alignment: .center, spacing: 13, content: {
                                
                                Text("$0")
                                    .foregroundColor(.black)
                                    .font(.system(size: 21, weight: .black))
                                
                                Text("Total Spending")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            
                            VStack(alignment: .center, spacing: 13, content: {
                                
                                Text("\(viewed_videos)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 21, weight: .black))
                                
                                Text("Viewed Videos")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
                            
                            VStack(alignment: .center, spacing: 13, content: {
                                
                                Text("0")
                                    .foregroundColor(.black)
                                    .font(.system(size: 21, weight: .black))
                                
                                Text("Listened Videos")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    StatisticsView()
}
