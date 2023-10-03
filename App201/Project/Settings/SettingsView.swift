//
//  SettingsView.swift
//  App201
//
//  Created by Вячеслав on 9/30/23.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @AppStorage("viewed_videos") var viewed_videos: Int = 0
    @AppStorage("favorited") var favorited: [String] = []
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.black)
                    .font(.system(size: 24, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding()
                
                Button(action: {
                    
                    guard let url = URL(string: "https://www.termsfeed.com/live/8d220624-11b4-4130-a807-893043d54820") else { return }
                    
                    UIApplication.shared.open(url)
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "doc.fill")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 15, weight: .regular))
                        
                        Text("Usage Policy")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.06)))
                    .padding(.horizontal)
                })
                
                Button(action: {
                    
                    SKStoreReviewController.requestReview()
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 15, weight: .regular))
                        
                        Text("Rate App")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.06)))
                    .padding(.horizontal)
                })
                
                Button(action: {
                    
                    favorited.removeAll()
                    viewed_videos = 0
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "trash.fill")
                            .foregroundColor(Color.red)
                            .font(.system(size: 15, weight: .regular))
                        
                        Text("Reset Progress")
                            .foregroundColor(.red)
                            .font(.system(size: 15, weight: .regular))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.06)))
                    .padding(.horizontal)
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    SettingsView()
}
