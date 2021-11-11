//
//  Contact.swift
//  Contacts
//
//  Created by Vitalii Kryvoshapka on 10.11.2021.
//

import Foundation

//MARK: -Protocols-

protocol ContactProtocol{
    //Name
    var title: String {get set}
    //Phone Number
    var phone: String {get set}
}

struct Contact: ContactProtocol{
    var title: String
    
    var phone: String
    
}


//UserDefaults protocol
protocol ContactStorageProtocol{
    //Load contact list
    func load() -> [ContactProtocol]
    //Refresh contact list
    func save(contacts: [ContactProtocol])
}

class ContactStorage: ContactStorageProtocol{
    
    //Storage Link
    private var storage = UserDefaults.standard
    //Key for save to storege
    private var storageKey = "contacts"
    
    //Enum with keys to write in UserDefaults
    private enum ContactKey: String{
        case title
        case phone
    }
    func load() -> [ContactProtocol] {
        var resultContacts: [ContactProtocol] = []
        let contactFromStorage = storage.array(forKey: storageKey) as? [[String:String]] ?? []
        for contact in contactFromStorage{
            guard let title = contact[ContactKey.title.rawValue],
                  let phone = contact[ContactKey.phone.rawValue] else {
                      continue
                  }
            resultContacts.append(Contact(title: title, phone: phone))
        }
        return resultContacts
    }
    
    func save(contacts: [ContactProtocol]) {
        var arrayForStorage: [[String:String]] = []
        contacts.forEach{ contact in
            var newelementForStorage: Dictionary<String, String> = [:]
            newelementForStorage[ContactKey.title.rawValue] = contact.title
            newelementForStorage[ContactKey.phone.rawValue] = contact.phone
            arrayForStorage.append(newelementForStorage)
            
        }
        storage.set(arrayForStorage, forKey: storageKey)
    }
}

