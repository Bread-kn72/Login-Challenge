//
//  MI+CoreDataProperties.swift
//  Login Challenge
//
//  Created by Kinam on 10/9/24.
//
//

import Foundation
import CoreData


extension MI {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MI> {
        return NSFetchRequest<MI>(entityName: "MI")
    }

    @NSManaged public var email: String?
    @NSManaged public var password: String?

}

extension MI : Identifiable {

}
