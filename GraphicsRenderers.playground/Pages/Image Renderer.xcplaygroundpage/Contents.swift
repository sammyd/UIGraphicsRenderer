import UIKit

/*:
 # Image Renderer

 Use an image renderer to easily manage Core Graphics contexts when you want to draw images
 */
let renderer = UIGraphicsImageRenderer(size: CGSize(width: 200, height: 200))
let image = renderer.image { (context) in
  #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1).setStroke()
  context.stroke(context.format.bounds)
  #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1).setFill()
  context.fill(CGRect(x: 20, y: 20, width: 100, height: 100))
  #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).setFill()
  context.fill(CGRect(x: 50, y: 50, width: 120, height: 120), blendMode: .multiply)
  #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).withAlphaComponent(0.6).setFill()
  context.cgContext.fillEllipse(in: CGRect(x: 75, y: -75, width: 200, height: 200))
}
image

//: [PDF Renderer→](@next)
