
import SpriteKit

protocol ButtonNodeDelegate: class {
    func buttonNodeTapped(_ sender: ButtonNode)
}

enum ButtonState {
    case normal, highlighted, disabled
}

public class ButtonNode: SKSpriteNode {
    weak var delegate: ButtonNodeDelegate?
    var isWithHaptic = true
    var normalImageName: String!
    var highlightedImageName: String!
    var disabledImageName: String!
    var state = ButtonState.normal {
        willSet {
            switch newValue {
            case .normal:
                let texture = SKTexture(imageNamed: normalImageName)
                self.texture = texture
            case .highlighted:
                let texture = SKTexture(imageNamed: highlightedImageName)
                self.texture = texture
            case .disabled:
                let texture = SKTexture(imageNamed: disabledImageName)
                self.texture = texture
            }
        }
    }
    
    convenience init(imageNamed: String, for _: ButtonState) {
        let texture = SKTexture(imageNamed: imageNamed)
        self.init(texture: texture)
        self.normalImageName = imageNamed
        self.highlightedImageName = imageNamed
        self.disabledImageName = imageNamed + Consts.Names.ButtonStateNames.disabled
        self.isUserInteractionEnabled = true
    }
    
    func setup(buttonData: ButtonData) {
        highlightedImageName = buttonData.highlightedTexture
        disabledImageName = buttonData.disabledTexture
        self.name = buttonData.name
        self.size = buttonData.size
        self.position = buttonData.position
        self.zPosition = buttonData.zPosition
    }
    
    func buttonIsDisabled() {
        state = .disabled
    }
    
    func buttonIsEnabled() {
        debugPrint("button is enabled")
        state = .normal
    }
    
    func changeButtonDisabledState() {
        state = state == .normal ? .disabled : .normal
    }
    
    func setTexture(imageNamed: String, for _: ButtonState) {
        highlightedImageName = imageNamed
        
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if state == .disabled {return}
        state = .highlighted
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if state == .disabled {return}
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            let locationInParent = self.convert(touchLocation, to: self.parent!)
            let isTouchInside = self.contains(locationInParent)
            if isTouchInside {
                state = .highlighted
            } else {
                state = .normal
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if state == .disabled {return}
        guard state == .highlighted else { return }
        state = .normal
        let generator = UIImpactFeedbackGenerator(style: .light)
        if isWithHaptic {
            generator.prepare()
            generator.impactOccurred()
        }
        delegate?.buttonNodeTapped(self)
        
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if state == .disabled {return}
        state = .normal
    }
}
