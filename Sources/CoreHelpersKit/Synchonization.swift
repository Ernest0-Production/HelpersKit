//
//  File.swift
//  
//
//  Created by Ernest Babayan on 02.06.2021.
//

import Foundation


public func synchonized<Target: AnyObject, Result>(
    _ target: Target,
    _ action: () throws -> Result
) rethrows -> Result {
    objc_sync_enter(target); defer { objc_sync_exit(target) }
    return try action()
}
