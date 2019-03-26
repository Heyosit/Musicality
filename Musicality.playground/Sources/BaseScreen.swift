import SpriteKit


class BaseScreen: SKScene, ButtonNodeDelegate {
    
    var gameManager = GameManager.shared
    
    override init() {
        super.init(size: Consts.Graphics.size)
        createSceneContents()
    }
    
    func createSceneContents() {
        
        //Background
        let background = SKSpriteNode(color: UIColor.white, size: Consts.Graphics.size)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.size = CGSize(width: self.frame.width, height: self.frame.height)
        background.zPosition = Z.background
        addChild(background)
        
        let buttonData = ButtonData(texture: Consts.Names.ButtonImageNames.back, name: Consts.Names.NodesNames.back, size: Consts.Sizes.littleSquareButton, position: Positions.backButton, zPosition: Z.buttons)
        let backButton = ButtonNode(imageNamed: buttonData.normalTexture, for: .normal)
        backButton.delegate = self
        backButton.setup(buttonData: buttonData)
        let labelData = LabelData(name: Consts.Names.LabelNames.back, text: Consts.Texts.back, position: nil, zPosition: Z.buttonLabels, fontSize: 80, fontColor: nil)
        let backAccessibilityLabel = SKLabelCustom(name: labelData.name)
        backAccessibilityLabel.setup(labelData: labelData)
        backAccessibilityLabel.setText(text: Consts.Texts.back)
//        backAccessibilityLabel.fontName = "Noteworthy-Bold"
        backAccessibilityLabel.alpha = 0.01
//
        backButton.addChild(backAccessibilityLabel)
        self.addChild(backButton)
    }
    
    func buttonNodeTapped(_ sender: ButtonNode) {
        if let name = sender.name {
            switch name {
            case Consts.Names.NodesNames.back:
                gameManager.resetGame()
                let transition:SKTransition = SKTransition.fade(withDuration: 0.5)
                let scene:SKScene = StartScreen()
                self.view?.presentScene(scene, transition: transition)
            default:
                break
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createButton(buttonData: ButtonData) {
        let button = ButtonNode(imageNamed: buttonData.normalTexture, for: .normal)
        button.delegate = self
        button.setup(buttonData: buttonData)
        self.addChild(button)
    }
    
    func createLabel(labelData: LabelData) {
        let label = SKLabelCustom(name: labelData.name)
        label.setup(labelData: labelData)
        self.addChild(label)
    }
    
    func createButtonAndLabel(buttonData: ButtonData, labelData: LabelData) {
        createButton(buttonData: buttonData)
        let label = SKLabelCustom(name: labelData.name)
        label.setup(labelData: labelData)
        guard let button = scene?.childNode(withName: buttonData.name) else {return}
        button.addChild(label)
    }
    
    
    
    
}

