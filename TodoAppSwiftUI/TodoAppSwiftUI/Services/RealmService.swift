//
//  RealmService.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 18/06/23.
//

import Foundation
import RealmSwift

class RealmService {
  private let database: Realm
  
  static let shared = RealmService()
  
  private var realmConfiguration: Realm.Configuration = {
    var key = Data(count: 64)
    _ = key.withUnsafeMutableBytes({ (pointer: UnsafeMutableRawBufferPointer) in
      SecRandomCopyBytes(kSecRandomDefault, 64, pointer.baseAddress!)
    })
    
    let config = Realm.Configuration(encryptionKey: key)
    return config
  }()
  
  private init() {
    do {
//      database = try Realm(configuration: realmConfiguration)
      database = try Realm()
    } catch {
      fatalError(error.localizedDescription)
    }
  }
  
  public func fetch<T: Object>(with type: T.Type) throws -> Results<T> {
    return database.objects(T.self)
}
  
  public func save<T: Object>(object: T, completion: @escaping (Result<Void, Error>) -> Void) {
    do {
      try database.write {
        database.add(object)
        completion(.success(()))
      }
    }
    catch {
      completion(.failure(error))
    }
  }
  
  public func update<T: Object>(object: T, completion: @escaping (Result<Void, Error>) -> Void) {
    do {
      try database.write {
        database.add(object, update: .modified)
        completion(.success(()))
      }
    }
    catch {
      completion(.failure(error))
    }
  }
  
  public func delete<T: Object>(object: T, completion: @escaping (Result<Void, Error>) -> Void) {
    do {
      try database.write {
        database.delete(object)
        completion(.success(()))
      }
    }
    catch {
      completion(.failure(error))
    }
  }
  
  public func deleteAll(completion: @escaping (Result<Void, Error>) -> Void) {
    do {
      try database.write {
        database.deleteAll()
        completion(.success(()))
      }
    }
    catch {
      completion(.failure(error))
    }
  }
  
  public func asyncWrite<T: ThreadConfined>(object: T,
                                            completion: @escaping (Result<Void, Error>) -> Void,
                                            action: @escaping ((Realm, T?) -> Void)) {
    let threadSafeRef = ThreadSafeReference(to: object)
    let config = self.database.configuration
    DispatchQueue(label: "background").async {
      autoreleasepool {
        do {
          let realm = try Realm(configuration: config)
          let obj = realm.resolve(threadSafeRef)
          
          try realm.write {
            action(realm, obj)
          }
          
          completion(.success(()))
        }
        catch {
          completion(.failure(error))
        }
      }
    }
  }
}
