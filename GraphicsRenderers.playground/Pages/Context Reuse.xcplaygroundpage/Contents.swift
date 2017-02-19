//: [←PDF Renderer](@previous)
import UIKit

/*:
 # Graphics Renderer Context Reuse
 
 Memory efficient reuse of Core Graphics contexts
 */
let renderer = UIGraphicsImageRenderer(size: CGSize(width: 100, height: 100))

duration {
  for i in 1...1000 {
    let image = renderer.image{ (context) in
      let alpha = CGFloat(i) / CGFloat(100)
      #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1).withAlphaComponent(alpha).setFill()
      context.fill(CGRect(x: 20, y: 20, width: 50, height: 50))
    }
  }
}

duration {
  for i in 1...1000 {
    let context = CGContext(data: nil, width: 100, height: 100, bitsPerComponent: 8, bytesPerRow: 0, space: CGColorSpace(name: CGColorSpace.displayP3)!, bitmapInfo: (CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Little.rawValue))
    let alpha = CGFloat(i) / CGFloat(100)
    context?.setFillColor(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1).withAlphaComponent(alpha).cgColor)
    context?.fill(CGRect(x: 20, y: 20, width: 50, height: 50))
    let image = UIImage(cgImage: context!.makeImage()!)
  }
}

//: [Subclassing→](@next)
