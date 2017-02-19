//: [←Image Renderer](@previous)
import UIKit
import PlaygroundSupport
/*:
 # PDF Renderer
 
 Easily create PDFs
 */
let renderer = UIGraphicsPDFRenderer(bounds: CGRect(x: 0, y: 0, width: 500, height: 200))
let url = playgroundSharedDataDirectory.appendingPathComponent("output.pdf")
try! renderer.writePDF(to: url) { (context) in
  let pageNumberAttributes = [
    NSFontAttributeName : UIFont.systemFont(ofSize: 145, weight: 600)
  ]
  
  let link = "Next Page →" as NSString
  let linkRect = CGRect(x: 320, y: 160, width: 150, height: 40)
  let linkAttrib : [String : Any] = [
    NSFontAttributeName : UIFont.italicSystemFont(ofSize: 25),
    NSBackgroundColorAttributeName : #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1),
    NSForegroundColorAttributeName : #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
  ]
  
  for page in 1...5 {
    context.beginPage()
    let pageNumber = "Page \(page)" as NSString
    pageNumber.draw(in: CGRect(x: 0, y: 0, width: 500, height: 200), withAttributes: pageNumberAttributes)
    
    link.draw(in: linkRect, withAttributes: linkAttrib)
    
    context.addDestination(withName: "page-\(page)", at: CGPoint.zero.applying(context.cgContext.userSpaceToDeviceSpaceTransform))
    context.setDestinationWithName("page-\(page + 1)", for: linkRect.applying(context.cgContext.userSpaceToDeviceSpaceTransform))
  }

}
//: [Context Reuse→](@next)
