//
//  Users_2.swift
//  App201
//
//  Created by Вячеслав on 9/30/23.
//

import SwiftUI
import StoreKit

struct Users_2: View {
    
    let telegram: URL
    let isTelegram: Bool
    let isContacts: Bool
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("users_2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            
                VStack(spacing: 6, content: {
                    
                    Text("Rate our app")
                        .foregroundColor(.black)
                        .font(.system(size: 23, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("Leave your opinion in the AppStore")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding()
                .padding(.horizontal)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    if isTelegram == true {
                        
                        Users_3(telegram: telegram, isContacts: isContacts)
                            .navigationBarBackButtonHidden()
                        
                    } else if isTelegram == false {
                        
                        if isContacts == true {
                            
                            Users_4()
                                .navigationBarBackButtonHidden()
                            
                        } else if isContacts == false {
                            
                            Users_5()
                                .navigationBarBackButtonHidden()
                        }
                    }
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
            }
            .onAppear {
                
                SKStoreReviewController.requestReview()
            }
        }
    }
}

#Preview {
    Users_2(telegram: URL(string: "h")!, isTelegram: false, isContacts: false)
}
