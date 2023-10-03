//
//  HistoryView.swift
//  App201
//
//  Created by Вячеслав on 9/30/23.
//

import SwiftUI

struct HistoryView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("History")
                    .foregroundColor(.black)
                    .font(.system(size: 24, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding()
                
                if viewModel.favorited.isEmpty {
                    
                    VStack(spacing: 5) {
                        
                        Image("empty")
                            .padding(.bottom)
                        
                        Text("No browsing history")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("This is where the statistics of your interaction with the video is collected")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    .padding()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: true) {
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.lessons.filter{viewModel.favorited.contains($0.title ?? "")}, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.viewed_videos += 1
                                    viewModel.selectedLesson = index
                                    viewModel.isDetail = true
                                    
                                }, label: {
                                    
                                    VStack(alignment: .leading, spacing: 15, content: {
                                        
                                        WebPic(urlString: index.image ?? "", width: 150, height: 100, cornerRadius: 10, isPlaceholder: true)
                                        
                                        Text(index.title ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .medium))
                                            .frame(width: 140)
                                            .multilineTextAlignment(.leading)
                                            .lineLimit(2)
                                    })
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                })
                            }
                        })
                        .padding([.horizontal, .bottom])
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.getVideos()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            MainDetail(index: viewModel.selectedLesson)
        })
    }
}

#Preview {
    HistoryView()
}
