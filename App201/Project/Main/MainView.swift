//
//  MainView.swift
//  App201
//
//  Created by Вячеслав on 9/30/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                if let index = viewModel.lessons.randomElement() {
                    
                    WebPic(urlString: index.image ?? "", width: .infinity, height: 300, cornerRadius: 0, isPlaceholder: true)
                        .overlay (
                            
                            ZStack {
                                
                                VStack(alignment: .leading, spacing: 6, content: {
                                    
                                    Text(index.title ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .medium))
                                        .multilineTextAlignment(.leading)
                                    
                                    Text("Duration: \(index.duration ?? 0) min.")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                        .multilineTextAlignment(.leading)
                                        .padding(.bottom, 30)
                                    
                                    Button(action: {
                                        
                                        viewModel.viewed_videos += 1
                                        viewModel.selectedLesson = index
                                        viewModel.isDetail = true
                                        
                                    }, label: {
                                        
                                        Text("Watch")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15 ,weight: .regular))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 50)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                                    })
                                })
                                
                                
                            }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(LinearGradient(colors: [Color.black.opacity(1), Color.black.opacity(0.4), Color.black.opacity(0.3)], startPoint: .bottom, endPoint: .top))
                                .frame(maxHeight: .infinity, alignment: .bottom)
                        )
                        .ignoresSafeArea(.all, edges: .top)
                }
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack(spacing: 45) {
                        
                        VStack(alignment: .leading, content: {
                            
                            Text("Best of the month")
                                .foregroundColor(.black)
                                .font(.system(size: 21, weight: .semibold))
                                .multilineTextAlignment(.leading)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                HStack {
                                    
                                    ForEach(Array(viewModel.lessons).shuffled().prefix(4), id: \.self) { index in
                                        
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
                                        })
                                    }
                                }
                            }
                        })
                        
                        VStack(alignment: .leading, content: {
                            
                            Text("The most important")
                                .foregroundColor(.black)
                                .font(.system(size: 21, weight: .semibold))
                                .multilineTextAlignment(.leading)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                HStack {
                                    
                                    ForEach(Array(viewModel.lessons).shuffled().prefix(7), id: \.self) { index in
                                        
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
                                        })
                                    }
                                }
                            }
                        })
                        
                        VStack(alignment: .leading, content: {
                            
                            Text("General directory")
                                .foregroundColor(.black)
                                .font(.system(size: 21, weight: .semibold))
                                .multilineTextAlignment(.leading)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                HStack {
                                    
                                    ForEach(Array(viewModel.lessons).shuffled().prefix(4), id: \.self) { index in
                                        
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
                                        })
                                    }
                                }
                            }
                        })
                    }
                    .padding([.horizontal, .bottom])
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
    MainView()
}
