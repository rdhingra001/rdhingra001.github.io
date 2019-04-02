
class GameViewController: UIViewController {

    var gameView: SCNView!
    var gameScene:SCNScene!
    var cameraNode:SCNNode!
    var targetCreationTime:TimeInterval = 0
    
    var gameController: GameController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        initScene()
        initCamera()
        createTarget()
    }
    
    func initView(){
        gameView = self.view as? SCNView
        gameView.allowsCameraControl = true
        gameView.autoenablesDefaultLighting = true
    }
    
    func initScene(){
        gameScene = SCNScene()
        gameView.scene = gameScene
        gameView.isPlaying = true
    }
    
    func initCamera(){
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 5, z: 10)
    }
    
    func createTarget(){
        let geometry:SCNGeometry = SCNPyramid(width: 2, height: 2, length: 2)
        geometry.materials.first?.diffuse.contents = UIColor.green
        let geometryNode = SCNNode(geometry: geometry)
        gameScene.rootNode.addChildNode(geometryNode)
    }
    @objc
    func handleTap(_ gestureRecognizer: UIGestureRecognizer) {
        // Highlight the tapped nodes
        let p = gestureRecognizer.location(in: gameView)
        gameController.highlightNodes(atPoint: p)
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
