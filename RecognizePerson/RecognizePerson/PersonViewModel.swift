//
//  PersonViewModel.swift
//  RecognizePerson
//
//  Created by Manoel Leal on 13/07/22.
//

import Foundation
import UIKit
import CoreData


class PersonViewModel: ObservableObject{
    
    
    @Published var people = [Person]()
    private var context = CoreDataManager.shared.persistentContainer.viewContext
    
    init(){
        let request: NSFetchRequest<Person> = NSFetchRequest(entityName: "Person")
        
        do{
            people = try context.fetch(request)
        } catch {
            print("Error")
        }
    }
    
    func getPeople() {
        let request: NSFetchRequest<Person> = NSFetchRequest(entityName: "Person")
        
        do{
            people = try context.fetch(request)
        } catch {
            print("Error")
        }
    }
    
    
    func savePerson(image: UIImage, name: String){
        let person = Person(context: self.context)
        person.content = image
        person.name = name
        
        try? self.context.save()
    }
}
