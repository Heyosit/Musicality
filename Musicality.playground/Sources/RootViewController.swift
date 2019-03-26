
import SpriteKit

public class RootViewController: UIViewController {
    static let shared = RootViewController()
    var skView: SKView {
        return view as! SKView
    }
    
    public override func viewDidLoad() {
        
        super.viewDidLoad()
        view = SKView()
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        skView.presentScene(StartScreen())
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
