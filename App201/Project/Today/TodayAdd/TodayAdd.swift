//
//  TodayAdd.swift
//  App201
//
//  Created by Вячеслав on 9/30/23.
//

import SwiftUI

struct TodayAdd: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel: TodayViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add New")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.addTrans(completion: {
                                
                                viewModel.fetchTrans()
                                
                                router.wrappedValue.dismiss()
                            })
                            
                        }, label: {
                            
                            Text("Done")
                                .foregroundColor(.blue)
                                .font(.system(size: 15, weight: .regular))
                        })
                        .opacity(viewModel.name.isEmpty || viewModel.amount.isEmpty || viewModel.date.isEmpty ? 0.6 : 1)
                        .disabled(viewModel.name.isEmpty || viewModel.amount.isEmpty || viewModel.date.isEmpty ? true : false)
                    }
                }
                .padding()
                .padding(.top)
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack(spacing: 30) {
                        
                        VStack(alignment: .leading, content: {
                            
                            Text("The name of the waste")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Type name...")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.name.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.name)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                        })
                        
                        VStack(alignment: .leading, content: {
                            
                            Text("Spending amount")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            HStack {
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("$ 100")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                        .opacity(viewModel.amount.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.amount)
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .regular))
                                        .keyboardType(.decimalPad)
                                })
                                
                                Spacer()
                                
                                Button(action: {
                                    
                                    viewModel.isPairs = true
                                    
                                }, label: {
                                    
                                    Text(viewModel.pair)
                                        .foregroundColor(.black)
                                        .font(.system(size: 13, weight: .medium))
                                        .padding(6)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                                })
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                        })
                        
                        VStack(alignment: .leading, content: {
                            
                            Text("Select Date")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                HStack {
                                    
                                    ForEach(viewModel.dates) { index in
                                        
                                        Button(action: {
                                            
                                            viewModel.date = index.title
                                            
                                        }, label: {
                                            
                                            VStack(alignment: .center, spacing: 5, content: {
                                                
                                                Text(index.title)
                                                    .foregroundColor(viewModel.date == index.title ? .black : .gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Text(index.subtitle)
                                                    .foregroundColor(viewModel.date == index.title ? .black : .gray)
                                                    .font(.system(size: 13, weight: .semibold))
                                            })
                                            .padding()
                                            .background(Capsule().fill(viewModel.date == index.title ? Color("primary") : .gray.opacity(0.1)))
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
        .sheet(isPresented: $viewModel.isPairs, content: {
            
            TodayPairs(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isChart, content: {
            
            TodayChart(viewModel: viewModel)
        })
        .onChange(of: viewModel.pair) { new in
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                
                viewModel.isChart = true
            }
        }
    }
}

#Preview {
    TodayAdd(viewModel: TodayViewModel())
}
