//
//  MI+CoreDataClass.swift
//  Login Challenge
//
//  Created by Kinam on 10/9/24.
//
//

import Foundation
import CoreData

@objc(MI)
public class MI: NSManagedObject {
    public static let className = "MI"
    public enum Key {
        static let email = "email"
        static let password = "password"
    }
}
