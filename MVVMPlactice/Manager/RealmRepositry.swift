//
//  RealmRepositry.swift
//  MVVMPlactice
//
//  Created by Jae hyung Kim on 2/26/24.
//

import Foundation
import RealmSwift

class Folder: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var folderName: String
    @Persisted var regData: Date
    @Persisted var list: List<Memo>
    
    convenience
    init(folderName: String, regData: Date) {
        self.init()
        
        self.folderName = folderName
        self.regData = regData
    }
    
}

class Memo: Object {
    // ID
    @Persisted(primaryKey: true) var id : ObjectId
    // title
    @Persisted var title: String
    @Persisted var location: Location
    
    @Persisted(originProperty: "Folder") var parents: LinkingObjects<Folder>
    
    convenience
    init(title: String, location: Location) {
        self.init()
        self.title = title
        self.location = location
    }
    
}

class Location: EmbeddedObject {
    @Persisted var lat: String
    @Persisted var lon: String
    
    init(lat: String, lon: String) {
        self.lat = lat
        self.lon = lon
    }
}

class RealmRepository {
    let realm = try! Realm()
    let folderModel = Folder.self
    let memoModel = Memo.self
    let locationModel = Location.self
    
    func printURL(){
        print(realm.configuration.fileURL ?? "Error")
    }
    
    func makeFolder(folderName: String){
        do{
            try realm.write {
                realm.add(Folder(folderName: folderName, regData: Date()))
            }
        }catch{
            print(error)
        }
    }
    
}
