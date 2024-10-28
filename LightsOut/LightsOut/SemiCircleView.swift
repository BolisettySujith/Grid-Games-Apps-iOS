import UIKit

class SemiCircleView: UIView {
    
    override func draw(_ rect: CGRect) {
        // Set up the path for the semi-circle
        let path = UIBezierPath()
        
        // Define the center and radius
        let center = CGPoint(x: rect.width / 2, y: rect.height)
        let radius = rect.width / 2
        
        // Move to the starting point (left edge of the semi-circle)
        path.move(to: CGPoint(x: center.x - radius, y: center.y))
        
        // Add arc for the semi-circle pointing downwards
        path.addArc(withCenter: CGPoint(x: center.x, y: center.y), radius: radius, startAngle: 0, endAngle: CGFloat.pi, clockwise: true)
        
        // Close the path to create the shape
        path.close()
        
        // Set the fill color
        UIColor.systemOrange.setFill()
        
        // Fill the semi-circle
        path.fill()
    }
}
