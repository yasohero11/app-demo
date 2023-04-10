//
//  Observer.swift
//  gameMasterApi
//
//  Created by youssef osama on 28/12/1401 AP.
//

import Foundation



class Observable<T> {

    var value: T {
        didSet {
            listener?(value)
        }
    }

    private var listener: ((T) -> Void)?

    init(_ value: T) {
        self.value = value
    }

    func bind(_ closure: @escaping (T) -> Void) {
   
        listener = closure
    }
}
