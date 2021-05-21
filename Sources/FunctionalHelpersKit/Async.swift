//
//  File.swift
//  
//
//  Created by Ernest Babayan on 21.05.2021.
//

import Foundation

/// ~~~
/// loader.load(onMainThread { response in
///     label.text = response.data.toString()
///})
/// ~~~
public func onMainThread<Input, Output>(_ handler: @escaping (Input) -> Output) -> (Input) -> Output {
    return { input in
        performOnMainThread(execute(handler, with: input))
    }
}

/// ~~~
/// loader.load(onMainThread { response in
///     label.text = response.data.toString()
///})
/// ~~~
public func onMainThread(_ handler: @escaping () -> Void) -> () -> Void {
    execute(performOnMainThread, with: handler)
}

private func performOnMainThread<R>(_ block: () -> R) -> R {
    if Thread.isMainThread { return block() }
    else { return DispatchQueue.main.sync(execute: block) }
}

public func sync<Output>(
    on queue: DispatchQueue,
    flags: DispatchWorkItemFlags = [],
    _ handler: @escaping () -> Output
) -> () -> Output {
    return { queue.sync(flags: flags, execute: handler) }
}

public func sync<Input, Output>(
    on queue: DispatchQueue,
    flags: DispatchWorkItemFlags = [],
    _ handler: @escaping (Input) -> Output
) -> (Input) -> Output {
    return { input in
        queue.sync(flags: flags, execute: execute(handler, with: input))
    }
}

public func async(
    on queue: DispatchQueue,
    flags: DispatchWorkItemFlags = [],
    _ handler: @escaping VoidClosure
) -> VoidClosure {
    return { queue.async(flags: flags, execute: handler) }
}

public func async<Input>(
    on queue: DispatchQueue,
    flags: DispatchWorkItemFlags = [],
    _ handler: @escaping (Input) -> Void
) -> (Input) -> Void {
    return { input in
        queue.async(flags: flags, execute: { handler(input) })
    }
}
