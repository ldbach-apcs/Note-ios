//
//  IRepository.swift
//  Remember
//
//  Created by CPU12071 on 8/24/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import Foundation
class IRepository<dataType> {
    func loadAllAsync(delegate: RepositoryDelegate<dataType>) {}
    func loadSingleAsync(delegate: RepositoryDelegate<dataType>, itemId: Int64) {}
    func addAsync(delegate: RepositoryDelegate<dataType>, item: dataType) {}
    func deleteAsync(itemId: Int64?) {}
}

class RepositoryDelegate<T> {
    func onDataLoaded(data: [T]) { }
    func onSingleDataLoaded(data: T) { }
    func onDataError() {}
    func onAddDone(added: Note) {}
}
