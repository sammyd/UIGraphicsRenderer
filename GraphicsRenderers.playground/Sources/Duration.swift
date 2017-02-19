import Foundation

public func duration(block: () -> ()) -> TimeInterval {
  let startTime = Date()
  block()
  return Date().timeIntervalSince(startTime)
}
