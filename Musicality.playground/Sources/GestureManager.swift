
import SpriteKit

public protocol GestureDelegate {
    func swipedHorizontal(sender:UISwipeGestureRecognizer)
    func swipedVertical(sender:UISwipeGestureRecognizer)
    
}

public class GestureManager {
    var delegate: GestureDelegate?
    
    func setSwipeGestures(view: SKView) {
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.swipedHorizontal))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.swipedHorizontal))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeUp:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.swipedVertical))
        swipeUp.direction = .up
        view.addGestureRecognizer(swipeUp)
        
        let swipeDown:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.swipedVertical))
        swipeDown.direction = .down
        view.addGestureRecognizer(swipeDown)
    }
    
    @objc func swipedHorizontal(sender:UISwipeGestureRecognizer) {
        delegate?.swipedHorizontal(sender: sender)
    }
    
    @objc func swipedVertical(sender:UISwipeGestureRecognizer) {
        delegate?.swipedVertical(sender: sender)
    }
    
}
