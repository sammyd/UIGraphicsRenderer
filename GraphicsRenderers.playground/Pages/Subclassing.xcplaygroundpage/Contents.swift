//: [←Context Reuse](@previous)
import UIKit
import UIKit.UIGraphicsRendererSubclass
/*:
 # Subclassing UIGraphicsRenderer
 
 Create your own subclasses to make full use of the context pooling
 */

class MeanColourExtractor: UIGraphicsRenderer {
  override class func rendererContextClass() -> AnyClass {
    return UIGraphicsRendererContext.classForCoder()
  }
  
  override class func context(with format: UIGraphicsRendererFormat) -> CGContext? {
    let colourSpace = CGColorSpace(name: CGColorSpace.sRGB)!
    return CGContext(data: nil,
                     width: 1,
                     height: 1,
                     bitsPerComponent: 8,
                     bytesPerRow: 32,
                     space: colourSpace,
                     bitmapInfo: (CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Little.rawValue))
  }
  
  override class func prepare(_ context: CGContext, with rendererContext: UIGraphicsRendererContext) {
    context.clear(rendererContext.format.bounds)
  }
  
  func meanColour(image: UIImage) -> UIColor {
    var colour = UIColor.clear
    try! runDrawingActions({ _ in
      image.draw(in: CGRect(x: 0, y: 0, width: 1, height: 1))
    }, completionActions: { (context) in
      colour = context.cgContext.firstPixelColour()
    })
    return colour
  }
}

let image = #imageLiteral(resourceName: "razeware_256.png")
let extractor = MeanColourExtractor(bounds: CGRect(origin: .zero, size: image.size))
let meanColour = extractor.meanColour(image: image)

let image2 = #imageLiteral(resourceName: "sunset.jpg")
extractor.meanColour(image: image2)

