import SpriteKit


class StartScreen: SKScene, ButtonNodeDelegate {
    
    var highScoreLabel = SKLabelCustom(name: Consts.Names.LabelNames.highScore)
    
    override init() {
        super.init(size: Consts.Graphics.screenResolution)
        createSceneContent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createSceneContent() {
        
        
        //Background
        let background = SKSpriteNode(color: UIColor.white, size: Consts.Graphics.size)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.size = CGSize(width: self.frame.width, height: self.frame.height)
        background.zPosition = Z.background
        addChild(background)
        
        //Title
        
        let title = SKLabelNode(text: Consts.Texts.title)
        title.fontSize = 120
        title.position = Positions.titleLabel
        title.fontName = "Noteworthy-Bold"
        title.fontColor = UIColor.orange
        scene?.addChild(title)
        
        
        
        
        //Play
        var buttonData = ButtonData(texture: Consts.Names.ButtonImageNames.play, name: Consts.Names.NodesNames.play, size: Consts.Sizes.squareButton, position: Positions.playButton, zPosition: Z.buttons)
        let playButtonNode = ButtonNode(imageNamed: buttonData.normalTexture, for: .normal)
        playButtonNode.delegate = self
        playButtonNode.setup(buttonData: buttonData)
        var labelData = LabelData(name: Consts.Names.LabelNames.play, text: Consts.Texts.play, position: nil, zPosition: Z.buttonLabels, fontSize: 80, fontColor: nil)
        let playAccessibilityLabel = SKLabelCustom(name: labelData.name)
        playAccessibilityLabel.setup(labelData: labelData)
        playAccessibilityLabel.setText(text: Consts.Texts.play)
        playAccessibilityLabel.fontName = "Noteworthy-Bold"
        playAccessibilityLabel.alpha = 0.01
        
        playButtonNode.addChild(playAccessibilityLabel)
        scene?.addChild(playButtonNode)
        
        //Settings
         buttonData = ButtonData(texture: Consts.Names.ButtonImageNames.settings, name: Consts.Names.NodesNames.settings, size: Consts.Sizes.bigRectangleButton, position: Positions.settingsButton, zPosition: Z.buttons)
        let settingsButtonNode = ButtonNode(imageNamed: buttonData.normalTexture, for: .normal)
        settingsButtonNode.delegate = self
        settingsButtonNode.setup(buttonData: buttonData)
        labelData = LabelData(name: Consts.Names.LabelNames.discover, text: Consts.Texts.discover, position: nil, zPosition: Z.buttonLabels, fontSize: 120, fontColor: nil)
        let discoverAccessibilityLabel = SKLabelCustom(name: labelData.name)
        discoverAccessibilityLabel.setup(labelData: labelData)
        discoverAccessibilityLabel.setText(text: Consts.Texts.discover)
//        discoverAccessibilityLabel.fontName = "Noteworthy-Bold"
        discoverAccessibilityLabel.alpha = 0.01

        settingsButtonNode.addChild(discoverAccessibilityLabel)
        scene?.addChild(settingsButtonNode)
    
        createNote(name: Consts.Names.NodesNames.redNote, index: 0)
        createNote(name: Consts.Names.NodesNames.yellowNote, index: 1)
        createNote(name: Consts.Names.NodesNames.blueNote, index: 2)


        
        
    }
    
    func createNote(name: String, index: Int) {
        let note = SKSpriteNode(imageNamed: name)
        note.position = Positions.notesPosition[index]
        note.size = Consts.Sizes.littleSquareButton
        note.zPosition = Z.sprites
        
        let goDown = SKAction.moveBy(x: 0, y: 75, duration: 0.7)
        
        let goUp = SKAction.moveBy(x: 0, y: -75, duration: 0.7)
        
        var seq = SKAction.sequence([goDown,goUp])
        
        if index % 2 == 1 {
            note.position.y = note.position.y + 75
            seq = SKAction.sequence([goUp,goDown])
        }
        
        
        let infiniteSeq = SKAction.repeatForever(seq)
        note.run(infiniteSeq)
        
        addChild(note)
    }
    
    func buttonNodeTapped(_ sender: ButtonNode) {
        let transition:SKTransition = SKTransition.fade(withDuration: 1)
        
        if let name = sender.name {
            switch name {
            case Consts.Names.NodesNames.play:
                if GameManager.shared.isCompletitionComplete {
                    let scene:SKScene = GameScreen()
                    self.view?.presentScene(scene, transition: transition)
                }
            case Consts.Names.NodesNames.settings:
                let scene:SKScene = SettingsScreen()
                self.view?.presentScene(scene, transition: transition)
            default:
                break
            }
        }
    }
}

