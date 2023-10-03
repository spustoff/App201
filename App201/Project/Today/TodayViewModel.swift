//
//  TodayViewModel.swift
//  App201
//
//  Created by Вячеслав on 9/30/23.
//

import SwiftUI
import CoreData

final class TodayViewModel: ObservableObject {
    
    @Published var dates: [DateModel] = [
    
        DateModel(title: "01/10", subtitle: "Sun"),
        DateModel(title: "02/10", subtitle: "Mon"),
        DateModel(title: "03/10", subtitle: "Tue"),
        DateModel(title: "04/10", subtitle: "Thu"),
        DateModel(title: "05/10", subtitle: "Wed"),
        DateModel(title: "06/10", subtitle: "Fri"),
        DateModel(title: "07/10", subtitle: "Sun"),
    ]
    
    @Published var name: String = ""
    @Published var amount: String = ""
    @Published var date: String = ""
    @Published var pair: String = "EURUSD"
    
    @Published var isPairs: Bool = false
    @Published var isAdd: Bool = false
    @Published var isChart: Bool = false
    
    @Published var pairs: [String] = ["EURUSD", "EURTRY", "EURKZT", "EURJPY", "EURCAD", "USDTRY", "USDKZT", "USDJPY", "USDCAD"]
    
    @Published var transes: [TodayModel] = []
    
    func addTrans(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "TodayModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let trans = NSEntityDescription.insertNewObject(forEntityName: "TodayModel", into: context) as! TodayModel
        
        trans.name = name
        trans.amount = Int16(amount) ?? 0
        trans.date = date
        trans.pair = pair
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchTrans() {
        
        CoreDataStack.shared.modelName = "TodayModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TodayModel>(entityName: "TodayModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.transes = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.transes = []
        }
    }
}

struct DateModel: Identifiable {
    
    var id = UUID().uuidString
    
    var title: String
    var subtitle: String
}
