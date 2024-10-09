//
//  CoreData Methods.swift
//  Login Challenge
//
//  Created by Kinam on 10/9/24.
//

import CoreData
import UIKit

final class CoreDataMethods {
    
    // MARK: - properties
    static let shared = CoreDataMethods()
    
    var container: NSPersistentContainer {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("AppDelegate를 가져올 수 없습니다.")
        }
        return appDelegate.persistentContainer
    }
    
    // MARK: - methods
    func createData(email: String, password: String) {
        guard let entity = NSEntityDescription.entity(forEntityName: "MI", in: self.container.viewContext) else { return }
        let newMI = NSManagedObject(entity: entity, insertInto: self.container.viewContext)
        newMI.setValue(email, forKey: MI.Key.email)
        newMI.setValue(password, forKey: MI.Key.password)
        
        do {
            try self.container.viewContext.save()
            print("회원정보 저장 성공")
        } catch {
            print("회원정보 저장 실패")
        }
    }
    
    func readAllData() {
        do {
            let mis = try self.container.viewContext.fetch(MI.fetchRequest())
            
            for mi in mis as [NSManagedObject] {
                if let email = mi.value(forKey: MI.Key.email) as? String,
                   let password = mi.value(forKey: MI.Key.password) as? String {
                    print("email: \(email), password: \(password)")
                }
            }
            
        } catch {
            print("데이터 읽기 실패")
        }
    }
    
    func deleteData(name: String) {
        let fetchRequest = MI.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            let result = try self.container.viewContext.fetch(fetchRequest)
            
            for data in result as [NSManagedObject] {
                self.container.viewContext.delete(data)
                print("삭제된 데이터: \(data)")
            }
            
            try self.container.viewContext.save()
            print("데이터 삭제 완료")
            
        } catch {
            print("데이터 삭제 실패: \(error)")
        }
    }
}
