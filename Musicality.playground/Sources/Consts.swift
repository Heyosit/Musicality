import SpriteKit

public enum Difficulty: Int {
    case normal = 0, hard = 1
}

enum GestureTypes: Int {
    case tap = 0
    case swipe = 1
    case third = 2
}

enum Scores {
    static let tap = 5
    static let swipe = 8
    static let third = 12
}

enum Z {
    static let background: CGFloat = -1.0
    static let sprites: CGFloat = 10.0
    static let labels: CGFloat = 80.0
    static let HUD: CGFloat = 100.0
    static let buttons: CGFloat = 150.0
    static let buttonLabels: CGFloat = 151.0
}

public enum Instruments: String {
    case violin = "Violin"
    case bass = "Bass"
    case piano = "Piano"
    case drum = "Drum"
    case clarinet = "Clarinet"
    case frenchHorn = "FrenchHorn"
}

enum Positions {
    static let highScoreLabel = CGPoint(x: Consts.Positions.screenWidthMid, y: Consts.Graphics.screenHeight - Consts.Sizes.littleSquareButton.height)
    static let playButton = Consts.Positions.screenMid
    static let gameOverLabel = CGPoint(x: Consts.Positions.screenWidthMid, y: Consts.Positions.screenTopHalfHeight)
    static let scoreLabel = Consts.Positions.screenMid
    static let scoreNode = CGPoint(x: 0 + Consts.Sizes.number.width + Consts.Graphics.spacingWidth, y: Consts.Positions.screenHeightMid)
    static let retryButton = CGPoint(x: Consts.Positions.screenWidthMid, y: 0 + (Consts.Sizes.retryButton.height / 2) + Consts.Graphics.spacingHeight * 1.5)
    static let timerLabel = CGPoint(x: Consts.Positions.screenWidthMid - Consts.Graphics.spacingWidth, y: 0 + Consts.Graphics.spacingHeight)
    static let settingsButton = CGPoint(x: Consts.Positions.screenWidthMid, y: 0 + (Consts.Graphics.spacingHeight) + Consts.Sizes.bigRectangleButton.height / 2)
    static let backButton = CGPoint(x: Consts.Positions.screenTopLeft.x + Consts.Sizes.littleSquareButton.width / 3, y: Consts.Positions.screenTopLeft.y - Consts.Sizes.littleSquareButton.height / 4 )
    static let titleLabel = CGPoint(x: Consts.Positions.screenWidthMid, y: Consts.Graphics.screenHeight - Consts.Graphics.spacingHeight * 2)
    static let subTitleLabel = CGPoint(x: Consts.Positions.screenWidthMid, y: Positions.titleLabel.y - Consts.Graphics.spacingHeight / 1.5)
    static let columsInSettings = [CGPoint(x: Consts.Positions.screenWidthMid - Consts.Sizes.littleSquareButton.width - Consts.Graphics.spacingWidth, y: Consts.Positions.screenHeightMid - Consts.Graphics.spacingHeight / 2),
        CGPoint(x: Consts.Positions.screenWidthMid, y: Consts.Positions.screenHeightMid - Consts.Graphics.spacingHeight / 2),
        CGPoint(x: Consts.Positions.screenWidthMid + Consts.Sizes.littleSquareButton.width +           Consts.Graphics.spacingWidth, y: Consts.Positions.screenHeightMid - Consts.Graphics.spacingHeight / 2)
    ]
    static let notesPosition = [
        CGPoint(x: Consts.Positions.screenWidthMid - Consts.Sizes.littleSquareButton.width - Consts.Graphics.spacingWidth, y: Consts.Graphics.screenHeight - Consts.Graphics.spacingHeight * 3 - Consts.Sizes.littleSquareButton.height),
        CGPoint(x: Consts.Positions.screenWidthMid, y: Consts.Graphics.screenHeight - Consts.Graphics.spacingHeight * 3 - Consts.Sizes.littleSquareButton.height),
        CGPoint(x: Consts.Positions.screenWidthMid + Consts.Sizes.littleSquareButton.width + Consts.Graphics.spacingWidth, y: Consts.Graphics.screenHeight - Consts.Graphics.spacingHeight * 3 - Consts.Sizes.littleSquareButton.height)]
    
    static let firstHapticButtonsInSettings = CGPoint(x: Consts.Graphics.screenWidth / 3, y: Consts.Positions.screenHeightMid - Consts.Sizes.rectangleButton.height - Consts.Graphics.spacingHeight)
    static let testSoundsLabel = CGPoint(x: Consts.Positions.screenWidthMid, y: Consts.Positions.screenTopHalfHeight + Consts.Graphics.spacingHeight)
    
}


struct Consts {
    struct Graphics {
        static let screenBounds = UIScreen.main.nativeBounds
        static let screenWidth = screenBounds.width
        static let screenHeight = screenBounds.height
        static let screenResolution = screenBounds.size
        static let size = screenBounds.size
        static let spacingHeight = screenHeight / 20
        static let spacingWidth = screenWidth / 20
    }
    struct Positions {
        static let screenWidthMid = Graphics.screenBounds.width / 2
        static let screenHeightMid = Graphics.screenBounds.height / 2
        static let screenTopHalfHeight = Graphics.screenBounds.height / 1.50
        static let screenLowHalfHeight = Graphics.screenBounds.height / 4
        static let screenRightHalfWidth = Graphics.screenBounds.width / 1.5
        static let screenLeftHalfWidth = Graphics.screenBounds.width / 4
        static let screenTopHalf = CGPoint(x: screenWidthMid, y: Graphics.screenHeight - Graphics.spacingHeight * 2)
        static let screenTopLeft = CGPoint(x: Graphics.spacingWidth, y: Consts.Graphics.screenHeight - Graphics.spacingHeight)
        static let screenMid = CGPoint(x: screenWidthMid, y: screenHeightMid)
        static let screenLowHalf = CGPoint(x: screenWidthMid, y:screenLowHalfHeight)
        static let hapticButtonSpacingWidth = Consts.Sizes.littleSquareButton.width + Consts.Graphics.spacingWidth
        static let rowGestures = [Consts.Positions.screenHeightMid, Consts.Positions.screenHeightMid - Consts.Sizes.littleSquareButton.height -
            Consts.Graphics.spacingHeight, Consts.Positions.screenHeightMid - (Consts.Sizes.littleSquareButton.height * 2) -
                (Consts.Graphics.spacingHeight * 2), Consts.Positions.screenHeightMid - (Consts.Sizes.littleSquareButton.height * 3) -
                    (Consts.Graphics.spacingHeight * 3) ]
    }
    struct Sizes {
        static let squareButton = CGSize(width: Graphics.screenWidth / 4 , height: Graphics.screenWidth / 4)
        static let rectangleButton = CGSize(width: Graphics.screenWidth / 3.3 , height: Graphics.screenWidth / 6)
        static let littleSquareButton = CGSize(width: Graphics.screenWidth / 6 , height: Graphics.screenWidth / 6)
        static let number = CGSize(width: Graphics.screenWidth / 6, height: Graphics.screenWidth / 3.3)
        static let bigRectangleButton = CGSize(width: Graphics.screenWidth / 1.5, height: Graphics.screenWidth / 6)
        static let retryButton = CGSize(width: Consts.Graphics.screenWidth - (Consts.Graphics.spacingWidth * 2), height: Consts.Positions.screenLowHalfHeight)
        
    }
    struct InitialSettings {
        static let waitBetweenObstacles : TimeInterval = 0.45
        static let score: Int = 0
        static let minTimeToRespond: TimeInterval = 0.9
        static let timeToRespond: [(points: Int, time: TimeInterval)] = [
            (25, 3),
            (50, 2.7),
            (100, 2.5),
            (150, 1.9),
            (200, 1.7),
            (350, 1.5),
            (500, 1.3),
            (750, 1)
        ]
    }
    struct Names {
        struct LabelNames {
            static let score = "ScoreLabel"
            static let gameOver = "GameOverLabel"
            static let retry = "RetryLabel"
            static let timer = "TimerLabel"
            static let highScore = "HighScore"
            static let hardDifficulty = "HardDifficultyLabel"
            static let title = "Title"
            static let subTitle = "Subtitle"
            static let hapticLabelsInSettings = ["FirstHapticLabel", "SecondHapticLabel", "ThirdHapticLabel"]
            static let testSounds = "TestLabel"
            static let play = "PlayLabel"
            static let discover = "DiscoverLabel"
            static let back = "BackLabel"
        }
        struct NodesNames {
            static let hud = "HUDNode"
            static let retry = "RetryButton"
            static let back = "BackButton"
            static let play = "PlayButton"
            static let settings = "SettingsButton"
            static let faster = "Faster"
            static let hapticButtonsInSettings = ["FirstHapticButton", "SecondHapticButton", "ThirdHapticButton"]
            static let gestureImages = ["Tap","Swipe","Third"]
            static let yellowNote = "Yellow Note"
            static let redNote = "Red Note"
            static let blueNote = "Blue Note"
            
        }
        struct ButtonImageNames {
            static let back = "Back Button"
            static let play = "Play Button"
            static let settings = "Settings Button"
            static let retry = "Retry Button"
            static let hapticButtonsInSettings = ["First Haptic Button", "Second Haptic Button", "Third Haptic Button"]
        }
        struct SceneNames {
            static let gameScreen = "GameScreen"
            static let startScreen = "StartScreen"
            static let settingScreen = "SettingScreen"
        }
        struct ButtonStateNames {
            static let normal = " normal"
            static let highlighted = " highlighted"
            static let disabled = " disabled"
        }
    }
    struct Texts {
        static let score = "0"
        static let gameOver = "Game Over"
        static let retry = "Retry"
        static let timer = "3"
        static let highScore = "Highscore: "
        static let testSounds = "LISTEN TO THE SOUNDS FOR EACH GESTURE"
        static let title = "Musicality"
        static let subtitle = "Runner"
        static let hapticGesturesInSettings = ["Tap", "Swipe ←→", "Swipe ↓↑"]
        static let play = "Play game"
        static let discover = "Discover sounds"
        static let back = "Go back"
        static let tap = "tap"
        static let swipeHor = "Swipe Horizontally"
        static let swipeVer = "Swipe Vertically"

    }
    
    static let sounds = [
        Difficulty.normal: ["Upright", "swipe"],
        Difficulty.hard: ["tap", "swipe", "third"]
    ]
    static let maxSameGesture = 4
    
    
}
