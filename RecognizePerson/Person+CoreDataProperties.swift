//
//  Person+CoreDataProperties.swift
//  RecognizePerson
//
//  Created by Manoel Leal on 13/07/22.
//
//

import Foundation
import CoreData
import UIKit


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var content: UIImage?
    @NSManaged public var name: String?

}

extension Person : Identifiable {

}
