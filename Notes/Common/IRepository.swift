//
//  IRepository.swift
//  Remember
//
//  Created by CPU12071 on 8/24/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import Foundation
class IRepository<dataType, idType> {
    func loadAllAsync(delegate: RepositoryDelegate<dataType>) {}
    func addAsync(item: dataType) {}
    func deleteAsync(itemId: idType?) {}
}

class RepositoryDelegate<T> {
    func onDataLoaded(data: [T]) { }
    func onDataError() { }
}
