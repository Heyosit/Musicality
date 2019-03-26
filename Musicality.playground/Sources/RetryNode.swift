
import SpriteKit

class RetryNode: SKNode{
    var retryButton : ButtonNode
    var retryLabel = SKLabelCustom(name: Consts.Names.LabelNames.retry)
    
    override init() {
        retryButton = ButtonNode(imageNamed: Consts.Names.ButtonImageNames.retry + Consts.Names.ButtonStateNames.normal, for: .normal)
        super.init()
    }
    
    func setup(){
        let buttonData = ButtonData(texture: Consts.Names.ButtonImageNames.retry, name: Consts.Names.NodesNames.retry, size: Consts.Sizes.retryButton, position: Positions.retryButton, zPosition: Z.buttons)
        retryButton.setup(buttonData: buttonData)
        let labelData = LabelData(name: Consts.Names.LabelNames.retry, text: Consts.Texts.retry, position: nil, zPosition: Z.buttonLabels, fontSize: 120, fontColor: nil)
        retryLabel.setup(labelData: labelData)
        retryLabel.setText(text: Consts.Texts.tap)
        retryLabel.fontName = "Noteworthy-Bold"
        retryLabel.alpha = 0.01
        
        retryButton.addChild(retryLabel)
        retryButton.isUserInteractionEnabled = false
        retryButton.isHidden = true
        addChild(retryButton)
    }
    
    func changeRetryButtonVisibility() {
        if retryLabel.text == Consts.Texts.retry {
            retryLabel.setText(text: Consts.Texts.tap)
        } else {
            retryLabel.setText(text: Consts.Texts.retry)
        }
        retryButton.isUserInteractionEnabled = !retryButton.isUserInteractionEnabled
        retryButton.isHidden = !retryButton.isHidden
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
