import UIKit

extension CGContext {
  public func firstPixelColour() -> UIColor {
    // Assuming 8-bytes per channel. And a specific byte order
    let mask = UInt32(0xff)
    let pixelBytes = UnsafePointer<UInt32>(OpaquePointer(data))
    
    if let pixel = pixelBytes?[0] {
      // Assuming RGBA channel ordering
      let a = Float((pixel & mask)) / 255.0
      let b = Float((pixel >> 8) & mask) / 255.0
      let g = Float((pixel >> 16) & mask) / 255.0
      let r = Float((pixel >> 24) & mask) / 255.0
      
      return UIColor(colorLiteralRed: r, green: g, blue: b, alpha: a)
    } else {
      return UIColor.clear
    }
  }
}
