//
//  TabBar.swift
//  App201
//
//  Created by Вячеслав on 9/30/23.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 6, content: {
                        
                        Image(index.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(selectedTab == index ? Color("primary") : Color.gray)
                            .frame(width: 35, height: 35)
                        
//                        Text(index.rawValue)
//                            .foregroundColor(selectedTab == index ? Color("primary") : Color.gray)
//                            .font(.system(size: 12, weight: .regular))
                        
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 20)
        .padding(.bottom, 28)
        .background(Color.gray.opacity(0.1))
    }
}

enum Tab: String, CaseIterable {
    
    case Main = "Main"
    
    case Today = "Today"
    
    case Statistics = "Statistics"
    
    case History = "History"
    
    case Settings = "Settings"
    
}

#Preview {
    ContentView()
}
