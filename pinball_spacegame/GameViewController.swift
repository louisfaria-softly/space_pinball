//
//  GameViewController.swift
//
//
//  Created by Louis Faria-Softly on 10/01/19.
//  Copyright © 2019 UI UX Design. All rights reserved.
//

import UIKit
import SceneKit

/// define the collision type bit mask
enum ColliderType: Int {
    case ball     = 0b0001
    case barrier  = 0b0010
    case brick    = 0b0100
    case paddle   = 0b1000
}

class GameViewController: UIViewController {
    
    
    @IBOutlet var PopOver: UIView!
    @IBOutlet var EndGame: UIView!
    @IBOutlet var WinScreen: UIView!
    @IBOutlet var WinScreen2: UIView!
    @IBOutlet var WinScreen3: UIView!
    @IBOutlet var WinScreen4: UIView!
    @IBOutlet var WinScreen5: UIView!
    @IBOutlet var WinScreen6: UIView!
    @IBOutlet var WinScreen7: UIView!
    @IBOutlet var WinScreen8: UIView!
    @IBOutlet var WinScreen9: UIView!
    @IBOutlet var WinScreen10: UIView!
    
    
    
    
    
    var scnView: SCNView!
    
    var scnScene: SCNScene!
    /// 2 cameras
    var horizontalCameraNode: SCNNode!
    var verticalCameraNode: SCNNode!
    /// 1 ball
    var ballNode: SCNNode!
    
    var level1Node: SCNNode!
    var level3Node: SCNNode!
    var level4Node: SCNNode!
    var level5Node: SCNNode!
    var level6Node: SCNNode!
    var level7Node: SCNNode!
    var level8Node: SCNNode!
    var level9Node: SCNNode!
    var level10Node: SCNNode!
    
    
    
    
    var level2Node: SCNNode!
      var level2ballNode: SCNNode!
    var level3ballNode: SCNNode!
    
    
    var Molecule1Node: SCNNode!
    var Molecule2Node: SCNNode!
    var Molecule3Node: SCNNode!
    var Molecule4Node: SCNNode!
    var Molecule5Node: SCNNode!
    var Molecule6Node: SCNNode!
    var Molecule7Node: SCNNode!
    
    var Molecule1aNode: SCNNode!
    var Molecule1bNode: SCNNode!
    var Molecule1cNode: SCNNode!
    var Molecule1dNode: SCNNode!
    var Molecule1eNode: SCNNode!
    
    var Molecule2aNode: SCNNode!
    var Molecule2bNode: SCNNode!
    var Molecule2cNode: SCNNode!
    var Molecule2dNode: SCNNode!
    var Molecule2eNode: SCNNode!
  
    

    
    /// 1 paddle
    var paddleNode: SCNNode!
    /// 1 floor
    var floorNode: SCNNode!
    /// keep track of the last node with which the ball made contact
    var lastContactNode: SCNNode!
    /// store the touch’s initial x-position and the paddle’s x- position
    var touchX: CGFloat = 0
    var paddleX: Float = 0
    /// singleton game
    var game = GameHelper.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        
        setupScene()
       setupNodes()
        setupSounds()
        

        
        
        level1Node.isHidden = false
        
        
       
        Molecule1bNode.isHidden = true
        Molecule1cNode.isHidden = true
        Molecule1dNode.isHidden = true
        Molecule1eNode.isHidden = true
        Molecule2aNode.isHidden = true
        Molecule2bNode.isHidden = true
        Molecule2cNode.isHidden = true
        Molecule2dNode.isHidden = true
        Molecule2eNode.isHidden = true
       
        
        
        scnView.scene?.isPaused = true
        
        self.view.addSubview(PopOver)
        PopOver.center = self.view.center
//        PopOver.centre = self.view.center
    
    
    }
    
    @IBAction func PopHidden(_ sender: Any) {
        
     
        
        
        scnView.scene?.isPaused = false
        game.reset()
        
        game.saveState()
        
        level1Node.isHidden = false
        level2Node.isHidden = true
        level3Node.isHidden = true
        level4Node.isHidden = true
        level5Node.isHidden = true
        level6Node.isHidden = true
        level7Node.isHidden = true
        level8Node.isHidden = true
        level9Node.isHidden = true
        level10Node.isHidden = true


         Molecule1aNode.isHidden = false
        Molecule1bNode.isHidden = true
        Molecule1cNode.isHidden = true
        Molecule1dNode.isHidden = true
        Molecule1eNode.isHidden = true
        Molecule2aNode.isHidden = true
        Molecule2bNode.isHidden = true
        Molecule2cNode.isHidden = true
        Molecule2dNode.isHidden = true
        Molecule2eNode.isHidden = true
        
        self.PopOver.removeFromSuperview()
        self.WinScreen10.removeFromSuperview()
        self.EndGame.removeFromSuperview()
        self.WinScreen2.removeFromSuperview()
        

    }
    
    
   
    
    
    
    
  
   
    @IBAction func NextLevel(_ sender: Any) {  //next level to level 2
        
        //
        //        if (level2Node.isHidden == true) || (level1Node.isHidden == false)
        
        
        setupScene()
        setupNodes()
        setupSounds()
        game.reset()
        
        level1Node.isHidden = true
        
        level3Node.isHidden = true
        level4Node.isHidden = true
        level5Node.isHidden = true
        level6Node.isHidden = true
        level7Node.isHidden = true
        level8Node.isHidden = true
        level9Node.isHidden = true
        level10Node.isHidden = true
        
        
          Molecule1aNode.isHidden = true
        Molecule1bNode.isHidden = false
        Molecule1cNode.isHidden = true
        Molecule1dNode.isHidden = true
        Molecule1eNode.isHidden = true
        Molecule2aNode.isHidden = true
        Molecule2bNode.isHidden = true
        Molecule2cNode.isHidden = true
        Molecule2dNode.isHidden = true
        Molecule2eNode.isHidden = true
        
        scnView.scene?.isPaused = false
        
      
        
        //
        //        game.saveState()
        
        self.WinScreen.removeFromSuperview()
         self.WinScreen2.removeFromSuperview()
          level2Node.isHidden = false
    }
    
    
    
    
    
    
    
    
    @IBAction func NextLevel2(_ sender: Any) { // next level fom level 2
        
        self.WinScreen2.removeFromSuperview()
        self.WinScreen3.removeFromSuperview()
       
      
//        if (level2Node.isHidden == false) || (level1Node.isHidden == false){
        
        
        
        
        setupScene()
        setupNodes()
        setupSounds()
        game.reset()
        
        game.saveState()
        
        
        
        
        level1Node.isHidden = true
        level2Node.isHidden = true
        level3Node.isHidden = false
        level4Node.isHidden = true
        level5Node.isHidden = true
        level6Node.isHidden = true
        level7Node.isHidden = true
        level8Node.isHidden = true
        level9Node.isHidden = true
        level10Node.isHidden = true

        
        
        Molecule1aNode.isHidden = true
        Molecule1bNode.isHidden = true
        Molecule1cNode.isHidden = false
        Molecule1dNode.isHidden = true
        Molecule1eNode.isHidden = true
        Molecule2aNode.isHidden = true
        Molecule2bNode.isHidden = true
        Molecule2cNode.isHidden = true
        Molecule2dNode.isHidden = true
        Molecule2eNode.isHidden = true
        
        
        
        
        
        
    }
    
    @IBAction func NextLevel3(_ sender: Any) {
        setupScene()
        setupNodes()
        setupSounds()
        game.reset()
        
        game.saveState()
        
//        level2Node.isHidden = true
        
        
        
     
        level1Node.isHidden = true
        level2Node.isHidden = true
        level3Node.isHidden = true
        level4Node.isHidden = false
        level5Node.isHidden = true
        level6Node.isHidden = true
        level7Node.isHidden = true
        level8Node.isHidden = true
        level9Node.isHidden = true
        level10Node.isHidden = true

        Molecule1aNode.isHidden = true
        Molecule1bNode.isHidden = true
        Molecule1cNode.isHidden = true
        Molecule1dNode.isHidden = false
        Molecule1eNode.isHidden = true
        Molecule2aNode.isHidden = true
        Molecule2bNode.isHidden = true
        Molecule2cNode.isHidden = true
        Molecule2dNode.isHidden = true
        Molecule2eNode.isHidden = true
        

        
        
        
        
        
        
        self.WinScreen3.removeFromSuperview()
        self.WinScreen4.removeFromSuperview()
        }
    
    
    
    @IBAction func NextLevel4(_ sender: Any) {
        setupScene()
        setupNodes()
        setupSounds()
        game.reset()
        
        game.saveState()
        
        //        level2Node.isHidden = true
        
        
        

        level1Node.isHidden = true
        level2Node.isHidden = true
        level3Node.isHidden = true
        level4Node.isHidden = true
        level5Node.isHidden = false
        level6Node.isHidden = true
        level7Node.isHidden = true
        level8Node.isHidden = true
        level9Node.isHidden = true
        level10Node.isHidden = true
        
        Molecule1aNode.isHidden = true
        Molecule1bNode.isHidden = true
        Molecule1cNode.isHidden = true
        Molecule1dNode.isHidden = true
        Molecule1eNode.isHidden = false
        Molecule2aNode.isHidden = true
        Molecule2bNode.isHidden = true
        Molecule2cNode.isHidden = true
        Molecule2dNode.isHidden = true
        Molecule2eNode.isHidden = true
        
      
        
        self.WinScreen4.removeFromSuperview()
        self.WinScreen5.removeFromSuperview()
}
    
    
    @IBAction func NextLevel5(_ sender: Any) {
        
        setupScene()
        setupNodes()
        setupSounds()
        game.reset()
        
        game.saveState()
        
        //        level2Node.isHidden = true
        
        
        level1Node.isHidden = true
        level2Node.isHidden = true
        level3Node.isHidden = true
        level4Node.isHidden = true
        level5Node.isHidden = true
        level6Node.isHidden = false
        level7Node.isHidden = true
        level8Node.isHidden = true
        level9Node.isHidden = true
        level10Node.isHidden = true
        
        
        Molecule1aNode.isHidden = true
        Molecule1bNode.isHidden = true
        Molecule1cNode.isHidden = true
        Molecule1dNode.isHidden = true
        Molecule1eNode.isHidden = true
        Molecule2aNode.isHidden = false
        Molecule2bNode.isHidden = true
        Molecule2cNode.isHidden = true
        Molecule2dNode.isHidden = true
        Molecule2eNode.isHidden = true
        
        
        self.WinScreen5.removeFromSuperview()
        self.WinScreen6.removeFromSuperview()
        
        
    }
    
  
    @IBAction func NextLevel6(_ sender: Any) {
        setupScene()
        setupNodes()
        setupSounds()
        game.reset()
        
        game.saveState()
        
        //        level2Node.isHidden = true
        
        
        
        level1Node.isHidden = true
        level2Node.isHidden = true
        level3Node.isHidden = true
        level4Node.isHidden = true
        level5Node.isHidden = true
        level6Node.isHidden = true
        level7Node.isHidden = false
        level8Node.isHidden = true
        level9Node.isHidden = true
        level10Node.isHidden = true
        
        
        Molecule1aNode.isHidden = true
        Molecule1bNode.isHidden = true
        Molecule1cNode.isHidden = true
        Molecule1dNode.isHidden = true
        Molecule1eNode.isHidden = true
        Molecule2aNode.isHidden = true
        Molecule2bNode.isHidden = false
        Molecule2cNode.isHidden = true
        Molecule2dNode.isHidden = true
        Molecule2eNode.isHidden = true
        
        
        self.WinScreen6.removeFromSuperview()
        self.WinScreen7.removeFromSuperview()
        
        
        
        
    }
    
    
    @IBAction func NextLevel7(_ sender: Any) {
        
        setupScene()
        setupNodes()
        setupSounds()
        game.reset()
        
        game.saveState()
      
        
        
        level1Node.isHidden = true
        level2Node.isHidden = true
        level3Node.isHidden = true
        level4Node.isHidden = true
        level5Node.isHidden = true
        level6Node.isHidden = true
        level7Node.isHidden = true
        level8Node.isHidden = false
        level9Node.isHidden = true
        level10Node.isHidden = true
        
        
        Molecule1aNode.isHidden = true
        Molecule1bNode.isHidden = true
        Molecule1cNode.isHidden = true
        Molecule1dNode.isHidden = true
        Molecule1eNode.isHidden = true
        Molecule2aNode.isHidden = true
        Molecule2bNode.isHidden = true
        Molecule2cNode.isHidden = false
        Molecule2dNode.isHidden = true
        Molecule2eNode.isHidden = true
        
         self.WinScreen7.removeFromSuperview()
        self.WinScreen8.removeFromSuperview()
    }
    
    
    
    
    @IBAction func NextLevel8(_ sender: Any) {
        
        
       
        setupScene()
        setupNodes()
        setupSounds()
        game.reset()
        
        game.saveState()
        
        level1Node.isHidden = true
        level2Node.isHidden = true
        level3Node.isHidden = true
        level4Node.isHidden = true
        level5Node.isHidden = true
        level6Node.isHidden = true
        level7Node.isHidden = true
        level8Node.isHidden = true
        level9Node.isHidden = false
        level10Node.isHidden = true
        
        
        
        
        
        Molecule1aNode.isHidden = true
        Molecule1bNode.isHidden = true
        Molecule1cNode.isHidden = true
        Molecule1dNode.isHidden = true
        Molecule1eNode.isHidden = true
        Molecule2aNode.isHidden = true
        Molecule2bNode.isHidden = true
        Molecule2cNode.isHidden = true
        Molecule2dNode.isHidden = false
        Molecule2eNode.isHidden = true
        
         self.WinScreen8.removeFromSuperview()
        self.WinScreen9.removeFromSuperview()
    }
    
    
    
    @IBAction func NextLevel9(_ sender: Any) {
        
        
        setupScene()
        setupNodes()
        setupSounds()
        game.reset()
        
        game.saveState()
        
        
        level1Node.isHidden = true
        level2Node.isHidden = true
        level3Node.isHidden = true
        level4Node.isHidden = true
        level5Node.isHidden = true
        level6Node.isHidden = true
        level7Node.isHidden = true
        level8Node.isHidden = true
        level9Node.isHidden = true
        level10Node.isHidden = false
        
        
        
        
        
        Molecule1aNode.isHidden = true
        Molecule1bNode.isHidden = true
        Molecule1cNode.isHidden = true
        Molecule1dNode.isHidden = true
        Molecule1eNode.isHidden = true
        Molecule2aNode.isHidden = true
        Molecule2bNode.isHidden = true
        Molecule2cNode.isHidden = true
        Molecule2dNode.isHidden = true
        Molecule2eNode.isHidden = false
        
        
         self.WinScreen9.removeFromSuperview()
        
        
    }
    
    
    
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func Restart3(_ sender: Any) {
        //End of level 2 replay level 1
        
        
         self.WinScreen2.removeFromSuperview()
        
        setupNodes()
        setupSounds()
        game.reset()
        
        game.saveState()
        
        level2Node.isHidden = true
        
        level2ballNode.isHidden = true
        
        
        
        
    }
  
    

    
//
//
//    @IBAction func NextLevel(_ sender: Any) {  //next level to level 2
//
//        //
//        //        if (level2Node.isHidden == true) || (level1Node.isHidden == false)
//
//
//        setupScene()
//        setupNodes()
//        setupSounds()
//        game.reset()
//
//        level2Node.isHidden = false
//
//
//
//        Molecule1Node.isHidden = true
//
//        Molecule2Node.isHidden = false
//
//        Molecule3Node.isHidden = true
//
//        scnView.scene?.isPaused = false
//
//        level3Node.isHidden = true
//        level4Node.isHidden = true
//
//        level1Node.isHidden = true
//
//        //
//        //        game.saveState()
//
//        self.WinScreen.removeFromSuperview()
//
//    }
//
//
    
    
    /// casting self.view as a SCNView and storing it for convenient access
    
    
    
   
    func setupScene() {
        scnView = (self.view as! SCNView)
        scnView.delegate = self
        /// hide the panel
        scnView.showsStatistics = false
        
        scnScene = SCNScene(named: "Breaker.scnassets/Scenes/Game.scn")
        scnView.scene = scnScene
        scnScene.physicsWorld.contactDelegate = self
    }
    
    func setupNodes() {
        scnScene.rootNode.addChildNode(game.hudNode)
        horizontalCameraNode = scnScene.rootNode.childNode(withName: "HorizontalCamera", recursively: true)!
        verticalCameraNode = scnScene.rootNode.childNode(withName: "VerticalCamera", recursively: true)!
        ballNode = scnScene.rootNode.childNode(withName: "Ball", recursively: true)!
        paddleNode = scnScene.rootNode.childNode(withName: "Paddle", recursively: true)!
        floorNode = scnScene.rootNode.childNode(withName: "Floor", recursively: true)!
          level2ballNode = scnScene.rootNode.childNode(withName: "Level2", recursively: true)!
        level3ballNode = scnScene.rootNode.childNode(withName: "Level3", recursively: true)!
        
      
        
        Molecule1aNode = scnScene.rootNode.childNode(withName: "Molecule1.a", recursively: true)!
        Molecule1bNode = scnScene.rootNode.childNode(withName: "Molecule1.b", recursively: true)!
        Molecule1cNode = scnScene.rootNode.childNode(withName: "Molecule1.c", recursively: true)!
        Molecule1dNode = scnScene.rootNode.childNode(withName: "Molecule1.d", recursively: true)!
        Molecule1eNode = scnScene.rootNode.childNode(withName: "Molecule1.e", recursively: true)!
        
        Molecule2aNode = scnScene.rootNode.childNode(withName: "Molecule2.a", recursively: true)!
        Molecule2bNode = scnScene.rootNode.childNode(withName: "Molecule2.b", recursively: true)!
        Molecule2cNode = scnScene.rootNode.childNode(withName: "Molecule2.c", recursively: true)!
        Molecule2dNode = scnScene.rootNode.childNode(withName: "Molecule2.d", recursively: true)!
        Molecule2eNode = scnScene.rootNode.childNode(withName: "Molecule2.e", recursively: true)!
        
        
        

        
        
        
        
        level1Node = scnScene.rootNode.childNode(withName: "box0", recursively: true)!
        level2Node = scnScene.rootNode.childNode(withName: "box1", recursively: true)!
        level3Node = scnScene.rootNode.childNode(withName: "box2", recursively: true)!
        level4Node = scnScene.rootNode.childNode(withName: "box3", recursively: true)!
        level5Node = scnScene.rootNode.childNode(withName: "box4", recursively: true)!
        level6Node = scnScene.rootNode.childNode(withName: "box5", recursively: true)!
        level7Node = scnScene.rootNode.childNode(withName: "box6", recursively: true)!
        level8Node = scnScene.rootNode.childNode(withName: "box7", recursively: true)!
        level9Node = scnScene.rootNode.childNode(withName: "box8", recursively: true)!
        level10Node = scnScene.rootNode.childNode(withName: "box9", recursively: true)!
        
        /// adds a SCNLookAtConstraint to both cameras in the scene, which will force the camera to point towards the targeted node
        verticalCameraNode.constraints = [SCNLookAtConstraint(target: floorNode)]
        horizontalCameraNode.constraints = [SCNLookAtConstraint(target: floorNode)]
        /// you need to set the contactTestBitMask of a physics body to tell the physics engine that you’re interested in notification when collisions happen
        /// you let the physics engine know that you want to call the protocol method whenever the ball collides with nodes that have a category bit mask of either 2, 4, or 8 — respectively, these represent a barrier, brick or paddle
        ballNode.physicsBody?.contactTestBitMask =
            ColliderType.barrier.rawValue |
            ColliderType.brick.rawValue |
            ColliderType.paddle.rawValue
    }
    
    func setupSounds() {
        game.loadSound(name: "Paddle", fileNamed: "Breaker.scnassets/Sounds/Paddle.wav")
        game.loadSound(name: "Block0", fileNamed: "Breaker.scnassets/Sounds/Block0.wav")
        game.loadSound(name: "Bricks", fileNamed: "Breaker.scnassets/Sounds/Block1.wav")
        game.loadSound(name: "Block2", fileNamed: "Breaker.scnassets/Sounds/Block2.wav")
        game.loadSound(name: "Barrier", fileNamed: "Breaker.scnassets/Sounds/Barrier.wav")
           game.loadSound(name: "Bottom", fileNamed: "Breaker.scnassets/Sounds/GameOver.wav")
     
    }
    
    override var shouldAutorotate: Bool { return true }
    
    override var prefersStatusBarHidden: Bool { return true }
    
    /// inspect the device’s orientation to determine the new orientation
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        let deviceOrientation = UIDevice.current.orientation
        switch(deviceOrientation) {
        case .portrait:
            scnView.pointOfView = verticalCameraNode
        default:
            scnView.pointOfView = horizontalCameraNode
        }
    }
    
    /// As soon as a touch starts, this code simply stores the touch and paddle’s x-position
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: scnView)
            touchX = location.x
            paddleX = paddleNode.position.x
        }
    }
    
    /// detect when the user moves their finger around the screen
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            /// this updates the paddle’s position relative to the initial touch location stored in touchX
            let location = touch.location(in: scnView)
            paddleNode.position.x = paddleX + (Float(location.x - touchX) * 0.1)
            /// limits the paddle’s movement and confines it between the barrier’s limits
            if paddleNode.position.x > 4.5 {
                paddleNode.position.x = 4.5
            } else if paddleNode.position.x < -4.5 {
                paddleNode.position.x = -4.5
            }
        }
        /// updates both cameras’ x-position to be the same as the paddle
        verticalCameraNode.position.x = paddleNode.position.x
        horizontalCameraNode.position.x = paddleNode.position.x
    }
}

/// conforms to the SCNSceneRendererDelegate protocol, and there’s a stub for renderer(_: updateAtTime:) that’s called once for every frame update
extension GameViewController: SCNSceneRendererDelegate {
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        game.updateHUD()
    }
}

extension GameViewController: SCNPhysicsContactDelegate {
    /// it’s called when two physics bodies you’re interested in start making contact with each other
    func physicsWorld(_ world: SCNPhysicsWorld, didBegin contact: SCNPhysicsContact) {
        /// figure out which two nodes collide
        var contactNode: SCNNode!
        if contact.nodeA.name == "Ball" {
            contactNode = contact.nodeB
        } else {
            contactNode = contact.nodeA
        }
        /// prevent the ball from making contact with the same node more than once per interaction by using lastContactNode
        if lastContactNode != nil && lastContactNode == contactNode {
            return
        }
        lastContactNode = contactNode
        
        /// This section checks whether the ball is making contact with a barrier by looking at the categoryBitMask of contactNode
        if contactNode.physicsBody?.categoryBitMask == ColliderType.barrier.rawValue {
            game.playSound(node: contactNode, name: "Barrier")
           
        }
        
        if contactNode.name == "Bottom" {
            game.lives -= 1
            if game.lives == 0 {
                //                    game.saveState()
                //                    game.reset()
               DispatchQueue.main.async{
                self.view.addSubview(self.EndGame)
                self.EndGame.center = self.view.center}
                scnView.scene?.isPaused = true
            }
        }
        
        
        if (level1Node.isHidden == false)  {
            
            if game.score == 1{
                DispatchQueue.main.async{
                self.view.addSubview(self.WinScreen)
                self.WinScreen.center = self.view.center
                }
                scnView.scene?.isPaused = true
            }
            
        }
        
        if (level2Node.isHidden == false)  {
            
            if  (game.score == 3){
                
                DispatchQueue.main.async{
                self.view.addSubview(self.WinScreen2)
                    self.WinScreen2.center = self.view.center}
                scnView.scene?.isPaused = true
            }
            
        }
        
        //            if (level1Node.isHidden == false)  {
        //
        //                if game.score == 1{
        //                self.view.addSubview(WinScreen)
        //                WinScreen.center = self.view.center
        //                scnView.scene?.isPaused = true
        //                }
        //
        //            }
        
        if (level3Node.isHidden == false) {
            
            if game.score == 4{
                DispatchQueue.main.async{
                    self.view.addSubview(self.WinScreen3)
                    self.WinScreen3.center = self.view.center}
                scnView.scene?.isPaused = true
            }
            
        }
        
        if (level4Node.isHidden == false) {
            
            if game.score == 6{
                DispatchQueue.main.async{
                self.view.addSubview(self.WinScreen4)
                    self.WinScreen4.center = self.view.center}
                scnView.scene?.isPaused = true
            }
            
        }
        
        if (level5Node.isHidden == false) {
            
            if game.score == 6{
                DispatchQueue.main.async{
                self.view.addSubview(self.WinScreen5)
                    self.WinScreen5.center = self.view.center}
                scnView.scene?.isPaused = true
            }
            
        }
        
        if (level6Node.isHidden == false) {
            
            if game.score == 2{
               DispatchQueue.main.async{
                self.view.addSubview(self.WinScreen6)
                self.WinScreen6.center = self.view.center}
                scnView.scene?.isPaused = true
            }
            
        }
        
        if (level7Node.isHidden == false) {
            
            if game.score == 4{
               DispatchQueue.main.async{
                self.view.addSubview(self.WinScreen7)
                self.WinScreen7.center = self.view.center}
                scnView.scene?.isPaused = true
            }
            
        }
        
        if (level8Node.isHidden == false) {
            
            if game.score == 3  {
                DispatchQueue.main.async{
                self.view.addSubview(self.WinScreen8)
                self.WinScreen8.center = self.view.center}
                scnView.scene?.isPaused = true
            }
            
        }
        if (level9Node.isHidden == false) {
            
            if game.score == 7{
                DispatchQueue.main.async{
                self.view.addSubview(self.WinScreen9)
                self.WinScreen9.center = self.view.center}
                scnView.scene?.isPaused = true
            }
            
        }
        
        if (level10Node.isHidden == false) {
            
            if game.score == 6{
                DispatchQueue.main.async{
                self.view.addSubview(self.WinScreen10)
                self.WinScreen10.center = self.view.center}
                scnView.scene?.isPaused = true
            }
            
        }
        
        
        if contactNode.name == "Bottom" {
            game.playSound(node: contactNode, name: "Bottom")
        }
        /// This checks whether the ball is making contact with a brick using the same technique as above
    
//        if contactNode.name == "Bricks" {
//            game.playSound(node: contactNode, name: "Bricks")
//        }
        
        
        
//
        
            if contactNode.physicsBody?.categoryBitMask == ColliderType.brick.rawValue {
//            game.playSound(node: contactNode, name: "Bricks")
                game.playSound(node: ballNode, name: "Bricks")
                game.score += 1
            /// lets the brick disappear for 120 seconds then makes it reappear from the dead like a zombie
            //\(arc4random() % 3)
                contactNode.isHidden = true
              
                
           contactNode.runAction(
               SCNAction.waitForDurationThenRunBlock(duration: 120) {
                   (node:SCNNode!) -> Void in
                   node.isHidden = false
            })
               
        }
        /// The last type of node to check is the paddle, so this checks which part of the paddle the ball hits
        if contactNode.physicsBody?.categoryBitMask == ColliderType.paddle.rawValue {
            game.playSound(node: contactNode, name: "Paddle")
            if contactNode.name == "Left" {
                ballNode.physicsBody!.velocity.xzAngle -= (convertToRadians(angle: 20))
            }
            if contactNode.name == "Right" {
                ballNode.physicsBody!.velocity.xzAngle += (convertToRadians(angle: 20))
            }
        }
        /// forcing the ball to a constant speed of five
        ballNode.physicsBody?.velocity.length = 2.0
    }
}


