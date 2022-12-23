//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Orlando Moraes Martins on 22/12/22.
//
import CoreData
import SwiftUI

enum Predicates: String {
    case BeginsWith = "BEGINSWITH", Equal = "==", GreatherThan = ">", LowerThan = "<", In = "IN", BeginsWithC = "BEGINSWITH[c]"
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    var predicates: Predicates

    var body: some View {
        List(fetchRequest, id: \.self) {item in
            self.content(item)
        }
    }
    
    init(filterKey: String, filterValue: String, predicates: Predicates, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K \(predicates.rawValue) %@", filterKey, filterValue))
        self.content = content
        self.predicates = predicates
    }
}
