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
