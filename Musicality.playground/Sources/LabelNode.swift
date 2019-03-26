
import SpriteKit

public class SKLabelCustom: SKLabelNode {
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
    func setup(labelData: LabelData) {
        self.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        self.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        self.zPosition = labelData.zPosition
        if let positionNotNil = labelData.position {
            self.position = positionNotNil
        } else {
            self.position = CGPoint.zero
        }
        
        if let fontSizeNotNil = labelData.fontSize {
            self.fontSize = fontSizeNotNil
        }
        if let fontColorNotNil = labelData.fontColor {
            self.fontColor = fontColorNotNil
        }
        
    }
    
    
    
    func setText(text:String) {
        self.text = text
    }
}
